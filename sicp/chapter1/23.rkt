#lang sicp

(define (opt-search-for-primes num counter)
  (if (even? num)
      (sfp-from (+ num 1) counter)
      (sfp-from num counter)))

(define (sfp-from n counter)
  (if (> counter 0)
      (if (timed-prime-test n)
          (sfp-from (+ n 2) (- counter 1))
          (sfp-from (+ n 2) counter))
      (display " DONE")))

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

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor))))) ; Optimization (checks division by 2 only 1 time).

(define (square a)
  (* a a))

(define (divides? a b)
  (= (remainder b a) 0))

;;; We check division by 2 only 1 time.
(define (next num)
  (if (= num 2)
      3
      (+ num 2)))

(opt-search-for-primes 100000000000 3)
;;; Output.
;;; 100000000003 *** 2105
;;; 100000000019 *** 2171
;;; 100000000057 *** 2142 DONE
;;; Ex22 output.
;;; 100000000003 *** 4126
;;; 100000000019 *** 4265
;;; 100000000057 *** 4303 DONE
(opt-search-for-primes 1000000000000 3)
;;; Output.
;;; 1000000000039 *** 6847
;;; 1000000000061 *** 7115
;;; 1000000000063 *** 7182 DONE
;;; Ex22 output.
;;; 1000000000039 *** 14086
;;; 1000000000061 *** 13885
;;; 1000000000063 *** 13574 DONE
(opt-search-for-primes 10000000000000 3)
;;; Output.
;;; 10000000000037 *** 23021
;;; 10000000000051 *** 23405
;;; 10000000000099 *** 21548 DONE
;;; Ex22 output.
;;; 10000000000037 *** 43322
;;; 10000000000051 *** 42859
;;; 10000000000099 *** 41459 DONE
(opt-search-for-primes 100000000000000 3)
;;; Output.
;;; 100000000000031 *** 68966
;;; 100000000000067 *** 67844
;;; 100000000000097 *** 66956 DONE
;;; Ex22 output.
;;; 100000000000031 *** 131788
;;; 100000000000067 *** 130708
;;; 100000000000097 *** 133603 DONE