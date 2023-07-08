#lang sicp

;1.16
(define (square x)
  (* x x))

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b n prod)
  (cond ((= n 0) prod)
        ((even? n) (expt-iter (square b) (/ n 2) prod))
        (else (expt-iter b (- n 1) (* b prod)))))

;1.17
(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (mult (+ a a) (/ b 2)))
        (else (+ a (mult a (- b 1))))))

;1.18
(define (mult-iter a b prod)
  (cond ((= b 0) prod)
        ((even? b) (mult-iter (+ a a) (/ b 2) prod))
        (else (mult-iter a (- b 1) (+ a prod)))))

;1.30
(define (identity x) x)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

;1.31
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (product-recurse term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recurse term (next a) next b))))

(define (factorial x)
  (product identity 1 inc x))

;1.32
(define (accumulate combiner null-value term a next b)
  (define (iter combiner a result)
    (if (> a b)
        result
        (iter combiner (next a) (combiner (term a) result))))
  (iter combiner a null-value))

(define (accumulate-recurse combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate-recurse combiner null-value term (next a) next b))))

;1.33
(define (prime? n)
  (define (find-divisor n test-divisor)
    (define (divides? a b) (= (remainder b a) 0))
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (smallest-divisor n) (find-divisor n 2))
  (= n (smallest-divisor n)))

(define (gcd-less-then-n i n)
  (if (= ;page 82 b
  

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter combiner a result)
    (if (> a b)
        result
        (if (filter a)
            (iter combiner (next a) (combiner (term a) result))
            (iter combiner (next a) result))))
  (iter combiner a null-value))

;(filtered-accumulate prime? + 0 square 1 inc 6)

