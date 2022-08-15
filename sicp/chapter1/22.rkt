#lang sicp

(define (square a)
  (* a a))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime num elapsed-time)
  (newline)
  (display num)
  (display " *** ")
  (display elapsed-time))

;;; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range.
;;; Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000.
;;; Note the time needed to test each prime.
;;; Since the testing algorithm has order of growth of O(sqrt n), you should expect that testing for primes around 10,000 should take about sqrt(10) times as long as testing for primes around 1000. 
;;; Do your timing data bear this out?
;;; How well do the data for 100,000 and 1,000,000 support the sqrt(n) prediction?
;;; Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

(define (search-for-primes num counter)
  (if (even? num)
      (sfp-from (+ num 1) counter)
      (sfp-from num counter)))

(define (sfp-from n counter)
  (if (> counter 0)
      (if (timed-prime-test n)
          (sfp-from (+ n 2) (- counter 1))
          (sfp-from (+ n 2) counter))
      (display " DONE")))

(search-for-primes 1000 3)
;;; Output
;;; 1009 *** 0
;;; 1013 *** 1
;;; 1019 *** 1 DONE
(search-for-primes 10000 3)
;;; Output
;;; 10007 *** 1
;;; 10009 *** 1
;;; 10037 *** 2 DONE
(search-for-primes 100000 3)
;;; Output
;;; 100003 *** 5
;;; 100019 *** 4
;;; 100043 *** 4 DONE
(search-for-primes 1000000 3)
;;; Output
;;; 1000003 *** 13
;;; 1000033 *** 13
;;; 1000037 *** 14 DONE
(search-for-primes 100000000000 3)
;;; Output
;;; 100000000003 *** 4126
;;; 100000000019 *** 4265
;;; 100000000057 *** 4303 DONE
(search-for-primes 1000000000000 3)
;;; Output (It takes more time. Tnew ~= sqrt10 * Tprevios)
;;; 1000000000039 *** 14086
;;; 1000000000061 *** 13885
;;; 1000000000063 *** 13574 DONE
(search-for-primes 10000000000000 3)
;;; Output (It takes more time. Tnew ~= sqrt10 * Tprevios)
;;; 10000000000037 *** 43322
;;; 10000000000051 *** 42859
;;; 10000000000099 *** 41459 DONE
(search-for-primes 100000000000000 3)
;;; Output (It takes more time. Tnew ~= sqrt10 * Tprevios)
;;; 100000000000031 *** 131788
;;; 100000000000067 *** 130708
;;; 100000000000097 *** 133603 DONE