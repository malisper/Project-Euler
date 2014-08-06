(in-package :clamp)

(defparameter largest* 100
  "The upper bound on the problem.")

(def sum-of-squares (n)
  "Returns the sum of the squares of the integers from 1 to its argument."
  (loop for i from 1 to n sum (* i i)))

(def sqr (n)
  "Returns the square of its argument."
  (* n n))

(def square-of-sum (n)
  "Returns the square of the sum of the integers from 1 to its argument."
  (sqr (loop for i from 1 to n sum i)))

(def solve ()
  "Solve PE problem 6."
  (- (square-of-sum  largest*)
     (sum-of-squares largest*)))
