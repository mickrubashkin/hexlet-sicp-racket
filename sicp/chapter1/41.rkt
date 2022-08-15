; Define a procedure double that takes a procedure of one argument as argument and returns a procedure that applies the original procedure twice.
; For example, if inc is a procedure that adds 1 to its argument, then (double inc) should be a procedure that adds 2.
; What value is returned by (((double (double double)) inc) 5) ?

#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

(inc 1) ; 2
((double inc) 1) ; 3

((lambda (x) (* x x)) 2) ; 4
((double (lambda (x) (* x x))) 2) ; 16

(((double (double double)) inc) 5) ; 21