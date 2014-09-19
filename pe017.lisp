(in-package :experimental)

(defconstant length-and* (len "and")
  "The number of letters in the word 'and'.")

(defparameter largest* 1000
  "The upper bound on the problem.")

(def should-use-and (n)
  "Determines if there should be an 'and' in the number when written
   out in words. This is needed because the ~R directive for format
   does not include an 'and'. A number does not need an 'and' if it
   is either less than 100 or a multiple of 100."
  (~or (< n 100)
       (multiple n 100)))

(def num-letters (n)
  "Counts the number of letters, not including hypens and spaces, 
   needed to write out its argument in words."
  (+ (len+rem [in _ #\- #\Space] (tostring+prf "~R" n))
     (if (should-use-and n)
	 length-and*
	 0)))

(def solve ()
  "Solves PE problem 17."
  (loop for i from 1 to largest* sum (num-letters i)))
