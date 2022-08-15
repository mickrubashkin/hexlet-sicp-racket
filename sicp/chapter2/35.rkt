; Redefine count-leaves from 2.2.2 as an accumulation:

;;; (define (count-leaves t)
;;;   (accumulate ⟨??⟩ ⟨??⟩ (map ⟨??⟩ ⟨??⟩)))

#lang sicp

(define (count-leaves t)
  (accumulate
    +
    0
    (map
      (lambda (x) 1)
      (enumerate-tree t))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define x (list 1 (list 2 3 (list 4 5)) (list 6 7) 8))

x ; (1 (2 3 (4 5)) (6 7) 8)
(count-leaves x) ; 8