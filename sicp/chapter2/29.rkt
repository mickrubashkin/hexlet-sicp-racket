#lang sicp

; A binary mobile consists of two branches, a left branch and a right branch. 
; Each branch is a rod of a certain length, 
; from which hangs either a weight or another binary mobile. 
; We can represent a binary mobile using compound data 
; by constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a structure, 
; which may be either a number (representing a simple weight) or another mobile:

(define (make-branch length structure)
  (list length structure))

; 1. Write the corresponding selectors left-branch and right-branch, 
; which return the branches of a mobile, and branch-length and branch-structure, 
; which return the components of a branch.

(define (left-branch mobile) (car mobile))
; (define (right-branch mobile) (car (cdr mobile)))
(define (right-branch mobile) (cadr mobile))

(define (branch-length branch) (car branch))

(define (branch-structure branch) (cadr branch))

; 2. Using your selectors, define a procedure total-weight 
; that returns the total weight of a mobile.

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile))))))))

; Comment: It is a nice trick to use fringe procedure in total-weight.
(define (total-weight mobile)
  (sum (fringe mobile)))

(define (sum items)
  (if (not (pair? items))
      0
      (+ (car items) (sum (cdr items)))))

; 3. A mobile is said to be balanced if the torque applied by its top-left branch 
; is equal to that applied by its top-right branch 
; (that is, if the length of the left rod multiplied by the weight hanging from that rod 
; is equal to the corresponding product for the right side) 
; and if each of the submobiles hanging off its branches is balanced. 
; Design a predicate that tests whether a binary mobile is balanced.

(define (balanced? mobile)
  (define (torque branch)
    (* (branch-length branch) (branch-structure branch)))

  (define (equal-torque? left-branch right-branch)
    (= (torque left-branch) (torque right-branch)))

  (if (not (pair? mobile))
      #t
      (and (equal-torque? mobile)
           (balanced? (left-branch mobile))
           (balanced? (right-branch mobile)))))

; 4. Suppose we change the representation of mobiles so that the constructors are
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

; How much do you need to change your programs to convert to the new representation?

; In this case we need to change only two selectors (from cadr to cdr): right-branch & branch-structure.right-branch
(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))