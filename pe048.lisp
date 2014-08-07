(in-package :clamp)

(defparameter largest* 1000
  "The upper bound on the problem.")

(def self-power (n)
  "Raise n to the nth power."
  (expt n n))

(def last-digits (d n)
  "Returns a number which is the last d digits of n."
  (mod n (expt 10 d)))

(def solve ()
  "Solves PE problem 48."
  (last-digits 10
	       (loop for i from 1 to largest*
		     sum (self-power i))))

