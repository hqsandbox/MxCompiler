# .PHONY: build
# build:
# 	find src -name '*.java' | xargs javac -d bin -cp /ulib/antlr-4.13.2-complete.jar
# .PHONY: run
# run:
# 	cd bin && java -cp /ulib/antlr-4.13.2-complete.jar:. Main
#
# .PHONY: run1
# run1:
# 	cd bin && java -cp ./ulib/antlr-4.13.2-complete.jar:. Main

# .PHONY: Semall
# Semall: build
# 	./testcases/sema/scripts/test_all.bash 'java -cp ./ulib/antlr-4.13.2-complete.jar:bin Main' testcases/sema/
# #
.PHONY: build
build:
	find src -name '*.java' | xargs javac -d bin -cp /ulib/antlr-4.13.2-complete.jar
# .PHONY: run
# run:
# 	cd bin && java -cp ../ulib/antlr-4.13.2-complete.jar:. Main
#
# .PHONY: run
# run:
# 	cd bin && java -cp /ulib/antlr-4.13.2-complete.jar:. Main


# .PHONY: compile
# compile:
# 	find src -name '*.java' | xargs javac -d bin -cp ./ulib/antlr-4.13.2-complete.jar

.PHONY: run
test:
	cd bin && java -cp /ulib/antlr-4.13.2-complete.jar:. Main

# .PHONY: visit
# visit:
# 	java -cp ulib/antlr-4.13.1-complete.jar org.antlr.v4.Tool $* -no-listener -visitor guqin.g4
