(in-package :clamp)

(defparameter largest* 20)

(def solve ()
  (reduce #'lcm (range 1 largest*)))
