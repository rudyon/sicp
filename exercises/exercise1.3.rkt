#lang sicp
(define (proc x y z)
  (define (square x) (* x x))
  (cond ((and (<= x y) (<= x z)) (+ (square y) (square z)))
	((and (<= y x) (<= y z)) (+ (square x) (square z)))
	((and (<= z y) (<= z x)) (+ (square x) (square y)))))

(if (= (proc 3 4 5) 41) #t #f)
(if (= (proc 6 5 2) 61) #t #f)
(if (= (proc 4 2 4) 32) #t #f)
(if (= (proc 5 4 8) 89) #t #f)
