#lang sicp

(define (square a)
  (* a a))

(define (sum-of-squares a b c)
  (+ (square a) (square b) (square c)))

(define (get-lowest a b)
  (if (< a b) a b))

(define (get-lowest-of-three a b c)
  (cond ((< c (get-lowest a b)) c)
	((< b (get-lowest a c)) b)
	((< a (get-lowest b c)) a)))

(define (process a b c)
  (-
    (sum-of-squares a b c)
    (square (get-lowest-of-three a b c))))

; just to make sure it works
(process 6 4 2)
(process 12 4 9)
(process 59 13 1)
(process 12 50 45)
(process 9 4 8)
