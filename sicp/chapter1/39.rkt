; A continued fraction representation of the tangent function was published in 1770 by the German mathematician J.H. Lambert:
; tg x = x / (1 - (x^2 / (3 - (x^2 / (5 - ...)))))
; where x is in radians.

; Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert's formula.
; K specifies the number of terms to compute, as in exercise 1.37.

#lang sicp

(define (cont-frac n d k)
  (define (iter i acc)
    (let ((acc (/ (n i) (+ (d i) acc)))
          (i (- i 1)))
      (if (= i 0)
          acc
          (iter i acc))))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x))))
             (lambda (i) (- (* 2.0 i) 1))
             k))

(tan-cf 45 100) ; => 1.6197751905438595
(tan 45)        ; => 1.6197751905438615



