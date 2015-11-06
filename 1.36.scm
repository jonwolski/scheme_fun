(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (let ((x next)) 
            (display next)
            (newline)
            (try next)
          )
          )))
  (try first-guess))


;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define tolerance 0.00001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
(define (close-enough-test? v1 v2)
  (< (abs (- v1 v2)) 0.0001))
(define (S) (if (and
                 (close-enough-test? (/ 41 9) (fixed-point (lambda (x) (/ (log 1000) (log x))) 1.2))
                 ) 0 1 ))
(exit (S))