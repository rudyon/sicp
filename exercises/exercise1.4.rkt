#lang sicp
(define (a-plus-abs-b a b)		; the if proc can return + or - depending on the eval
  ((if (> b 0) + -) a b))		; so lisp/scheme lets you return procs as evals of other procs
					; this essentially would let one combine procs into
					; greaty complex procs
					; we can expand the given proc here to make it more complicated
					; and abuse this property of lisp
(define (yes a b c)			; this is really stupid and serves no actual purpose
  (cond ((<= a b) (a-plus-abs-b b c))	; but that is kind of the point
	((<= c b) (a-plus-abs-b a b))	; the fact thay ou can even make a proc like this
	(else (a-plus-abs-b a c))))	; and it runs is fascinating to me even
  					; this is really powerful
(yes 5 2 1)				; i should have learned functional programming sooner
