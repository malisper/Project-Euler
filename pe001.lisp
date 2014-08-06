(in-package :clamp)

(def solve ()
  (loop for i from 1 below 1000
        if (or (multiple i 3)
	       (multiple i 5))
        sum i))
