#lang sicp

;1.1

10								; 10
(+ 5 3 4)						; 12
(- 9 1)							; 8
(/ 6 2)							; 3
(+ (* 2 4) (- 4 6))				; 6
(define a 3)			 
(define b (+ a 1))				 
(+ a b (* a b))					; 19
(= a b)							; #f
(if (and (> b a) (< b (* a b)))	; 4
  b
  a)
(cond ((= a 4) 6)				; 16
      ((= b 4) (+ 6 7 a))	
      (else 25))
(+ 2 (if (> b a) b a))			; 6
(* (cond ((> a b) a)			; 16
	 ((< a b) b)
	 (else -1)))

;1.2

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (* (- 6 2) (- 2 7))))

;1.3

(define (proc x y z)
  (define (square x) (* x x))
  (cond ((and (<= x y) (<= x z)) (+ (square y) (square z)))
	((and (<= y x) (<= y z)) (+ (square x) (square z)))
	((and (<= z y) (<= z x)) (+ (square x) (square y)))))

;1.4

(define (a-plus-abs-b a b)				; the if proc can return + or - depending on the eval
  ((if (> b 0) + -) a b))				; so lisp/scheme lets you return procs as evals of other procs
										; nouns are verbs and verbs are nouns

;1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; normal order
; (test 0 (p))
; (if (= 0 0)
;   0
;   (p))
; (if (= 0 0)
;   0
;   (p))
; this will go on endlessly

; applciative order
; (test 0 (p))
; (if (= 0 0)
;   0
;   (p))
; this will output "0"

;(test 0 (p)) ; this will loop because of normal order

;1.6

(define (new-if predicate	; something is wrong with this
		then-clause
		else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (sq-rt x)
  (define (square x) (* x x))
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
	    guess
	    (sqrt-iter (improve guess x) x)))
    (sqrt-iter 1.0 x))

;(sq-rt 9)					; why does this loop?
							; i figure it out i think...
							; because it keeps expanding forever
							; so the built in if uses normal order
							; while procs that are not primitives
							; use applicative order
							; which causes this to keep indenting

;1.7

(define (square x)							; if you are wondering why there are weird gaps
  (* x x))									; in this file. it is becuase formatting
(define (average x y)						; is really annoying for some reason
  (/ (+ x y) 2))							; i do not get vim fully yet
(define (improve guess x)					; i eventually gave up it was harder trying to
  (average guess (/ x guess)))				; reformat then actually doing the exercise

(define (sqrt-iter guess x)					; this is the defenition or sqrt-iter
  (define (good-enough? guess x)			; given by the book
    (< (abs (- (square guess) x)) 0.001))	; this doesn't work for very small number
  											; to actually find the sqrt of the number
                                         	; also doesn't work with very large numbers
  (if (good-enough? guess x)				; because of floating point imprecision
      guess									; computers cannot store infinite amounts of bits
      (sqrt-iter (improve guess x) x)))
(define (sqroot x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter-precise guess x)
  (define (good-enough? guess-prev guess)					; we are now comparing the difference between
    (< (abs (/ (- guess guess-prev) guess)) 0.0000000001))	; the previous guess and the new guess
                                                        	; to make things work for very small numbers
  (if (good-enough? guess (improve guess x))				; we are also increasing the precision to deal
      guess													; do this. for several reasons.
      (sqrt-iter-precise (improve guess x) x)))
(define (sqroot-precise x)
  (sqrt-iter-precise 1.0 x))

;1.8

(define (cube x)
  (* (square x) x))

(define (cbrt-iter guess x)
  (define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (define (good-enough? guess-prev guess)
    (< (abs (- (square guess) (square guess-prev))) 0.0000000001))
  (if (good-enough? guess (improve guess x))
      guess
      (cbrt-iter (improve guess x) x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

;1.9

(define (_+ x y)	; recursive
  (if (= x 0)
      y
      (inc (_+ (dec x) y))))

(_+ 4 5)
; (if (= 4 0)
;     5
;     (inc (_+ (dec 4) 5)))
; (inc (_+ (dec 4) 5))
; (inc (_+ 3 5))
; (inc (if (= 3 0)
;          5
; 	 (inc (_+ (dec 3) 5))))
; (inc (inc (_+ (dec 3) 5)))
; (inc (inc (_+ 2 5)))
; (inc (inc (if (= 2 0)
; 	      5
; 	      (inc (_+ (dec 2) 5)))))
; (inc (inc (inc (_+ (dec 2) 5))))
; (inc (inc (inc (_+ 1 5))))
; (inc (inc (inc (if (= 1 0)
;      		   5
; 		   (inc (_+ (dec 1) 5))))))
; (inc (inc (inc (inc (_+ 0 5)))))
; (inc (inc (inc (inc (if (= 0 0)
; 		        5
; 			(inc (_+ (dec 0) 5)))))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9


(define (__+ x y)	; iterative
  (if (= x 0)
      y
      (__+ (dec x) (inc y))))

(__+ 4 5)
; (if (= 4 0)
;     5
;     (__+ (dec 4) (inc 5)))
; (__+ (dec 4) (inc 5))
; (__+ 3 (inc 5))
; (__+ 3 6)
; (if (= 3 0)
;     6
;     (__+ (dec 3) (inc 6)))
; (__+ (dec 3) (inc 6))
; (__+ 2 (inc 6))
; (__+ 2 7)
; (if (= 2 0)
;     7
;     (__+ (dec 2) (inc 7)))
; (__+ (dec 2) (inc 7))
; (__+ 1 (inc 7))
; (__+ 1 8)
; (if (= 1 0)
;     8
;     (__+ (dec 1) (inc 8)))
; (__+ (dec 1) (inc 8))
; (__+ 0 (inc 8))
; (__+ 0 9)
; (if (= 0 0)
;     9
;     (__+ (dec 0) (inc 9)))
; 9 

;1.10

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)

(define (f n) (A 0 n))   ; n * 2
(define (g n) (A 1 n))   ; 2^n except when n = 0 then 0
(define (h n) (A 2 n))   ; this grows really fast. i am not doing this one. for several reasons
(define (k n) (* 5 n n)) ; 5n^2 this answer is given by the book
