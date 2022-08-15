; Right-split and up-split can be expressed as instances of a general splitting operation. 
; Define a procedure split with the property that evaluating

; (define right-split (split beside below))
; (define up-split (split below beside))

; produces procedures right-split and up-split with the same behaviors 
; as the ones already defined.

#lang sicp

(define (split first-transform second-transform)
  (define (any-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (any-split (- n 1))))
          (first-transform (second-transform  smaller smaller)))))
  any-split)