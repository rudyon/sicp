#lang sicp
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (sum-of-two-larger-squares x y z)
  (cond ((and (<= y x) (<= y z)) (sum-of-squares x z))
	((and (<= x y) (<= x z)) (sum-of-squares y z))
	((and (<= z x) (<= z y)) (sum-of-squares x y))))
