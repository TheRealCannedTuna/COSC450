; Definitions to make Binary Trees

(define make-empty-tree
  (lambda () '()))

(define make-nonempty-tree
  (lambda (root left-subtree right-subtree)
    (list root left-subtree right-subtree)))

(define empty-tree? null?)

(define root car)

(define left-subtree cadr)

(define right-subtree caddr)

(define test-tree
  '(4
    (2 (1 () ()) (3 () ())) (6 (5 () ()) (7 () ()))))

; Exercise 8.1

(define minimum
  (lambda (tree)
    (cond ((empty-tree? tree)
       (display "Error, Minimum: Binary Search Tree is empty"))    
      ((empty-tree? (left-subtree tree))
          (root tree))
      (else (minimum (left-subtree tree))))))

; Exercise 8.4

(define inorder
  (lambda (tree)
    (flatten (inorder-onto tree '())))) ; I hate that this works

(define inorder-onto
  (lambda (tree list)
    (if (empty-tree? tree)
        '()
        (cons (inorder-onto (left-subtree tree) list)
              (cons (root tree) (inorder-onto (right-subtree tree) list))))))

; Exercise 8.6

(define insert
  (lambda (value tree)
    (cond
      ((empty-tree? tree)
       (make-nonempty-tree value '() '()))
      ((< value (root tree))
       (make-nonempty-tree (root tree) (insert value (left-subtree tree)) (right-subtree tree)))
      (else
       (make-nonempty-tree (root tree) (left-subtree tree) (insert value (right-subtree tree)))))))

; Exercise Flatten

(define flatten
  (lambda (tree)
    (cond
      ((not (list? tree))
       (display "Bug: parameter is not a list"))
      ((null? tree)
       ())
      ((list? (root tree))
       (append (flatten (car tree)) (flatten (cdr tree))))
      (else
       (append (cons (root tree) '()) (flatten (cdr tree)))))))

















