#lang sicp
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
