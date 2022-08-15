; Suppose we evaluate the expression (list 1 (list 2 (list 3 4))). 
; Give the result printed by the interpreter, 
; the corresponding box-and-pointer structure, 
; and the interpretation of this as a tree (as in Figure 2.6).

#lang sicp

(list 1 (list 2 (list 3 4)))

(1 (2 (3 4)))

[Box1] -> [Box2] -> [Box3] -> [Box4] -> [Box5] -> [Box6]

[p p] -> [p p] -> nil
  |        |
  1      [p p] -> [p p] -> nil
           |        |
           2      [p p] -> [p p] -> nil
                    |        |
                    3        4

            x
          /   \
         /     \
        1      /\
              /  \
             2   /\
                /  \
               3    4