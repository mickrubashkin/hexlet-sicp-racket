; Define a procedure reverse that takes a list as argument and returns 
; a list of the same elements in reverse order:
; (reverse (list 1 4 9 16 25)) ; => (25 16 9 4 1)

#lang sicp

(define (last-pair list)
  (if (null? (cdr list))
      (car list)
      (last-pair (cdr list))))

(define (reverse items)
  (define (iter acc src)
    (if (null? src)
        acc
        (iter (cons (car src) acc) (cdr src))))
  (iter (list) items))

(reverse (list 1 4 9 16 25)) ; => (25 16 9 4 1)