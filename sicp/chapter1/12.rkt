#lang sicp

;;; The following pattern of numbers is called Pascal's triangle.
;;; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it.
;;; Write a procedure that computes elements of Pascal's triangle by means of a recursive process.
(define (pascal-triangle row col) ; Count from 0 both row and col (0, 1, 2, ...)
  (cond ((> col row) 0)
        ((< col 0) 0)
        ((= col 0) 1)
        (else (+ (pascal-triangle (- row 1) (- col 1))
                 (pascal-triangle (- row 1) col)))))

(pascal-triangle 0 0) ; => 1
(pascal-triangle 1 0) ; => 1
(pascal-triangle 1 1) ; => 1
(pascal-triangle 2 0) ; => 1
(pascal-triangle 2 1) ; => 2
(pascal-triangle 2 2) ; => 1
(pascal-triangle 4 2) ; => 6