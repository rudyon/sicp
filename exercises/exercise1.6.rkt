#lang sicp
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
