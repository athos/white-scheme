all:

check:
	rm -f test.log
	cd tests; $(MAKE) check

clean:
	cd tests; $(MAKE) clean
	rm -rf *.log *~
