#lang sicp

(define (sum term a next b)
  (if (> a b)
  0
  (+ (term a)
     (sum term (next a) next b))))

;;; Using Simpson's Rule, the integral of a function f between a and b is approximated as
;;; (h/3)*[y0 +4y1 +2y2 +4y3 +2y4 +...+2yn−2 +4yn−1 +yn]
;;; where h = (b - a)/n, for some even integer n, and yk = f(a + kh).
;;; (Increasing n increases the accuracy of the approximation.)
;;; Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson's Rule.
;;; Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000),
;;; and compare the results to those of the integral procedure shown above.

(define (simpsons-integral f a b n)
  (define h (/ (- b a) n))
  (define (g k)
    (define (c k)
      (cond ((= k 0) 1)
            ((= k n) 1)
            ((even? k) 2)
            (else 4)))
    (define (y k) (f (+ a (* k h))))
  (* (c k) (y k)))
  (define (inc k) (+ k 1))

  (* (/ h 3) 
     (sum g 0 inc n)))

(define (cube a)
  (* a a a))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(simpsons-integral cube 0 1 100) ; 1/4
(simpsons-integral cube 0 1.0 100) ; 0.24999999999999992
(integral cube 0 1 0.01) ; 0.24998750000000042
(simpsons-integral cube 0 1 1000) ; 1/4
(simpsons-integral cube 0 1.0 1000) ; 0.2500000000000003
(integral cube 0 1 0.001) ; 0.249999875000001