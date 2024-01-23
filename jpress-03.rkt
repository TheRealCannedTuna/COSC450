; Assignment 3

(require (lib "fungraph.ss" "concabs"))

; Exercise 3.10

(define renumbering
  (lambda (position n)
    (modulo (+ (- position 3) n) n)))

; Exercise 3.11

(define survives?
  (lambda (position n)
    (if (< n 3)
        #t
        (if (= position 3)
            #f
            (survives? (renumbering position n) (- n 1)
             )))))

; Exercise 3.12

(define first-survivor-after
  (lambda (position n)
    (if (<= position n)
        (if (not (survives? (+ position 1) n))
            (first-survivor-after (+ position 1) n)
            (+ position 1)))))

; Josephus was in position 13 or 28 if the killing was every 3rd person

; Exercise 4.9

(define triangle
  (lambda (x1 y1 x2 y2 x3 y3)
    (overlay (line x1 y1 x2 y2) (overlay (line x2 y2 x3 y3)(line x3 y3 x1 y1)))))

; Exercise 4.10

(define sierpinskis-gasket
  (lambda (x1 y1 x2 y2 x3 y3 level)
    (if (= level 0)
        (triangle x1 y1 x2 y2 x3 y3)
    (overlay (triangle x1 y1 x2 y2 x3 y3)
             (overlay (sierpinskis-gasket x1 y1 (mid x1 x2) (mid y1 y2) (mid x1 x3) (mid y1 y3) (- level 1))
                      (overlay (sierpinskis-gasket (mid x2 x1) (mid y2 y1) x2 y2 (mid x2 x3) (mid y2 y3) (- level 1))
                               (sierpinskis-gasket (mid x1 x3) (mid y1 y3) (mid x2 x3) (mid y2 y3) x3 y3 (- level 1))))))))


(define mid
  (lambda (x1 x2)
    (/ (+ x1 x2) 2)))
