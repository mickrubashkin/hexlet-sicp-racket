; Define the below operation for painters. 
; Below takes two painters as arguments. 
; The resulting painter, given a frame, 
; draws with the first painter in the bottom of the frame 
; and with the second painter in the top. 

; Define below in two different ways—first by writing a procedure 
; that is analogous to the beside procedure given above, 
; and again in terms of beside and suitable rotation operations (from Exercise 2.50).

#lang sicp

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left  (transform-painter 
                        painter1
                        (make-vect 0.0 0.0)
                        split-point
                        (make-vect 0.0 1.0)))
          (paint-right (transform-painter
                        painter2
                        split-point
                        (make-vect 1.0 0.0)
                        (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

; Part1.
(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom (transform-painter
                         painter1
                         (make-vect 0.0 0.0)
                         (make-vect 1.0 0.0)
                         split-point))
          (paint-top (transform-painter
                      painter1
                      split-point
                      (make-vect 1.0 0.5)
                      (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))

; Part2.
(define (below painter1 painter2) 
  (rotate-90
    (beside
      (rotate-270 painter1) 
      (rotate-270 painter2))))