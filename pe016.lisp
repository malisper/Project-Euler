(in-package :clamp)

(defparameter power* 1000
  "The power we have to raise to for this problem.")

(def sum-digits (n)
  "Sums the digits of its argument."
  (if (is n 0)
      0
      (+ (mod n 10) (sum-digits (floor n 10)))))

(def solve ()
  "Solves PE problem 16."
  (sum-digits (expt 2 power*)))
