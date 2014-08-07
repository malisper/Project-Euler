(in-package :clamp)

(defparameter digts-needed* 1000
  "The number of digits needed for the problem.")

(def num-digits (n)
  "Calculates the number of digits in its argument."
  (len (tostring (pr n))))

(def answer (n)
  "Is this the answer?"
  (>= (num-digits n) digts-needed*))

(def solve ()
  "Solves PE problem 25."
  (loop for term from 1
        for n   = 1 then (+ n n-1)
        and n-1 = 0 then n
        when (answer n)
          return term))
