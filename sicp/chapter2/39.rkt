; Complete the following definitions of reverse (Exercise 2.18) in terms of fold-right and fold-left from Exercise 2.38:

;;; (define (reverse sequence)
;;;   (fold-right 
;;;    (lambda (x y) ⟨??⟩) nil sequence))

;;; (define (reverse sequence)
;;;   (fold-left 
;;;    (lambda (x y) ⟨??⟩) nil sequence))

#lang sicp

(define (fold-right op init seqs)
  (if (null? seqs)
      init
      (op (car seqs) (fold-right op init (cdr seqs)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


(define (reverse sequence)
  (fold-right 
   (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-alt sequence)
  (fold-left 
   (lambda (x y) (cons y x)) nil sequence))
  
(define x (list 1 2 3 4))
(reverse x)
(reverse-alt x)