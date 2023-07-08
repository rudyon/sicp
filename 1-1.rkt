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
