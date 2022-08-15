; We specified that a set would be represented as a list with no duplicates.
; Now suppose we allow duplicates. 
; For instance, the set {1,2,3} could be represented as the list (2 3 2 1 3 2 2).
; Design procedures element-of-set?, adjoin-set, union-set, and intersection-set that operate on this representation.
; How does the efficiency of each compare with the corresponding procedure for the non-duplicate representation?
; Are there applications for which you would use this representation in preference to the non-duplicate one?

#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) 
         '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) 
                                 set2)))
        (else (intersection-set (cdr set1) 
                                set2))))


(element-of-set? 'a '()) ; #f
(element-of-set? 'a '(a b c)) ; #t
(adjoin-set 'a '()) ; (a)
(adjoin-set 'a '(b c d)) ; (a b c d)
(adjoin-set 'a '(a b a c)) ; (a a b a c)
(union-set '(1 2 3) '()) ; (1 2 3) 
(union-set '(1 2 3) '(4 5 6)) ; (1 2 3 4 5 6)
(union-set '(2 3 2) '(1 2 3)) ; (2 3 2 1 2 3)
(intersection-set '(2 3 2) '(1 2 3)) ; (2 3 2)

; operation | O(n) with duplicates | O(n) without duplicates | comments
; element-of-set? | O(n) | O(n) | the length of set with duplicates could be bigger.
; adjoin-set | const | O(n) | adjoin-set is more effective in case of duplicates.
; union-set | O(n) | O(n**2) | union-set is more effective in case of duplicates.
; intersection-set | O(n**2) | O(n**2) | the length of set with duplicates could be bigger.

; Hence, it is ok to use sets with duplicates in case of
  ; adjoin and union,
  ; but not in case of  searcing element and intersection.