; Here is an alternative procedural representation of pairs. 
; For this representation, verify that (car (cons x y)) yields x for any objects x and y.
; What is the corresponding definition of cdr? 
; (Hint: To verify that this works, make use of the substitution model of 1.1.5.)

#lang sicp

(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))

; Lets use the substitution model
(car z)
; car => (z (lambda (p q) p))
; z => (lambda (m) (m x y))
((lambda (m) (m x y))
  (lambda (p q) p))

((lambda (p q) p) x y) ; => x

; The corresponding definition of cdr.
(define (cdr z)
  (z (lambda (p q) q)))