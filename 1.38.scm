(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))
        )
    )
  (iter k 0 )
  )
(define (euler k)
  (+ 2 
  (cont-frac
   (lambda (i) 1.0)
   (lambda (i)
     (if (= (remainder i 3) 2)
         (/ (* 2 (+ i 1)) 3)
         1
      )
    )
    k
  )
  )
)
(display (euler 1000))
;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define tolerance 0.00001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
(define (S) (if (and
                 (close-enough? 2.718281828 (euler 100000) )
                 ) 0 1 ))
(exit (S))