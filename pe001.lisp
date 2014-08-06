(in-package :clamp)

(defparameter largest* 1000)

(def solve ()
  (loop for i from 1 below largest*
        if (or (multiple i 3)
	       (multiple i 5))
        sum i))
