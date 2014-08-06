(in-package :clamp)

(defparameter largest* 4000000)

(def solve ()
  (loop for n   = 1 then (+ n n-1)
        and n-1 = 0 then n
        while (< n largest*)
        if (even n)
          sum n))
