#lang sicp
;;; (#%require rackunit)

;;; (define (sqrt x)
;;;   (sqrt-iter 1.0 x))

;;; (define (sqrt-iter guess x)
;;;   (if (good-enough? guess x)
;;;       guess
;;;       (sqrt-iter (improve guess x) x)))

;;; (define (improve guess x)
;;;   (average guess (/ x guess)))

;;; (define (good-enough? guess x)
;;;   (< (abs (- (square guess) x)) 0.001))

;;; (define (square x)
;;;   (* x x))

;;; (define (average x y)
;;;   (/ (+ x y) 2))

;;; (sqrt 9)
;;; (sqrt (+ 100 37))
;;; (sqrt (+ (sqrt 2) (sqrt 3)))
;;; (square (sqrt 1000))

;;; ;;; Bad with small numbers
;;; (square (sqrt 0.0003))
;;; ;;; Bad with big numbers
;;; (square (sqrt 12345678901234))


(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

;;; An alternate strategy is to compare the difference between two guesses
(define (good-enough? guess x)
  ;;; and stop when it reaches the given precision.
  ;;; (< (abs (- (improve guess x) guess)) 0.001))

  ;;; or to stop when they are equal.
  
  (= (improve guess x) guess))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))


(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))

;;; Good with small numbers
(square (sqrt 0.0003))
;;; Good with big numbers
(square (sqrt 12345678901234))