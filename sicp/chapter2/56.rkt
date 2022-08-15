; Show how to extend the basic differentiator to handle more kinds of expressions. 
; For instance, implement the differentiation rule

; d(u^n)/dx = n * u^(n−1) * du/dx

; by adding a new clause to the deriv program and defining appropriate procedures 
; exponentiation?, base, exponent, and make-exponentiation. 
; (You may use the symbol ** to denote exponentiation.) 
; Build in the rules that anything raised to the power 0 is 1 
; and anything raised to the power 1 is the thing itself.

#lang sicp

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product 
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product 
           (deriv (multiplier exp) var)
           (multiplicand exp))))
; New clause to handle the exponentiation.
        ((exponentiation? exp)
         (make-product
          (make-product
            (exponent exp)
            (make-exponentiation (base exp) (- (exponent exp) 1)))
          (deriv (base exp) var)))
        (else (error "unknown expression 
                      type: DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) 
         (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) 
             (=number? m2 0)) 
         0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) 
         (* m1 m2))
        (else (list '* m1 m2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

; Appropriate procedures definition.

(define (make-exponentiation base exp)
  ; Build in the rules that anything raised to the power 0 is 1 
  ; and anything raised to the power 1 is the thing itself.
  (cond ((=number? exp 0) 1)
        ((=number? exp 1) base)
        ((and (number? base) (number? exp)) (** base exp))
        (else (list '** base exp))))

(define (** a b)
  (exp (* b (log a))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

(deriv '(+ x 3) 'x) ; 1
(deriv '(* x y) 'x) ; y
(deriv '(* (* x y) (+ x 3)) 'x) ; (+ (* x y) (* y (+ x 3)))
(deriv '(** x 4) 'x) ; (* 4 (** x 3))
(deriv '(+ (+ (* a (** x 2)) (* b x)) c) 'x) ; (+ (* a (* 2 x)) b)
(deriv '(+ (** x 3) (** y 2)) 'x) ; (* 3 (** x 2))