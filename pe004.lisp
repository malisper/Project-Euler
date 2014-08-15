(in-package :clamp)

(defparameter lowest*  100  "The lower bound on the problem.")
(defparameter largest* 1000 "The upper bound on the problem.")

(def palindrome (n)
  "Is this number a palindrome?"
  (ado (tostring (pr n))
       (iso it (rev it))))

(def solve ()
  "Solve PE problem 4."
  (ret result 0
    (up n1 lowest* largest*
      (up n2 n1 largest*
	(let product (* n1 n2)
	  (when (palindrome product)
	    (zap #'max result product)))))))
