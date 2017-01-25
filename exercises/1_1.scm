; Below is a sequence of expressions. What is the result printed by
; the interpreter in response to each expression?
; Assume that the sequence is to be evaluated in the order
; in which it is presented.

10
; 10
; The input is a numeral that represents a number in base 10; the input is
; that number.

(+ 5 3 4)
; 12
(- 9 1)
; 8
(/ 6 2)
; 3
; "Simple" operators & operands

(+ (* 2 4) (- 4 6))
; 6
; Operands of the compound combination are firstly evaluated ('cause Lisp uses
; applicative-order evaluation) and then replaced.
; So this combination is transformed in:
; (+ 8 -2)
; which evaluates to 6

(define a 3)
;a
(define b (+ a 1))
;b
; define allows to specify names associated to values. It's the simplest
; abstraction.
; It's a special form, so it has its own evaluation rule, different from
; the one used for combinations.

(+ a b (* a b))
; 19
; Names could be used instead of values inside combinations.

(= a b)
; #f
; The = operator return #t (true) or #f (false)

(if (and (> b a) (< b (* a b)))
    b
    a)
; 4
; The and special form evaluates a list of operands; if all of them evaluate to
; true it returns the value of the last one; if one evaluates to false, false is
; returned (and the remaining operators are not evaluated).

(cond ((= a 4) 6) ((= b 4) (+ 6 7 a)) (else 25))
; 16
; cond allows to specify a list of predicates and associated values.
; The value associated with the first predicate which evaluates to true is
; returned; when no predicate evaluate to true the return value is undefined.
; Else allow to specify a fallback value.

(+ 2 (if (> b a) b a))
; 6
; if accept 3 operands; a predicate and 2 values. If the predicate evaluates
; to true, the first value is returned; otherwise, the second.

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
; 16