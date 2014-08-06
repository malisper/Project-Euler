(in-package :clamp)

(defparameter largest* 4000000
  "The upper bound on the problem.")

(def solve ()
  "Solve PE problem 2."
  (loop for n   = 1 then (+ n n-1)
        and n-1 = 0 then n
        while (< n largest*)
        if (even n)
          sum n))
