emacs ?= emacs
all: test

test:
	$(emacs) -Q -batch -l asasm-mode-test.el -l asasm-mode.el -f ert-run-tests-batch-and-exit

compile:
	$(emacs) -Q -batch -f batch-byte-compile asasm-mode.el

clean:
	rm -f asasm-mode.elc

.PHONY:	all test compile clean
