; Louis Reasoner tries to rewrite the first square-list procedure 
; of Exercise 2.21 so that it evolves an iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

; Unfortunately, defining square-list this way produces 
; the answer list in the reverse order of the one desired. Why?

This procedure will start to reduce the result from the deepest level
(iter (1 2 3) nil)
(iter (2 3) (cons (square 1) nil))
(iter (3) (cons (square 2) (cons (square 1) nil)))
(iter nil (cons (square 3) (cons (square 2) (cons (square 1) nil))))
(cons (square 3) (cons (square 2) (cons (square 1) nil)))
(cons 9 (cons 4 (cons 1 nil)))
(9 4 1)

; Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))

; This doesn’t work either. Explain.
The result will looks like list, but it's another structure.level
List is (cons 1 (cons 2) (cons 3 (cons ...)))
While the result is
(cons (cons (cons (cons nil 1) 2) 3) 4)