(in-package :clamp)

(defparameter largest* 100
  "The upper bound on the problem")

(def sum-digits (n)
  "Sums the digits of its argument."
  (if (is n 0)
      0
      (+ (mod n 10) (sum-digits (floor n 10)))))

(def fact (n)
  "Calculates the factorial of its argument."
  (if (is n 0)
      1
      (* n (fact (- n 1)))))

(def solve ()
  "Solves PE problem 20"
  (sum-digits (fact largest*)))
