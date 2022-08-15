; Two lists are said to be equal? if they contain equal elements arranged in the same order. 
; For example,

; (equal? '(this is a list) 
;         '(this is a list))
; is true, but

; (equal? '(this is a list) 
;         '(this (is a) list))
; is false. 

; To be more precise, we can define equal? recursively 
; in terms of the basic eq? equality of symbols by saying that a and b are equal? 
; if they are both symbols and the symbols are eq?, 
; or if they are both lists such that (car a) is equal? to (car b) 
; and (cdr a) is equal? to (cdr b). Using this idea, implement equal? as a procedure.

#lang sicp

(define (equal? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((and (symbol? a) (symbol? b))
          (eq? a b))
        ((and (number? a) (number? b))
          (= a b))
        ((and (pair? a) (pair? b))
          (and (equal? (car a) (car b))
               (equal? (cdr a) (cdr b))))
        (else #f)))

(equal? 'a 'a) ; #t
(equal? 'a 'b) ; #f
(equal? '1 1) ; #t
(equal? 1 1) ; #t
(equal? 1 1.0) ; #t
(equal? '1 (- 3 2.0)) ; #t
(equal? 'a 'b) ; #f
(equal? 'a 1) ; #f
(equal? '(1 2 3) '(1 2 3)) ; #t
(equal? '(a b c) '(a (b) c)) ; #f
(equal? (list 1 2 3) (list 1 2 3)) ; #t
(equal? '(this is a list) 
        '(this is a list)) ; #t

(equal? '(this is a list) 
        '(this (is a) list)) ; #f