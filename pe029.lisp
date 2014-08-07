(in-package :clamp)

(defparameter lower-a* 2   "The lower bound on a.")
(defparameter lower-b* 2   "The lower bound on b.")
(defparameter upper-a* 100 "The upper bound on a.")
(defparameter upper-b* 100 "The upper bound on b.")

(def solve ()
  "Solves PE problem 29."
  (ret result 0
    (let seen (table)
      (upto a lower-a* upper-a*
	(upto b lower-b* upper-b*
	  (let power (expt a b)
	    (unless (gethash power seen)
	      (= (gethash power seen) t)
	      (++ result))))))))
