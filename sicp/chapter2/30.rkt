; Abstract your answer to Exercise 2.30 to produce a procedure tree-map 
; with the property that square-tree could be defined as

; (define (square-tree tree) 
;   (tree-map square tree))

#lang sicp

(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (proc sub-tree)
             (tree-map proc sub-tree)))
       tree))

(define (square-tree tree) 
  (tree-map square tree))

(define (square x) (* x x))

(define x
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

x ; => (1 (2 (3 4) 5) (6 7))
(square-tree x) ; => (1 (4 (9 16) 25) (36 49))