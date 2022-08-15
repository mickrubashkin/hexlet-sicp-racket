
#lang sicp

;;; Tribonacci numbers.
;;; f(n) = n, if n < 3,
;;; f(n) = f(n−1) + 2f(n−2) + 3f(n−3), if n >= 3.
;;; Write a procedure that computes f by means of a recursive process.
;;; Write a procedure that computes f by means of an iterative process.

;;; Recursive process implementation.
(define (tribonacci n)
  (if (< n 3)
      n
      (+ (tribonacci (- n 1))
         (* 2 (tribonacci (- n 2)))
         (* 3 (tribonacci (- n 3))))))

(tribonacci -1) ; => -1
(tribonacci 0) ; => 0
(tribonacci 1) ; => 1
(tribonacci 2) ; => 2
(tribonacci 3) ; => 4
(tribonacci 4) ; => 11
(tribonacci 5) ; => 25
(tribonacci 6) ; => 59
(tribonacci 33) ; => 821337484081
;;; Iterative process implementation.
;;; a => a + 2b + 3c
;;; b => a
;;; c => b
(define (tribonacci-iter n)
  (define (iter a b c counter)
  (if (= counter 0)
      c
      (iter (+ a (* 2 b) (* 3 c)) a b (- counter 1))))

  (if (< n 3)
      n
      (iter 2 1 0 n)))  

;;; (define (trib-iter a b c counter)
;;;   (if (= counter 0)
;;;       c
;;;       (trib-iter (+ a (* 2 b) (* 3 c)) a b (- counter 1))))

(tribonacci-iter -1) ; => -1
(tribonacci-iter 0) ; => 0
(tribonacci-iter 1) ; => 1
(tribonacci-iter 2) ; => 2
(tribonacci-iter 3) ; => 4
(tribonacci-iter 4) ; => 11
(tribonacci-iter 5) ; => 25
(tribonacci-iter 6) ; => 59
(tribonacci-iter 33) ; => 821337484081
(tribonacci-iter 1000)