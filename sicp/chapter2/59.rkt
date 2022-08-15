; Implement the union-set operation for the unordered-list representation of sets.

#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set) (if (element-of-set? x set)
      set
      (cons x set)))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else
          (cons
            (car set1)
            (union-set (cdr set1) set2)))))

(define S '(a b c))
(define T '(d e f))
(define Y '(g b h e i))
(define ST (union-set S T))
(display ST) ; (a b c d e f)

(define YST (union-set Y ST))
(newline)
(display YST) ; (g h i ab c d e f)