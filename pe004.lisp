(in-package :clamp)

(defparameter lowest* 100)
(defparameter largest* 1000)

(def palindrome (n)
  (ado (tostring (pr n))
       (iso it (rev it))))

(def solve ()
  (ret result 0
    (up n1 lowest* largest*
      (up n2 n1 largest*
	(let product (* n1 n2)
	  (when (palindrome product)
	    (zap #'max result product)))))))
