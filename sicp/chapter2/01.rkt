; Define a better version of make-rat that handles both positive and negative arguments. 
; Make-rat should normalize the sign so that if the rational number is positive, 
; both the numerator and denominator are positive, and if the rational number is negative, 
;only the numerator is negative.

#lang sicp

(define (make-rat n d)
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
  (let ((g (gcd (abs n) (abs d)))
        (rat-sign (if (> d 0) 1 (- 1))))
    (cons (* (/ n g) rat-sign)
          (* (/ d g) rat-sign))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -1 2)) ; => -1/2
(print-rat (make-rat 1 -2)) ; => -1/2
(print-rat (make-rat -1 -2)) ; => 1/2
(print-rat (make-rat 1 2)) ; => 1/2