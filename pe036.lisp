(in-package :clamp)

(defparameter largest* 1000000
  "The upper bound on the problem.")

(def palindrome (seq)
  "Is this sequence a palindrome?"
  (iso seq (rev seq)))

(def base-palindrome (base n)
  "Is n a palindrome when printed in the corresponding base?"
  (palindrome (format nil "~VR" base n)))

(def solve ()
  "Solves PE problem 36."
  (loop for i from 1 below largest* 
        if (and (base-palindrome 2  i)
		(base-palindrome 10 i))
        sum i))
