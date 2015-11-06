(define (cont-frac n d k)
  ; need to count from 1 to k, so I need an 'recurser' with a reference to k
  (define (cont-frac-r n d i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cont-frac-r n d (+ i 1))))
        )
    )
    (cont-frac-r n d 1)
  )
;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define tolerance 0.0001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
(define (S) (if (and
                 (close-enough? 0.618033989 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0 ) 12))
                 ) 0 1 ))
(exit (S))