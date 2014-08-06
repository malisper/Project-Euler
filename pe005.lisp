(in-package :clamp)

(defparameter largest* 20
  "The upper bound on the problem.")

(def solve ()
  "Solve PE problem 5"
  (reduce #'lcm (range 1 largest*)))
