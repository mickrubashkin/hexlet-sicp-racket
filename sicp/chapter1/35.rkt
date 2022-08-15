; Show that the golden ratio psi (section 1.2.2) is a fixed point of the transformation x  1 + 1/x,
; and use this fact to compute  by means of the fixed-point procedure.

; Psi defenition: psi^2 = psi + 1
; psi = 1 + 1/psi
; x -> 1 + 1/x;

#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0) ; => 1.6180327868852458
