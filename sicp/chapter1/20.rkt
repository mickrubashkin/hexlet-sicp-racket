;;; Method for computing the GCD, known as Euclid's Algorithm.

#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;;; This generates an iterative process, whose number of steps grows as the logarithm of the numbers involved.
;;; The process that a procedure generates is of course dependent on the rules used by the interpreter.
;;; As an example, consider the iterative gcd procedure given above.
;;; Suppose we were to interpret this procedure using normal-order evaluation.

;;; Step 1.
;;; Using the substitution method (for normal order), illustrate the process generated in evaluating (gcd 206 40)
;;; and indicate the remainder operations that are actually performed.
;;; (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order:
;;; The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)
; Answer: 18 times.
; remainder: 0
; (gcd 206 40)
; ; remainder: 0
; (if (= 40 0)
;     206
;     (gcd 40 (remainder 206 40)))
; ;remainder: 0
; (gcd 40 (remainder 206 40))
; ;remainder: 0
; (if (= (remainder 206 40) 0) ; (= 6 0)
;     40
;     (gcd (remainder 206 40)
;          (remainder 40 (remainder 206 40))))
; ; remainder: 1
; (gcd (remainder 206 40)
;      (remainder 40 (remainder 206 40)))
; ; remainder: 1
; (if (= (remainder 40 (remainder 206 40) 0) ;(= 4 0)
;     (gcd (remainder 40 (remainder 206 40))
;          (remainder (reminder 206 40) (reminder 40 (reminder 206 40))))))
; ;remainder: 3
; (gcd (remainder 40 (remainder 206 40))
;      (remainder (reminder 206 40) (reminder 40 (reminder 206 40))))
; ;remainder: 3
; (if (= (remainder (reminder 206 40) (reminder 40 (reminder 206 40))) 0) ;(= 2 0)
;     (remainder (reminder 206 40) (reminder 40 (reminder 206 40)))
;     (gcd (remainder (reminder 206 40) (reminder 40 (reminder 206 40)))
;          (remainder (remainder 40 (remainder 206 40))
;                     (remainder (reminder 206 40) (reminder 40 (reminder 206 40))))))
;remainder: 3 + 4
; (gcd (remainder (reminder 206 40) (reminder 40 (reminder 206 40)))
;      (remainder (remainder 40 (remainder 206 40)) (remainder (reminder 206 40) (reminder 40 (reminder 206 40)))))
; ;remainder: 7
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (reminder 206 40) (reminder 40 (reminder 206 40)))) 0) ; (= 0 0)
;     (remainder (reminder 206 40) (reminder 40 (reminder 206 40)))
;     <else clause>
;remainder: 7 + 7
; (remainder (reminder 206 40) (reminder 40 (reminder 206 40)))
;reminder: 14 + 4
; 2

;;; Step 2.
;;; How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)?
; Answer: 18 times.

;;; Step 3.
;;; In the applicative-order evaluation?
; Answer: 4 times.
; (gcd 206 40)
; (if (= 40 0)
;     40
;     (gcd 40 (remainder 206 40))))
; (gcd 40 (remainder 206 40)) ; r: 1
; (gcd 40 6)
; (if (= 6 0)
;     6
;     (gcd 6 (remainder 40 6))) ; r: 2
; (gcd 6 4)
; (if (= 4 0)
;     4
;     (gcd 4 (remainder 6 4))) ; r: 3
; (gcd 4 2)
; (if (= 2 0)
;     2
;     (gcd 2 (remainder 4 2))) ; r: 4
; (gcd 2 0)
; (if (= 0 0)
;     2
;     0)
; 2