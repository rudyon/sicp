#lang sicp
(define (_+ x y)	; recursive
  (if (= x 0)
      y
      (inc (_+ (dec x) y))))

(_+ 4 5)
; (if (= 4 0)
;     5
;     (inc (_+ (dec 4) 5)))
; (inc (_+ (dec 4) 5))
; (inc (_+ 3 5))
; (inc (if (= 3 0)
;          5
; 	 (inc (_+ (dec 3) 5))))
; (inc (inc (_+ (dec 3) 5)))
; (inc (inc (_+ 2 5)))
; (inc (inc (if (= 2 0)
; 	      5
; 	      (inc (_+ (dec 2) 5)))))
; (inc (inc (inc (_+ (dec 2) 5))))
; (inc (inc (inc (_+ 1 5))))
; (inc (inc (inc (if (= 1 0)
;      		   5
; 		   (inc (_+ (dec 1) 5))))))
; (inc (inc (inc (inc (_+ 0 5)))))
; (inc (inc (inc (inc (if (= 0 0)
; 		        5
; 			(inc (_+ (dec 0) 5)))))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9


(define (__+ x y)	; iterative
  (if (= x 0)
      y
      (__+ (dec x) (inc y))))

(__+ 4 5)
; (if (= 4 0)
;     5
;     (__+ (dec 4) (inc 5)))
; (__+ (dec 4) (inc 5))
; (__+ 3 (inc 5))
; (__+ 3 6)
; (if (= 3 0)
;     6
;     (__+ (dec 3) (inc 6)))
; (__+ (dec 3) (inc 6))
; (__+ 2 (inc 6))
; (__+ 2 7)
; (if (= 2 0)
;     7
;     (__+ (dec 2) (inc 7)))
; (__+ (dec 2) (inc 7))
; (__+ 1 (inc 7))
; (__+ 1 8)
; (if (= 1 0)
;     8
;     (__+ (dec 1) (inc 8)))
; (__+ (dec 1) (inc 8))
; (__+ 0 (inc 8))
; (__+ 0 9)
; (if (= 0 0)
;     9
;     (__+ (dec 0) (inc 9)))
; 9 
