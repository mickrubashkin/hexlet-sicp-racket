; Suppose we represent vectors v = (vi) as sequences of numbers,
; and matrices m = (mij) as sequences of vectors (the rows of the matrix). 
; For example, the matrix
; |1 2 3|
; |4 5 6|
; |7 8 9|
; is represented as the sequence ((1 2 3 4) (4 5 6 6) (6 7 8 9)). 
; With this representation, we can use sequence operations to concisely express 
; the basic matrix and vector operations.
; These operations (which are described in any book on matrix algebra) are the following:

; (dot-product v w) returns the Σi Vi Wi;
; (matrix-*-vector m v) returns the vectort T,where Ti = Σj Mij Vj;
; (matrix-*-matrix m n) returns the matrix P,where Pij = Σk Mik Nkj;
; (transpose m) returns the matrix n, where Nij = M ji

; We can define the dot product as

;;; (define (dot-product v w)
;;;   (accumulate + 0 (map * v w)))

; Fill in the missing expressions in the following procedures 
; for computing the other matrix operations. 
; (The procedure accumulate-n is defined in Exercise 2.36.)

;;; (define (matrix-*-vector m v)
;;;   (map ⟨??⟩ m))

;;; (define (transpose mat)
;;;   (accumulate-n ⟨??⟩ ⟨??⟩ mat))

;;; (define (matrix-*-matrix m n)
;;;   (let ((cols (transpose n)))
;;;     (map ⟨??⟩ m)))

#lang sicp

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))



(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (accumulate op init seqs)
  (if (null? seqs)
      init
      (op (car seqs)
          (accumulate op init (cdr seqs)))))

(define x (list 1 2 3))
(define y (list 4 5 6))
(define z (list 7 8 9))
(define m (list x y z))
(define v (list 2 2 2))

(dot-product x y) ; 32
(matrix-*-vector m v) ; (12 30 48)
(transpose m) ; ((1 4 7) (2 5 8) (3 6 9))
(matrix-*-matrix m (transpose m)) ; ((14 32 50) (32 77 122) (50 122 194))