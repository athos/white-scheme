TEST = interpreter.scm compiler.scm

all:

check:
	for file in $(TEST); do gosh $$file; done >> ../test.log

clean:
	rm -rf *~
