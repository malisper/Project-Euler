(in-package :clamp)

(defparameter largest* 100)

(def sum-of-squares (n)
  (loop for i from 1 to n sum (* i i)))

(def sqr (n)
  (* n n))

(def square-of-sum (n)
  (sqr (loop for i from 1 to n sum i)))

(def solve ()
  (- (square-of-sum  largest*)
     (sum-of-squares largest*)))
