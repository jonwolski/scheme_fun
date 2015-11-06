
;------------------------------------------------------------------------------;
; lib
;------------------------------------------------------------------------------;
(define (inc x) (+ x 1))
(define (square x) (* x x))
;------------------------------------------------------------------------------;
; exercise
;------------------------------------------------------------------------------;
(define (compose f g) (lambda (s) (f (g s))))
(define (double x) (compose x x))

;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define tolerance 0.0001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
(define (S) (if (and
                 (= 7 ((double inc) 5)) 
                 (= 49 ((compose square inc) 6)) 
                 ) 0 1 ))
(exit (S))