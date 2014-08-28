(in-package :clamp)

(def fact (n)
  "Returns the factorial of N."
  (if (is n 0)
      1
      (* n (fact (- n 1)))))

(def calc-bound ()
  "Calculates the upperbound for the problem."
  (loop for digits from 1
        if (< (* digits (fact 9)) (- (expt 10 digits) 1))
          return (expt 10 digits)))

(def sum-fact-of-digits (n)
  "Returns the sum of the factorial of the digits of N."
  (if (is n 0)
      0
      (+ (fact (mod n 10)) (sum-fact-of-digits (floor n 10)))))

(def valid (n)
  "Is this a number to be included in the sum (is the sum of the
   factorial of its digits itself)?"
  (is n (sum-fact-of-digits n)))

(def solve ()
  "Solves PE problem 34."
  (loop for i from 3 below (calc-bound)
        if (valid i)
          collect i))
