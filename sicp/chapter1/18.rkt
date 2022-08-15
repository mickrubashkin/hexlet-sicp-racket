;;; Devise a procedure that generates an iterative process for multiplying two integers
;;; in terms of adding, doubling, and halving and uses a logarithmic number of steps.

#lang sicp

(define (fast-multiply a b)
  (iter a b 0))

(define (iter a b acc)
  (cond ((= 0 b) acc)
        ((even? b) (iter (double a) (half b) acc))
        (else (iter a (- b 1) (+ acc a)))))

(define (double num)
  (+ num num))

(define (half num)
  (/ num 2))