#lang sicp

(#%require rackunit)

(define (sumsquares-two-largest a b c)
  (define (sum-of-squares x y) (+ (* x x) (* y y)))
  (cond ((and (< c a) (< c b)) (sum-of-squares a b))
        ((and (< b a) (< b c)) (sum-of-squares a c))
        (else (sum-of-squares b c))))

(check-equal? (sumsquares-two-largest 1 2 3) (+ (* 2 2) (* 3 3)) "1 2 3; choose 2 3")
(check-equal? (sumsquares-two-largest 3 2 1) (+ (* 2 2) (* 3 3)) "3 2 1; choose 2 3")
(check-equal? (sumsquares-two-largest 4 1 (- 2)) (+ (* 1 1) (* 4 4)) "4 1 -2; choose 1 4")