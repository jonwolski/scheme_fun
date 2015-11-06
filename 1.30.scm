(define (sum term i next n)
  (define (iter i result)
    (if (> i n)
        result
        (iter (next i) (+ result (term i)))))
  (iter i 0 ))

;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define (identity x) x)
(define (inc n) (+ n 1))
(define (sum-integers a b) (sum identity a inc b))
; test case
(define (S) (if (= 55 (sum-integers 1 10)) "pass" "fail"))
(S)