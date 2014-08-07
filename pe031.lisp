(in-package :clamp)

(defparameter change-for* 200
  "The amount needed to be made into change.")

(defparameter coins* '(200 100 50 20 10 5 2 1)
  "The coins we can use to make change.")

(def num-ways (n &optional (coins coins*))
  "The number of ways we can make change for the argument."
  (if (or (< n 0) (null coins))
        0
      (is n 0)
        1
      'else
        (+ (num-ways (- n (car coins)) coins)
	   (num-ways n (cdr coins)))))

(def solve ()
  "Solves PE problem 31."
  (num-ways change-for*))
