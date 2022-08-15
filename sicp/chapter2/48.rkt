; A directed line segment in the plane can be represented as a pair of vectors 
; —the vector running from the origin to the start-point of the segment, 
; and the vector running from the origin to the end-point of the segment. 
; Use your vector representation from Exercise 2.46 to define a representation 
; for segments with a constructor make-segment and selectors start-segment and end-segment.

#lang sicp

(define (make-segment start-vect end-vect)
  (cons start-vect end-vect))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))



(define (make-vect x y) (cons x y))

(define (xcor-vect v) (car v))

(define (ycor-vect v) (cdr v))