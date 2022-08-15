; Evaluating a polynomial in x at a given value of x can be formulated as an accumulation. 
; We evaluate the polynomial An * x^n + (An−1) * x^(n−1) + ... + A1 * x + A0
; using a well-known algorithm called Horner’s rule, which structures the computation as
; (...(An * x + An−1) * x + ... + A1) * x + A0.
; In other words, we start with An, multiply by x, add An−1, multiply by x, 
; and so on, until we reach A0.

; Fill in the following template to produce a procedure that evaluates a polynomial using Horner’s rule. 
; Assume that the coefficients of the polynomial are arranged in a sequence, from A0 through An.

;;; (define 
;;;   (horner-eval x coefficient-sequence)
;;;   (accumulate 
;;;    (lambda (this-coeff higher-terms)
;;;      ⟨??⟩)
;;;    0
;;;    coefficient-sequence))

; For example, to compute 1+3x+5x^3+x^5 at x=2 you would evaluate

;;; (horner-eval 2 (list 1 3 0 5 0 1)) ; 79

#lang sicp

(define 
  (horner-eval x coefficient-sequence)
  (accumulate 
   (lambda (this-coeff higher-terms)
     (+ this-coeff (* higher-terms x)))
   0
   coefficient-sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(horner-eval 2 (list 1 3 0 5 0 1)) ; => 79