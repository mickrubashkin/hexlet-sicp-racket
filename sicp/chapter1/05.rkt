#lang sicp

;;; (#%require rackunit)

; Normal-order evaluation: fully expand and then reduce.
; Applicative-order evaluation: evaluate the arguments and then apply.

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;;; (test 0 (p))

; Normal-order
; (test 0 (p))
;
; (if (= 0 0)
;     0
;     (p))
;
; (if (#t) 0 (p))
; 0
;
; Evaluates to 0

; Applicative-order
; (test 0 (p))
; (test 0 (p)) ; Will never terminates because it will always try to evaluate (p)
; (test 0 (p))