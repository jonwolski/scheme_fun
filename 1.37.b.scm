(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))
    )
  )
  (iter k 0 )
 )
;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define tolerance 0.0001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
(define (S) (if (and
                 (close-enough? 0.618033989 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0 ) 1000))
                 ) 0 1 ))
(exit (S))