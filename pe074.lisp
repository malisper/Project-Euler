(in-package :clamp)

(defparameter largest* 1000000
  "The upper bound on the problem.")

(defparameter chain-length* 60
  "The length of the chain needed.")

(def fact (n)
  "Returns the factorial of N."
  (if (is n 0)
      1
      (* n (fact (- n 1)))))

(def sum-fact-of-digits (n)
  "Returns the sum of the factorial of the digits of N."
  (if (is n 0)
      0
      (+ (fact (mod n 10)) (sum-fact-of-digits (floor n 10)))))

(def valid (n)
  "Does this number have a chain of the proper length?"
  (loop with current   = n 
        with num-times = 0 ; This is needed in case of early breaking.
        with seen      = (table)
       
        repeat chain-length*
        while (no (gethash current seen)) do
          (= (gethash current seen) t)
          (zap #'sum-fact-of-digits current)
          (++ num-times)
        finally (return (and (is num-times chain-length*)
                             (gethash current seen)))))

(def solve ()
  "Solves PE problem 74."
  (loop for i from 1 below largest* count (valid i)))
