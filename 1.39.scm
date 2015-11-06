(define (cont-frac n d j k)
  (define (iter i result)
    (if (< i j)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))
        )
    )
  (iter k 0 )
  )
(define (tan-cf x k)
  (/ x (+ 1 (cont-frac
      (lambda (i) (* -1.0 x x))
      (lambda (i) (- (* 2.0 i) 1))
      2
      k
    ))
  )
)
;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define tolerance 0.0001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
(define (S) (if (and
                 (close-enough? 0.414213562 (tan-cf 0.392699082 1000))
                 ) 0 1 ))
(exit (S))
