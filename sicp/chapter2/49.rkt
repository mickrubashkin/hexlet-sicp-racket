; Use segments->painter to define the following primitive painters:

; 1. The painter that draws the outline of the designated frame.
; 2. The painter that draws an “X” by connecting opposite corners of the frame.
; 3. The painter that draws a diamond shape by connecting the midpoints of the sides of the frame.
; 4. The wave painter.

#lang sicp

(define outline-painter 
  (segments->painter
    (list
      (make-segment (make-vect 0 0) (make-vect 1 0))
      (make-segment (make-vect 1 0) (make-vect 1 1))
      (make-segment (make-vect 1 1) (make-vect 0 1))
      (make-segment (make-vect 0 1) (make-vect 0 0)))))

(define x-painter 
  (segments->painter
    (list
      (make-segment (make-vect 0 0) (make-vect 1 1))
      (make-segment (make-vect 1 0) (make-vect 0 1)))))

(define diamond-painter 
  (segments->painter
    (list
      (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
                    (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
                    (make-segment (make-vect 0.5 1) (make-vect 0 0.5)) 
                    (make-segment (make-vect 0 0.5) (make-vect 0.5 0)))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) 
         (start-segment segment))
        ((frame-coord-map frame) 
         (end-segment segment))))
     segment-list)))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect 
      (scale-vect (xcor-vect v)
                  (edge1-frame frame))
      (scale-vect (ycor-vect v)
                  (edge2-frame frame))))))

