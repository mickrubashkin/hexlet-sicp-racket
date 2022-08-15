; Show that we can represent pairs of nonnegative integers 
; using only numbers and arithmetic operations if we represent the pair a and b 
; as the integer that is the product (2^a * 3^b). 
; Give the corresponding definitions of the procedures cons, car, and cdr.

#lang sicp

(define (cons a b)
  (define (power x n)
    (if (= n 1)
        x
        (* x (power x (- n 1)))))
  (* (power 2 a) (power 3 b)))

(define (car p)
  (define (factor base n)
    (if (= (remainder n base) 0)
        (+ 1 (factor base (/ n base)))
        0))
  (factor 2 p))

(define (cdr p)
  (define (factor base n)
    (if (= (remainder n base) 0)
        (+ 1 (factor base (/ n base)))
        0))
  (factor 3 p))

; To show that we can represent pairs in such a way we have to show that
; (car (cons x y))  => x
; (cdr (cons x y)) => y
; (factor 2 p) => x, (factor 3 p) => y, where p is (2^x * 3^y)