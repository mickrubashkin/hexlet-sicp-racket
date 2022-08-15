#lang sicp

(define (count-change amount)
  (cc amount 5))

(define (cc amount kind-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kind-of-coins 0)) 0)
        (else (+ (cc amount 
                     (- kind-of-coins 1))
                  (cc (- amount
                         (first-denomination kind-of-coins))
                      kind-of-coins)))))

(define (first-denomination kind-of-coins)
  (cond ((= kind-of-coins 1) 1)
        ((= kind-of-coins 2) 5)
        ((= kind-of-coins 3) 10)
        ((= kind-of-coins 4) 25)
        ((= kind-of-coins 5) 50)))

;;; Draw the tree illustrating the process generated by the count-change procedure in making change for 11 cents.
;;; What are the orders of growth of the space and number of steps used by this process as the amount to be changed increases?

;;; Space - O(n)
;;; Time - O(n^5) for 5 kinds of coins

; (count-change 11)
; (cc 11 5)
; (+ (cc 11 4) (cc -39 5))
; (+ (+ (cc 11 3) (cc -14 4)) (сс -39 5))
; (+ (+ (+ (сс 11 2) (сс 1 3)) (сс -14 4)) (сс -39 5)) ; TODO: Don't touch (cc 1 3) on next steps
; (+ (+ (+ (+ (сс 11 1) (сс 6 2)) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5)) ; (cc n 1) -> n steps
; (+ (+ (+ (+ (+ (сс 11 0) (сс 10 1)) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ (сс 10 0) (сс 9 1))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ (сс 9 0) (сс 8 1)))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ (сс 8 0) (сс 7 1))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (сс 7 0) (сс 6 1)))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (сс 6 0) (сс 5 1))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (сс 5 0) (сс 4 1)))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (сс 4 0) (сс 3 1))))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (сс 3 0) (сс 2 1)))))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (сс 2 0) (сс 1 1))))))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (сс 1 0) (сс 0 1)))))))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (сс 0 1)))))))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1)))))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1)))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1)))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 1)))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 (+ 0 1))) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 (+ 0 1)) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ (+ 0 1) (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (сс 6 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ (cc 6 0) (cc 5 1)) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ (cc 5 0) (cc 4 1))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 (+ (cc 4 0) (cc 3 1)))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 (+ 0 (+ (cc 3 0) (cc 2 1))))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 2 0) (cc 1 1)))))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 1 0) (cc 0 1))))))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (cc 0 1))))))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1)))))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 1))))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 (+ 0 (+ 0 1)))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 (+ 0 1))) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 (+ 0 1)) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ (+ 0 1) (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ 1 (сс 1 2))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ 1 (+ (cc 1 1) (cc -4 2)))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ 1 (+ (+ (cc 1 0) (cc 0 1)) (cc -4 2)))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ 1 (+ (+ 0 (cc 0 1)) (cc -4 2)))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ 1 (+ (+ 0 1) (cc -4 2)))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ 1 (+ 1 (cc -4 2)))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ 1 (+ 1 0))) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 (+ 1 1)) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ (+ 1 2) (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 (+ (сс 1 2) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 (+ (+ (cc 1 1) (cc -4 2)) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 (+ (+ (+ (cc 1 0) (cc 0 1)) (cc -4 2)) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 (+ (+ (+ 0 (cc 0 1)) (cc -4 2)) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 (+ (+ (+ 0 1) (cc -4 2)) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 (+ (+ 1 (cc -4 2)) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 (+ (+ 1 0) (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 (+ 1 (сс -9 3))) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 (+ 1 0)) (сс -14 4)) (сс -39 5))
; (+ (+ (+ 3 1) (сс -14 4)) (сс -39 5))
; (+ (+ 4 (сс -14 4)) (сс -39 5))
; (+ (+ 4 0) (сс -39 5))
; (+ 4 (сс -39 5))
; (+ 4 0)
; 4