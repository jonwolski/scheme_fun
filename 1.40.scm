
;------------------------------------------------------------------------------;
; lib
;------------------------------------------------------------------------------;
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
(define (square x) (* x x))
(define dx 0.00001)
;------------------------------------------------------------------------------;
; exercise
;------------------------------------------------------------------------------;
(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))
(define (cubic a b c)
  (lambda (x)
    (+
      (* x x x)
      (* a x x)
      (* b x ) 
      c
    )
  )
)
(define (cubic-root a b c)
  (newtons-method (cubic a b c) 1.0)
) 
;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define tolerance 0.0001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
(define (S) (if (and
                 (close-enough? 2 (square (sqrt 2)))
                 (close-enough? 2 (cubic-root 0 0 -8))
                 (close-enough? 0.031147559294633 (cubic-root 27 256 -8))
                 ) 0 1 ))
(exit (S))
