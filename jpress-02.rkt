; Assignment 2
; Jason Press
; 19 January 2024
(require (lib "fungraph.ss" "concabs"))
; Exercise 2.1

(define power
  (lambda (base exponent)
    (if (< exponent 1) #f
    (if (> exponent 1) (* base (power base (+ exponent (- 1))))
    (* 1 base)))))

; Exercise 2.8(c)

(define sum-of-powers
  (lambda (n p)
    (if (<= n 1) (power n p)
        (+ (power n p) (sum-of-powers (- n 1) p)))))

; Exercise 2.10

(define num-odd-digits
  (lambda (n)
    (if (not (= n 0))
        (if (not (= 0 (remainder (remainder n 10) 2)))
            (+ 1 (num-odd-digits (quotient n 10)))
            (num-odd-digits (quotient n 10)))
        0)))

;; Exercise 3.14(b)

; original function

;(define closest-power
;(lambda (b n)
;(if (< n b)
;0
;(+ 1 (closest-power b (quotient n b))))))

(define closest-power
  (lambda (b n)
    (helper b n 0)))

(define closest-power-helper
  (lambda (b n k)
    (if (= n 1)
        k
        (closest-power-helper b (quotient n b) (+ 1 k)))))

; Exercise 2.15

; the first approach, which was *not* great. here because why not

;(define checkerboard
;  (lambda (image w h)
;    (checkerboarder image w h w h)))

; checkerboarder is the helper function

;(define checkerboarder
;  (lambda (image w h original-w original-h)
;    (if (> h 0)
;        (if (> w 0)
;            (checkerboarder (invert-and-write image) (- w 1) h original-w original-h)
;            (checkerboarder (newline-and-write image) original-w (- h 1) original-w original-h)
;        ))
;    ))
;
;(define invert-and-write
;  (lambda (image)
;    (write image)
;    (invert image)))
;
;(define newline-and-write
;  (lambda (image)
;    (newline)
;    image
;    ))

; actually trying now

; checkerboard-v2 makes a stack of images

(define checkerboard-v2
  (lambda (image w h)
    (if (and (> w 0) (> h 1))
        (stack image (checkerboard-v2 (invert image) w (- h 1)))
        image)))

; checkerboard *should* put the stacked images from v2 side-by-side

(define checkerboard
  (lambda (image w h)
    (if (> w 1)
        (side-by-side
         (checkerboard-v2 image w h)
         (checkerboard (invert image) (- w 1) h))
        (checkerboard-v2 image w h))))

; SDHJFKJOHGBIOPKL:SRFHIOPWHFKJSDHGVJKLSHJRFIOPWEHGJKLBDHFJKLAS
; this took *waaaaaaaaaaaay* too long


; Assignment 1, so everything works. I had to update how side-by-side works from my original
; homework assignment, which is why I just copied the entire assignment down here (:

;; Name: Jason Press
;; Date: 12 January 2024
;; Assignment: SCHEME1


;; Put programming exercises here

; Exercise 1.4b

(define candy-temperature
  (lambda (temp elevation)
    (- temp (round (/ elevation 500)))))
; Exercise 1.5

(define tax
  (lambda (income)
    (if (< income 10000)
        0
        (* 20/100 (- income 10000)))))

; Exercise 1.9

(define half-turn
  (lambda (image)
    (quarter-turn-right (quarter-turn-right image))))

(define quarter-turn-left
  (lambda (image)
    (quarter-turn-right (half-turn image))))

(define side-by-side
  (lambda (left right)
    (quarter-turn-right (stack (quarter-turn-left right) (quarter-turn-left left)))))

; Exercise 1.10

(define pinwheel
  (lambda (image)
    (side-by-side (stack (quarter-turn-right image) image)
     (stack (half-turn image) (quarter-turn-left image)))))

;; This file contains definitions of quilt-cover "basic block" images for use
;; with Concrete Abstractions: An Introduction to Computer Science Using Scheme
;; by Max Hailperin, Barbara Kaiser, and Karl Knight.
;;
;; The images defined are:
;;  From chapter 1: rcross-bb, corner-bb, test-bb, and nova-bb
;;  From chapter 2: bitw-bb

;; A simple test image, to illustrate transformations.
(define test-bb
  (filled-triangle 0 1 0 -1 1 -1))

;; This one only has two triangles, but makes an interesting pinwheel.
(define nova-bb
  (overlay (filled-triangle 0 1 0 0 -1/2 0)
           (filled-triangle 0 0 0 1/2 1 0)))

;; Basic block for "Blowing in the Wind" quilting pattern from
;; "Quick-and-Easy Strip Quilting" by Helen Whitson Rose, Dover
;; Publications, New York, 1989, p. 59.
(define bitw-bb
  (overlay (overlay (filled-triangle -1 1 0 1 -1/2 1/2)
                    (filled-triangle -1 -1 0 -1 -1 0))
           (overlay (filled-triangle 1 1 1 0 0 0)
                    (filled-triangle 0 0 1 0 1/2 -1/2))))

;; The final two basic blocks defined in this file, rcross-bb and corner-bb,
;; are defined in a way intended to be unreasonably hard to understand, because
;; defining them is one of the exercises in the text.  It would be easier
;; for you to come up with your own definitions from scratch than by puzzling
;; these definitons out.  The only point of having them is to let you use the
;; blocks without first doing the definitions.  You might as well stop reading
;; here, the below is not meant to be readable.

;; Basic block for "Repeating Crosses" quilting pattern from
;; "Quick-and-Easy Strip Quilting" by Helen Whitson Rose, Dover
;; Publications, New York, 1989, p. 60.
(define rcross-bb #f)

;; A much simpler basic block, with one corner black.
(define corner-bb #f)

(let ((omb
       (lambda x
	 (let l
	   ((x (cdr x))
	    (y (list-tail (cdr x) (quotient (length x) 2)))
	    (z #f)
	    (w (car x)))
	   (if (null? y)
	       z
	       (l (cddddr x) (cddddr y)
		  (let* ((v (lambda (v) (/ v w)))
			 (v (filled-triangle (v (car y)) (v (car x))
					     (v (cadr y)) (v (cadr x))
					     (v (caddr y)) (v (caddr x)))))
		    (if z (overlay z v) v)) w))))))
  (set! rcross-bb (omb 2 2 2 1 1 1 2 1 2 1 1 -1 2 -1 -2 1 
		       2 1 -1 -1 2 -2 2
		       -1 1 -1 2 2 1 2 1 1 -1 1 2 2 1 -1 -1 1 1))
  (set! corner-bb (omb -1 -1 -1 0 0 0 -1 -1 -1))
  )
