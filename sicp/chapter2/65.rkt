; Use the results of Exercise 2.63 and Exercise 2.64 to give Θ(n) implementations
; of union-set and intersection-set for sets implemented as (balanced) binary trees.

#lang sicp

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list 
         (left-branch tree)
         (cons (entry tree)
               (copy-to-list 
                (right-branch tree)
                result-list)))))
  (copy-to-list tree '()))

(define (list->tree elements)
  (car (partial-tree 
        elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size 
             (quotient (- n 1) 2)))
        (let ((left-result 
               (partial-tree 
                elts left-size)))
          (let ((left-tree 
                 (car left-result))
                (non-left-elts 
                 (cdr left-result))
                (right-size 
                 (- n (+ left-size 1))))
            (let ((this-entry 
                   (car non-left-elts))
                  (right-result 
                   (partial-tree 
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree 
                     (car right-result))
                    (remaining-elts 
                     (cdr right-result)))
                (cons (make-tree this-entry 
                                 left-tree 
                                 right-tree)
                      remaining-elts))))))))

(define (union-set-tree set1 set2)
  (list->tree
    (union-set
      (tree->list set1)
      (tree-list set2))))

(define (intersection-set-tree set1 set2)
  (list->tree
    (intersection-set
      (tree->list set1)
      (tree->list set2))))
