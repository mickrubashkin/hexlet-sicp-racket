; Define a procedure square-tree analogous to the square-list procedure of Exercise 2.21. 
; That is, square-tree should behave as follows:

;;; (square-tree
;;;  (list 1
;;;        (list 2 (list 3 4) 5)
;;;        (list 6 7)))

;;; (1 (4 (9 16) 25) (36 49))

; Define square-tree both directly (i.e., without using any higher-order procedures) 
; and also by using map and recursion.

#lang sicp

(define (square x) (* x x))

(define (square-tree-direct tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-direct (car tree))
                    (square-tree-direct (cdr tree))))))

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (square sub-tree)
             (square-tree sub-tree)))
       tree))

(define x
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

x ; => (1 (2 (3 4) 5) (6 7))
(square-tree-direct x) ; => (1 (4 (9 16) 25) (36 49))
(square-tree x) ; => (1 (4 (9 16) 25) (36 49))