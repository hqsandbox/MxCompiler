import os
import re
import subprocess

test_file = []
testcases_folder = r'../testcases/codegen'

def traverse_directory(dir_path):
    for root, dirs, files in os.walk(dir_path):
        for name in files:
            if name.endswith('.mx') or name.endswith('.mt'):
                test_file.append(os.path.join(root, name))

traverse_directory(testcases_folder)

def extract_input_output_exitcode(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
    input_regex = r'Input:\n=== input ===\n(.*?)\n=== end ==='
    output_regex = r'Output:\n=== output ===\n(.*?)\n=== end ==='
    exitcode_regex = r'ExitCode: (.+)'
    input_match = re.search(input_regex, content, re.DOTALL)
    output_match = re.search(output_regex, content, re.DOTALL)
    exitcode_match = re.search(exitcode_regex, content)
    if input_match:
        input_data = input_match.group(1).strip()
    else:
        input_data = ""
    if output_match:
        output_data = output_match.group(1)
    else:
        output_data = ""
    if exitcode_match:
        exitcode = exitcode_match.group(1).strip()
    else:
        exitcode = ""
    return content, input_data, output_data, exitcode

def extract_cycles_exitcode(stderr):
	cycle_regex = r'Total cycles: (\d+)'
	exco_regex = r'Exit code: (\d+)'
	cycle_match = re.search(cycle_regex, stderr)
	exco_match = re.search(exco_regex, stderr)
	if cycle_match:
		c = cycle_match.group(1)
	else:
		c = ""
	if exco_match:
		ex = int(exco_match.group(1))
	else:
		ex = None
	return c, ex
commands = 'make compile'
process = subprocess.Popen(commands, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, shell=True)
_, _ = process.communicate(input="")
process.terminate()

red_msg = "\033[31m{msg}\033[0m"
green_msg = "\033[32m{msg}\033[0m"
blue_msg = "\033[34m{msg}\033[0m"
pass_cnt = 0

for testcase in test_file:
# testcase = r'../testcases/codegen/e1.mx'
	try:
		content, input_data, output_data, exitcode = extract_input_output_exitcode(testcase)
		temp = open('test.in', 'w')
		temp.write(input_data)
		temp.flush()
		commands = 'cd .. && make run'
		process = subprocess.Popen(commands, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, shell=True)
		_, _ = process.communicate(input=content)
		compile_status = process.returncode
		if compile_status != 0:
			raise Exception("run Compile Error")
		process.terminate()
		with open('test.in', 'w') as f:
			f.write(input_data)
			f.flush()
		commands = 'mv ../bin/test.s test.s && reimu -i=test.in -o=test.out -s=1M'
		process = subprocess.Popen(commands, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, shell=True)
		content, stderr = process.communicate(input="")
		compile_status = process.returncode
		if compile_status != 0:
			raise Exception("Binary Compile Error")
		process.terminate()
		with open('test.out', 'r') as f:
			stdout = f.read()
		cycle, returncode = extract_cycles_exitcode(stderr)
		print(testcase, green_msg.format(msg="output") if stdout == output_data else red_msg.format(msg="output"),
						green_msg.format(msg="retcode") if returncode == int(exitcode.strip()) else red_msg.format(msg="retcode"), end=' ')

		if stdout == output_data and returncode == int(exitcode.strip()):
			print(cycle)
			pass_cnt += 1
		else:
			print('')
	except Exception as e:
		print(testcase, red_msg.format(msg=e))

print("\033[32mPassed Cases:", pass_cnt, f"\033[0m, \033[34mTotal Cases: {len(test_file)}\033[0m")