#lang sicp

(#%require rackunit)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; This implementation of sqrt will never terminate because of
; application-order of new-if procedure.

;;; Evaluation process
;;; (sqrt 2)

;;; (sqrt-iter 1.0 2)

;;; (new-if (good-enough? 1.0 2)
;;;         1.0
;;;         (sqrt-iter (improve 1.0 2) 2))

;;; (cond ((good-enough? 1.0 2) 1.0)
;;;       (else (sqrt-iter (improve 1.0 2) 2)))
;;; And here we recursively fall into sqrt-iter because of application-order of new-if.
;;; Sqrt-iter will call new-if again, and it will call sqrt-iter and so on...
;;; (We have to first evaluate all operands of new-if procedure)