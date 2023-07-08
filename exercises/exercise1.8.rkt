#lang sicp
(define (square x)
  (* x x))
(define (cube x)
  (* (square x) x))
(define (average x y)
  (/ (+ x y) 2))

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
