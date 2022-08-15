#lang sicp

; The accumulate procedure is also known as fold-right, 
; because it combines the first element of the sequence 
; with the result of combining all the elements to the right.
; There is also a fold-left, which is similar to fold-right, 
; except that it combines elements working in the opposite direction:
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

; What are the values of

(fold-right / 1 (list 1 2 3)) ; (/ 1 (/ 2 (/ 3 1))) => 3/2
(fold-left  / 1 (list 1 2 3)) ; (/ (/ (/ 1 1) 2) 3) => 1/6
(fold-right list nil (list 1 2 3)) ; (list 1 (list 2 (list 3 ()))) => (1 (2 (3 ())))
(fold-left  list nil (list 1 2 3)) ; (list (list (list 1 ()) 2) 3) => (((() 1) 2) 3)

; Give a property that op should satisfy to guarantee 
; that fold-right and fold-left will produce the same values for any sequence.

; (define seq (list a1 a2 a3 ... an))
; (define res-right (fold-right op init seq)) => (op a1 (op a2 (op ...(op an))))
; (define res-left (fold-left op init seq)) => (op (op (op ... (op an) ...) a2) a1)
; 
; res-right will be equal to res-left if
; 1. (= (op a1 a2) (op a2 a1))
; 2. (= (op a1 (op a2 a3)) (op (op a1 a2) a3))