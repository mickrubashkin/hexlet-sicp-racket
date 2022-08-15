; In 1737, the Swiss mathematician Leonhard Euler published a memoir De Fractionibus Continuis, which included a continued fraction expansion for (e - 2), where e is the base of the natural logarithms.
; In this fraction, the Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...
; Write a program that uses your cont-frac procedure from exercise 1.37 to approximate e, based on Euler's expansion.

#lang sicp

(define (cont-frac n d k)
  (define (iter i acc)
    (let ((acc (/ (n i) (+ (d i) acc)))
          (i (- i 1)))
      (if (= i 0)
          acc
          (iter i acc))))
  (iter k 0))

(+ 2
   (cont-frac (lambda (i) 1.0)
              (lambda (i)
                (if (= (remainder i 3) 2)
                    (* 2 (/ (+ i 1) 3))
                    1))
              1000))
; 2.7182818284590455