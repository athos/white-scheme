(use gauche.test)

(add-load-path "..")

(test-start "compiler")
(load "wsc")
(import white-scheme.compiler)

(test-module 'white-scheme.compiler)

(define main #f)

(test-end)
