脚本运行：
  untitled目录下：
    make compile
    make test(可选)
  src目录下：
    python3 test.py(所有点)
    python3 test_single.py(单点: 11.mx)

单点运行：
main函数里面输入为文件test，直接运行得到output.ll
src目录下：
    clang-15 -m32 IR/Util/builtin/builtin.ll output.ll -o test
    ./test

生成builtin.ll:
clang-15 -S -emit-llvm --target=riscv32-unknown-elf -O2 -fno-builtin-printf -fno-builtin-memcpy builtin.c -o builtin_intermediate.ll
sed 's/string_/string./g;s/array_/array./g' builtin_intermediate.ll > builtin.ll
rm builtin_intermediate.ll