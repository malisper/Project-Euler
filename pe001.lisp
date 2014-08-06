(in-package :clamp)

(defparameter largest* 1000
  "The upper bound on the problem.")

(def solve ()
  "Solve PE problem 1."
  (loop for i from 1 below largest*
        if (or (multiple i 3)
	       (multiple i 5))
        sum i))
