(in-package :clamp)

(defparameter largest* 1000
  "The upper bound on the problem.")

(def self-power (n)
  "Raise N to the Nth power."
  (expt n n))

(def last-digits (d n)
  "Returns a number which is the last D digits of N."
  (mod n (expt 10 d)))

(def solve ()
  "Solves PE problem 48."
  (last-digits 10
	       (loop for i from 1 to largest*
		     sum (self-power i))))

