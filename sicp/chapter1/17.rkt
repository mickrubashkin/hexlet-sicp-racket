#lang sicp

;;; Multiplication in terms of repeated addition.
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

;;; This algorithm takes a number of steps that is linear in b.
;;; Suppose we include, together with addition, operations double, which doubles an integer,
;;; and halve, which divides an (even) integer by 2.
;;; Using these, design a multiplication procedure that uses a logarithmic number of steps.

(define (fast-* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-* a (half b))))
        (else (+ a (fast-* a (- b 1))))))

(define (even? num)
  (= (remainder num 2) 0))

(define (double num)
  (+ num num))

(define (half num)
  (/ num 2))