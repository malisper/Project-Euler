(in-package :clamp)

(defparameter upper-a* 100 "The upper bound on a.")
(defparameter upper-b* 100 "The upper bound on b.")

(def sum-digits (n)
  "Sums the digits of its argument."
  (if (is n 0)
      0
      (+ (mod n 10) (sum-digits (floor n 10)))))

(def solve ()
  "Solves PE problem 56."
  (ret result 0
    (up a 1 upper-a*
      (up b 1 upper-b*
	(zap #'max result (sum-digits (expt a b)))))))
