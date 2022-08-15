#lang sicp

(#%require rackunit)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;;; Evaluation examples

;;; (a-plus-abs-b 2 (- 1))
;;; ((if (> -1 0) + -) 2 -1)
;;; ((if #f + -) 2 -1)
;;; (- 2 -1)
;;; 3

;;; (a-plus-abs-b 2 1)
;;; ((if (< 1 0) + -) 2 1)
;;; ((if #t + -) 2 1)
;;; (+ 2 1)
;;; 3

(check-equal? (a-plus-abs-b 2 1) 3)
(check-equal? (a-plus-abs-b 2 (- 1)) 3)
