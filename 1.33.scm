(define (filtered-accumulate operation identity-element filter)
  (lambda (term i next n)
    (define (iter i result)
      (if (> i n)
          result
          (iter (next i)
                (if (filter i n)
                    (operation result (term i))
                    result
                    )
                )))
    (iter i identity-element) 
    ) 
  )

; 1.33.a
(define (square x) (* x x))
(define (prime? p n) (if (< p 2) #f (= (remainder (fact (- p 1)) p) (- p 1))))
(define sum-primes-only (filtered-accumulate + 0 prime?))
(define (sum-of-squares-of-primes i n) (sum-primes-only square i inc n))
; 1.33.b
(define (relative-prime? i n) (= 1 (gcd i n)))
(define product-relative-primes (filtered-accumulate * 1 relative-prime?))
(define (product-of-relative-primes i n) (product-relative-primes identity i inc n))


;------------------------------------------------------------------------------;
; lib
;------------------------------------------------------------------------------;
(define (identity x) x)
(define (inc n) (+ n 1))
(define (true-filter i n) #t)
(define pow (filtered-accumulate * 1 true-filter))
(define sum (filtered-accumulate + 0 true-filter))
(define (fact n) (if (= 0 n) 1 (pow identity 1 inc n)))


;------------------------------------------------------------------------------;
; test scaffold
;------------------------------------------------------------------------------;
(define (S) (if (and
  ; 1.33.a the sum of the squares of all primes less 10 
                 (= (+ 4 9 25 49) (sum-of-squares-of-primes 1 10))
  ; 1.33.b the product of all the positive integers less than n that are 
  ;  relatively prime to n
                 (= (* 1 2 3 4 5 6 7 8 9 10) (product-of-relative-primes 1 11))
                 (= (* 8 7 5 4 2 ) (product-of-relative-primes 1 9))
                 ) 0 1))
(exit (S))