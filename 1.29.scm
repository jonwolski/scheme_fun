(define (simpson f a b n)
  ;(define n (if (= 1 (remainder n 2)) (+ 1 n) n))
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (p-iter n)
    (define c (if (= 1 (remainder n 2)) 4 2))
    (if (= 0 n)
        0
        (+ (* c (y n)) (p-iter (- n 1)))
        )
    )
  (* (/ h 3) (+ (y 0) (y n) (p-iter (- n 1 ))))
  )

;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define (cube n) (* n n n))
(simpson cube 0 1 100)