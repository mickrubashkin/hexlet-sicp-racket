; Implement the lookup procedure for the case where the set of records
; is structured as a binary tree, ordered by the numerical values of the keys.

#lang sicp

(define (look-up given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((= given-key (key (entry set-of-records)))
         (entry set-of-records))
        ((< given-key (key (entry set-of-records)))
         (look-up given-key (left-branch set-of-records)))
        (else (look-up given-key (right-branch set-of-records)))))