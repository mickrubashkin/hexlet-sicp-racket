; Modify your reverse procedure of Exercise 2.18 to produce a deep-reverse procedure 
; that takes a list as argument and returns as its value the list 
; with its elements reversed and with all sublists deep-reversed as well. 
; For example,

;;; (define x 
;;;   (list (list 1 2) (list 3 4)))

;;; x ; => ((1 2) (3 4))

;;; (reverse x) ; => ((3 4) (1 2))

;;; (deep-reverse x) ; => ((4 3) (2 1))

#lang sicp

(define (reverse items)
  (define (iter acc src)
    (if (null? src)
        acc
        (iter (cons (car src) acc) (cdr src))))
  (iter (list) items))

(define (deep-reverse items)
  (if (null? items)
      items
      (if (not (pair? items))
          items
          (append
            (deep-reverse (cdr items))
            (list (deep-reverse (car items)))))))

(define x 
  (list (list 1 2) (list 3 4)))

x ; => ((1 2) (3 4))

(reverse x) ; => ((3 4) (1 2))

(deep-reverse x) ; => ((4 3) (2 1))