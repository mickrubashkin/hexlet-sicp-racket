; Alyssa’s idea is to implement “interval arithmetic” 
; as a set of arithmetic operations for combining “intervals” 
; (objects that represent the range of possible values of an inexact quantity). 
; The result of adding, subtracting, multiplying, or dividing two intervals 
; is itself an interval, representing the range of the result.

; Alyssa postulates the existence of an abstract object called an “interval” 
; that has two endpoints: a lower bound and an upper bound.
; She also presumes that, given the endpoints of an interval, 
; she can construct the interval using the data constructor make-interval.

; Here is a definition of the interval constructor:
;(define (make-interval a b) (cons a b))

; Define selectors upper-bound and lower-bound to complete the implementation.
#lang sicp

(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (car interval))

(define (lower-bound interval)
  (cdr interval))