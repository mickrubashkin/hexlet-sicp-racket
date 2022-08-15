;;; Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime? (the Fermat method),
;;; and test each of the 12 primes you found in that exercise.
;;; Since the Fermat test has (log n) growth, how would you expect the time to test primes near 1,000,000
;;; to compare with the time needed to test primes near 1000?
;;; Do your data bear this out? Can you explain any discrepancy you find?

#lang sicp

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10000)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime num elapsed-time)
  (newline)
  (display num)
  (display " *** ")
  (display elapsed-time))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)  (remainder (square (expmod base (/ exp 2) m))
                                  m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (square a)
  (* a a))

(timed-prime-test 1009) 
(timed-prime-test 1013) 
(timed-prime-test 1019) 
(timed-prime-test 10007) 
(timed-prime-test 10009) 
(timed-prime-test 10037) 
(timed-prime-test 100003) 
(timed-prime-test 100019) 
(timed-prime-test 100043) 
(timed-prime-test 1000003) 
(timed-prime-test 1000033) 
(timed-prime-test 1000037)

;;; Outputs.
;;; 1009 *** 5057
;;; 1013 *** 5010
;;; 1019 *** 5069
;;; 10007 *** 6215
;;; 10009 *** 6274
;;; 10037 *** 6330
;;; 100003 *** 7341
;;; 100019 *** 7732
;;; 100043 *** 7556
;;; 1000003 *** 8650
;;; 1000033 *** 8442
;;; 1000037 *** 8790

;;; log(1000000) = log(1000^2) = 2log(1000)
;;; Time(1000000) ~= 1.7 * Time(1000)...