; Exercise 2.12

(define exponent-of-two
  (lambda (i)
    (if (odd? i)
        0
        (+ 1 (exponent-of-two (quotient i 2))))))

; Exercise 5.1
    
(define together-copies-of
  (lambda (combine quantity thing)
    (if (= quantity 1)
        thing
        (together-copies-of-helper combine quantity thing thing))))

(define together-copies-of-helper
  (lambda (combine quantity thing original-thing)
    (if (= quantity 1)
        thing
        (together-copies-of-helper combine (- quantity 1) (combine thing original-thing) original-thing))))

; Original recursive code

;(define together-copies-of-recursive
;  (lambda (combine quantity thing)
;    (if (= quantity 1)
;        thing
;        (combine (together-copies-of-recursive combine (- quantity 1) thing)
;                 thing))))

; Exercise 5.4

(define num-digits
  (lambda (n)
    (num-digits-in-satisfying n (lambda (n) = n 0))))

; num-digits-in-satisfying, provided by Section 5.1

;(define num-digits-in-satisfying
;  (lambda (n test?)
;    (cond ((< n 0)
;           (num-digits-in-satisfying (- n) test?))
;          ((< n 10)
;           (if (test? n) 1 0))
;          ((test? (remainder n 10))
;           (+ (num-digits-in-satisfying (quotient n 10) test?)
;              1))
;          (else
;           (num-digits-in-satisfying (quotient n 10) test?)))))

; Exercise 5.7

(define make-exponentiater
  (lambda (e)
    (lambda (n) (expt n e))))

; "Test functions" from Exercise 5.7

;(define square (make-exponentiater 2))

;(define cube (make-exponentiater 3))























