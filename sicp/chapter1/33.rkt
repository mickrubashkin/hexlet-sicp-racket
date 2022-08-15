;;; You can obtain an even more general version of accumulate (exercise 1.32)
;;; by introducing the notion of a filter on the terms to be combined.
;;; That is, combine only those terms derived from values in the range that satisfy a specified condition.
;;; The resulting filtered-accumulate abstraction takes the same arguments as accumulate,
;;; together with an additional predicate of one argument that specifies the filter.

;;; Write filtered-accumulate as a procedure.
;;; Show how to express the following using filtered-accumulate:
  ;;; a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)
  ;;; b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

#lang sicp

; Recur
(define (filtered-accumulate-recur combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b))
          (filtered-accumulate combiner null-value term (next a) b filter))))

; Iter
(define (filtered-accumulate-iter combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (filter a)
                  (combiner result (term a))
                  result))))
  (iter a null-value))

; Uses accumulate.
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
  (define (new-term a)
    (if (filter a)
        (term a)
        null-value))
  (accumulate combiner null-value new-term a next b))

; The sum of the squares of the prime numbers in the interval a to b
; (assuming that you have a prime? predicate already written).
; (define (sum-of-squares-prime a b)
;   (define (square a) (* a a))
;   (define (inc a) (+ a 1))
;   (filtered-accumulate + 0 square a inc b prime?))


; The product of all the positive integers less than n that are relatively prime to n
; (i.e., all positive integers i < n such that GCD(i,n) = 1).
(define (product-of-relatively-primes n)
  (define (identity a) a)
  (define (inc a) (+ a 1))
  (define (relatively-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate * 1 identity 1 inc n relatively-prime?))