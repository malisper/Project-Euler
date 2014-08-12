(in-package :clamp)

(defparameter power* 5
	"The power raised to for the problem.")

(def most-digits ()
	"Calculates the largest number of digits needed for the problem."
	(loop for i from 1
			  ;; The condition is true if the largest sum of digit powers
			  ;; does not have enough digits. Since this is true when we
			  ;; are too far, one needs to be subtracted from that number
		    if (< (* i (expt 9 power*))
							(expt 10 (- i 1)))
		      return (- i 1)))

(def sum-of-digits-power (n p)
	"Returns the sum of the digits of n raised to the p power."
	(if (is n 0)
			0
			(+ (expt (mod n 10) p)
				 (sum-of-digits-power (floor n 10) p))))

(def valid (n p)
	"Is n the sum of its digits raised to the p power?"
	(is n (sum-of-digits-power n p)))

(def solve ()
	"Solves PE problem 30."
	(loop for i from 2 below (expt 10 (+ 1 (most-digits)))
			  if (valid i power*)
			    sum i))
