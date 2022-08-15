#lang sicp

; Each of the following two procedures converts a binary tree to a list.

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append 
       (tree->list-1 
        (left-branch tree))
       (cons (entry tree)
             (tree->list-1 
              (right-branch tree))))))

(define (tree->list-2 tree)
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

; 1. Do the two procedures produce the same result for every tree?
;  If not, how do the results differ?
; What lists do the two procedures produce for the trees in Figure 2.16?

; 2. Do the two procedures have the same order of growth
;  in the number of steps required to convert a balanced tree
;  with n elements to a list? If not, which one grows more slowly?

; Unswers.
; 1. The results.
  ; These procedures podice the same result for every tree.
  ; The difference:
  ; tree->list-1 uses recursive process.
  ; tree->list-2 uses iterative process.
  ; The result on trees in Fig. 2.16 is ordered list (1 3 5 7 9 11)

; 2. O().
; tree->list-2 has O(n) order of growth.
; The tree->list-1 order of growth is bigger, because of the recursive call of append procedure.