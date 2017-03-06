; Define a procedure that takes three numbers as arguments and return
; the sum of the two larger numbers.

(define (square x) (* x x))

(define (max x y) (>= x y) x y)

(define (sumlargersquares x y z)
    (cond ((and (>= x y) (>= x z)) (+ (square x) (square (max y z))))
          ((and (>= y x) (>= y z)) (+ (square y) (square (max x z))))
          (else (+ (square z) (square (max x y))))))