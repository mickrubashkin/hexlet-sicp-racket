#lang sicp

; Give combinations of cars and cdrs that will pick 7 from each of the following lists:

; (1 3 (5 7) 9)
; ((7))
; (1 (2 (3 (4 (5 (6 7))))))

(define l (list 1 2 3 4))
(define l1 (list 1 3 (list 5 7) 9))
(define l2 (list (list 7)))
(define l3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

l
l1
l2
l3

(car (cdr (car (cdr (cdr l1)))))
(car (car l2))
(car (cdr (car (cdr (car (cdr(car (cdr (car (cdr (car (cdr l3))))))))))))
(cadr (cadr (cadr (cadr (cadr (cadr l3))))))