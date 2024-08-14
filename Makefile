.PHONY: build
build:
	find src -name '*.java' | xargs javac -d bin -cp /ulib/antlr-4.13.2-complete.jar

# .PHONY: run
# run:
# 	cd bin && java -cp /ulib/antlr-4.13.2-complete.jar:. Main

.PHONY: run
run:
	cd bin && java -cp /ulib/antlr-4.13.2-complete.jar:. Main

.PHONY: compile
compile:
	find -name '*.java' | xargs javac -d bin -cp ulib/antlr-4.13.2-complete.jar

.PHONY: test
test:
	@cd bin && java -cp antlr-4.13.2-complete.jar:. Main

.PHONY: visit
visit:
	java -cp ulib/antlr-4.13.1-complete.jar org.antlr.v4.Tool $* -no-listener -visitor guqin.g4
