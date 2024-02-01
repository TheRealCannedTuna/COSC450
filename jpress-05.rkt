; Exercise 7.8 (f)

(define largest-in
  (lambda (list)
    (if (null? list)
        (write "largest-in: list must not be empty")
        (largest-in-helper (cdr list) (car list)))))

(define largest-in-helper
  (lambda (list max)
    (if (null? list)
        max
        (let ((this-max (car list)))
           (if (> this-max max)
               (largest-in-helper (cdr list) this-max)
               (largest-in-helper (cdr list) max))))))

; Exercise 7.9 (a)

(define list-<
  (lambda (a b)
    (cond
      ((null? a)
      (null? b))
      ((null? b)
       (null? a))
      ; both lists have an element
      ((< (car a) (car b))
       (list-< (cdr a) (cdr b)))
      (else #f))))

; Exercise 7.14

(define my-map
  (lambda (fn x)
    (if (null? x)
        '()
        (cons (fn (car x)) (my-map fn (cdr x))))))

; Exercise 7.42

(define apply-all
  (lambda (fn-list n)
    (if (null? fn-list)
        '()
        (cons ((car fn-list) n) (apply-all (cdr fn-list) n)))))

(define square
  (lambda (x)
    (* x x)))

(define cube
  (lambda (x)
    (* x (square x))))