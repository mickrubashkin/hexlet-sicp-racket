; Ben Bitdiddle, an expert systems programmer, 
; looks over Alyssa’s shoulder and comments that it is not clear 
; what it means to divide by an interval that spans zero.
(define (div-interval x y)
  (mul-interval x 
                (make-interval 
                 (/ 1.0 (upper-bound y)) 
                 (/ 1.0 (lower-bound y)))))

; Modify Alyssa’s code to check for this condition and to signal an error if it occurs.

(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "Divide by an interval that spans zero" y)
      (mul-interval x 
                (make-interval 
                 (/ 1.0 (upper-bound y)) 
                 (/ 1.0 (lower-bound y))))))