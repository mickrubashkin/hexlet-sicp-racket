; Implement a representation for rectangles in a plane.
; (Hint: You may want to make use of exercise 2.2.)
; In terms of your constructors and selectors, create procedures 
; that compute the perimeter and the area of a given rectangle. 
; Now implement a different representation for rectangles.
; Can you design your system with suitable abstraction barriers, 
; so that the same perimeter and area procedures will work using either representation?

#lang sicp

; Rect geometry params calc.
(define (perimeter rect)
  (* 2 (+ ((horiz-rect rect) (vert-rect rect)))))

(define (area rect)
  (* (horiz-rect rect) (vert-rect rect)))

; Rectangles data abstraction. V1.
(define (make-rect origin horiz vert)
  (cons origin (cons horiz vert)))

(define (origin-rect rect)
  (car rect))

(define (horiz-rect rect)
  (car (cdr rect)))

(define (vert-rect)
  (cdr (cdr rect)))

; Rectangles data abstraction. V2.
(define (make-rect left-top right-bottom)
  (cons left-top right-bottom))

(define (left-top-rect rect)
  (car rect))

(define (right-bottom-rect rect)
  (cdr rect))

(define (right-top-rect rect)
  (make-point
    (x-point (right-bottom-rect rect))
    (y-point (left-top-rect rect))))

(define (horiz-rect rect)
  (make-segment
    (left-top-rect rect)
    (right-top-rect rect)))

(define (vert-rect rect)
  (make-segment
    (right-top-rect rect)
    (righ-right-bottom-rect rect)))

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