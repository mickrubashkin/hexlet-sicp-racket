#lang sicp

;;; (define (prime-sum-pairs n)
;;;   (map make-pair-sum
;;;        (filter prime-sum?
;;;                (flatmap
;;;                  (lambda (i)
;;;                    (map (lambda (j) (list i j))
;;;                         (enumerate-interval 1 (- i 1))))
;;;                  (enumerate-interval 1 n)))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

; Define a procedure unique-pairs that, given an integer n, 
; generates the sequence of pairs (i,j) with 1≤j<i≤n. 
; Use unique-pairs to simplify the definition of prime-sum-pairs given above.

(define (unique-pairs n)
  (flat-map
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))