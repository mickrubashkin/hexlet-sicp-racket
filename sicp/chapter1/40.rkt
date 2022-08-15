; Define a procedure cubic that can be used together with the newtons-method procedure in expressions of the form
; (newtons-method (cubic a b c) 1)
; to approximate zeros of the cubic x^3 + ax^2 + bx + c.

#lang sicp

(define (newtons-method g guess)
  (define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (let ((next (f guess)))
      (display "Iteration: ")
      (display count)
      (display "  |  Guess: ")
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next (+ count 1)))))
  (try first-guess 1))
  (fixed-point (newton-transform g) guess))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)) dx)))

(define dx 0.00001)

(newtons-method (cubic a b c) 1)

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a  x x)
       (* b x)
       c)))
