;;; Design a procedure that evolves an iterative exponentiation process
;;; that uses successive squaring and uses a logarithmic number of steps, as does fast-expt.

;;; Hint: Using the observation that (b^(n/2))^2 = (b^2)^(n/2), keep,
;;; along with the exponent n and the base b, an additional state variable a,
;;; and define the state transformation in such a way
;;; that the product a bn is unchanged from state to state.
;;; At the beginning of the process a is taken to be 1,
;;; and the answer is given by the value of a at the end of the process.

#lang sicp

;;; Recursive process.
;;; (define (fast-exp b n)
;;;   (cond ((= n 0) 1)
;;;         ((even? n) (square (fast-exp b (/ n 2))))
;;;         (else (* b (fast-exp b (- n 1))))))

;;; (define (even? x)
;;;   (= (remainder x 2) 0))

;;; (define (square x)
;;;   (* x x))

;;; Iterative process.
(define (fast-exp b n)
  (iter b n 1))

(define (iter b counter acc)
  (cond ((= counter 0) acc)
        ((even? counter) (iter (square b) (/ counter 2) acc))
        (else (iter b (- counter 1) (* b acc)))))

(define (even? x)
  (= (remainder x 2) 0))

(define (square x)
  (* x x))

(fast-exp 2 5)
(fast-exp 2 10)
(fast-exp -2 2)
(fast-exp 10 0)