
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
(define (repeated f n)
  (lambda (x)
    (define (iter n x)
      (if (= n 0)
          x
          (iter (- n 1) (f x))
      )
    )
    (iter n x)
  )
)

;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define tolerance 0.0001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
(define (S) (if (and
                 (= 7 ((double inc) 5)) 
                 (= 49 ((compose square inc) 6)) 
                 (= 625 ((repeated square 2) 5)) 
                 (= 100000 ((repeated inc 100000) 0)) 
                 ) 0 1 ))
(exit (S))
