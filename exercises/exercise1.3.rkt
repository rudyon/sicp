#lang sicp
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (sum-of-two-larger-squares x y z)
  (cond ((and (> x y) (> z y)) (sum-of-squares x z))
	((and (> y x) (> z x)) (sum-of-squares y z))
	((and (> x z) (> y z)) (sum-of-squares x y))))
