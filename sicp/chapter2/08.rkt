; Using reasoning analogous to Alyssa’s, 
; describe how the difference of two intervals may be computed. 
; Define a corresponding subtraction procedure, called sub-interval.

#lang sicp

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (car interval))

(define (lower-bound interval) (cdr interval))

(define (sub-interval a b)
  (make-interval
    (- (lower-bound a) (upper-bound b))
    (- (upper-bound a) (lower-blund b))))
