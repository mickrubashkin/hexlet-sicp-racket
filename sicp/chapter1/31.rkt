;;; The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.
;;; Write an analogous procedure called product that returns the product of the values of a function at points over a given range. 
;;; Show how to define factorial in terms of product. 
;;; Also use product to compute approximations to  using the formula
;;; pi / 4 = (2 * 4 * 4 * 6 * 6 * 8 * ...) / (3 * 3 * 5 * 5 * 7 * 7 * ...)
;;; If your product procedure generates a recursive process, write one that generates an iterative process.
;;; If it generates an iterative process, write one that generates a recursive process.

#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (fact n)
  (define (identity a) a)
  (define (inc a) (+ a 1))
  (product identity 1 inc n))

(fact 5) ; 120

(define (count-pi n)
  (define (term k)
    (define (square a) (* a a))
    (/ (* (- k 1) (+ k 1))
       (square k)))
  (define (next k) (+ k 2))
  (* (product term 3.0 next n)
     4))

(count-pi 1000000) ; 3.1415942243865067