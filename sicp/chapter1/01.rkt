#lang sicp

(#%require rackunit)

(define solution1 10)

(define solution2
  (+ 5 3 4))

(define solution3
  (- 9 1))

(define solution4
  (/ 6 2))

(define solution5
  (+ (* 2 4)
     (- 4 6)))

(define a 3)

(define b (+ a 1))

(define solution6
  (+ a b (* a b)))

(define solution7
  (if (and (> b a) (< b (* a b)))
      b
      a))

(define solution8
  (cond ((= a 4) 6)
        ((= b 4) (+ 6 7 a))
        (else 25)))

(define solution9
  (+ 2 (if (> b a) b a)))

(define solution10
  (* (cond ((> a b) a)
           ((< a b) b)
           (else -1))
     (+ a 1)))

(check-equal? solution1 10 "10 = 10")
(check-equal? solution2 12 "5 + 3 + 4 = 12")
(check-equal? solution3 8 "9 - 1 = 8")
(check-equal? a 3 "a = 3")
(check-equal? b 4 "a = 3, b = a + 1")
(check-equal?
  solution6
  (+ 3 4 (* 3 4))
  "a + b + (a * b) = 3 + 4 + (3 * 4)")
(check-equal? solution7 4)
(check-equal? solution8 16)
(check-equal? solution9 6)
(check-equal? solution10 16)