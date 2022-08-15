#lang sicp

(define (3rt x)
  (3rt-iter 1.1 x))

(define (3rt-iter guess x)
  (if (good-enough? guess x)
      guess
      (3rt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (improve guess x)
  (/ (+ (/ x 
           (square guess))
        (* 2 guess))
      3))

(define (square x)
  (* x x))

(3rt 27) ; => 3.0
(3rt 5) ; => 1.709975946676697
(3rt -2) ; => -1.2599210498948732
(3rt 100000000000000) ; => 46415.88833612779

(define (cube x)
  (* x x x))

(3rt (cube 3)) ; => 3.0
(3rt (cube 1000)) ; => 1000.0