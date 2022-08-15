; Write a procedure to find all ordered triples of distinct positive integers i, j, 
; and k less than or equal to a given integer n that sum to a given integer s.

#lang sicp

(define (triples-with-sum-equal-s n s)
  (filter
    (lambda (t) (= (accumulate + 0 t) s))
  (unique-triples n)))

(define (unique-triples n)
  (flat-map
    (lambda (i)
      (flat-map
        (lambda (j)
          (map
            (lambda (k) (list i j k))
            (enumerate-interval 1 (- j 1))))
        (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (unique-pairs n)
  (flat-map
    (lambda (i)
      (map
        (lambda (j) (list i j))
        (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (flat-map proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval k n)
  (if (> k n)
      nil
      (append (list k) (enumerate-interval (+ k 1) n))))

(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq))
         (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))


(unique-pairs 4)
(unique-triples 5)
(triples-with-sum-equal-s 5 9) ; ((4 3 2) (5 3 1))