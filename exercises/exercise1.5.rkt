#lang sicp
(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; applicative order
; (test 0 (p))
; (if (= 0 0)
;   0
;   (p))
; (if (= 0 0)
;   0
;   (p))
; this will go on endlessly

; normal order
; (test 0 (p))
; (if (= 0 0)
;   0
;   (p))
; this will output "0"

(test 0 (p)) ; this will loop so racket uses applicative order
