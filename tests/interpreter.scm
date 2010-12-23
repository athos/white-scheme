(use gauche.test)

(add-load-path "..")

(test-start "interpreter")
(load "wsi")
(import white-scheme.interpreter)

(test-module 'white-scheme.interpreter)

(test-section "test parser")

(define (parse* code)
  (with-module white-scheme.interpreter
    (parse code *tokens->insn-parser*)))

(define *code*
  '(S S S T L L S S S T S S S S T T L S L S T L S T
    S S S T S T S L T L S S S S S T L T S S S S L S
    S S S T S T T L T S S T L T S S T S S S T S T L
    L S L S T S S S S T T L L S S S T S S S T S T L
    S L L L L L))

(define *insns*
  '((PUSH 1) (LABEL STSSSSTT) (DUP) (PUTN) (PUSH 10)
    (PUTC) (PUSH 1) (ADD) (DUP) (PUSH 11) (SUB)
    (BZERO STSSSTST) (JUMP STSSSSTT) (LABEL STSSSTST)
    (POP) (QUIT)))

(test* "parse code" *insns* (parse* *code*))
(test* "incomplete instruction" (test-error) (parse* '(S T)))
(test* "incomplete number" (test-error) (parse* '(S S S)))
(test* "imcomplete label" (test-error) (parse* '(L S S S T)))

(test-end)
