(use gauche.test)

(add-load-path "..")

(test-start "interpreter")
(load "wsi")
(import white-scheme.interpreter)

(test-module 'white-scheme.interpreter)

(test-section "test parser")

(define main #f)

(test-end)
