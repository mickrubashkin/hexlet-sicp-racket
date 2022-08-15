; Consider the problem of representing line segments in a plane.
; Each segment is represented as a pair of points: a starting point and an ending point.

; Define a constructor make-segment and selectors start-segment and end-segment 
; that define the representation of segments in terms of points.

; Furthermore, a point can be represented as a pair of numbers: 
; the x coordinate and the y coordinate.

; Accordingly, specify a constructor make-point and selectors x-point and y-point 
; that define this representation.

; Finally, using your selectors and constructors, define a procedure midpoint-segment 
; that takes a line segment as argument and returns its midpoint 
; (the point whose coordinates are the average of the coordinates of the endpoints). 

; To try your procedures, you'll need a way to print points:

#lang sicp

; Segment data abstraction.
(define (make-segment point-start point-end)
  (cons point-start point-end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (let ((x1 (x-point (start-segment segment)))
        (x2 (x-point (end-segment segment)))
        (y1 (y-point (start-segment segment)))
        (y2 (y-point (end-segment segment))))
    (make-point (average x1 x2) (average y1 y2))))

(define (average a b)
  (/ (+ a b) 2))

(define (print-segment s)
  (newline)
  (display "[")
  (print-point (start-segment s))
  (display ",")
  (print-point (end-segment s))
  (newline)
  (display "]"))

; Point data abstraction.
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define p1 (make-point 1 2))
(define p2 (make-point 3 -6))
(define s (make-segment p1 p2))
(define mid-s (midpoint-segment s))
(print-point p1)
(print-point p2)
(print-segment s)
(print-point mid-s)