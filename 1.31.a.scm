(define (pow term i next n)
  (define (iter i result)
    (if (> i n)
        result
        (iter (next i) (* result (term i)))))
  (iter i 1 ))

(define (fact n) (if (= 0 n) 1 (pow identity 1 inc n)))
(define (pi n)
  (* 4
     (/
      (pow (start-inc inc-eoe 2) 1 inc n)
      (pow (start-inc inc-eoo 1) 1 inc n)
      )
     )
  )

;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define (identity x) x)
(define (inc n) (+ n 1))
;increment by 2 every-other time: odd
(define (inc-eoo n) (+ (* 2 (quotient n 2)) 1))
;increment by 2 every-other time: even
(define (inc-eoe n) (* 2 (quotient n 2)))
;generate an incrementer, but start it at n instead of 1
(define (start-inc p n) (lambda (x) (p ( + x n) )))
(define (pow-integers a b) (pow identity a inc b))
(define PI 3.14159265358979323846264338328)
(define tolerance 0.0001)
; test case
(define (S) (if (and
                 (= (* 1 2 3 4 5 6 7 8 9 10) (pow-integers 1 10))
                 (= (* 1 2 3 4 5 6 7 8 9 10) (fact 10))
                 (= (* 4 2 4 4 6 6 (/ (* 3 3 5 5 7 ))) (pi 5))
                 (< (abs (/ (- PI (pi 10000)) PI)) tolerance)
                 ) "pass" "fail"))
(S)