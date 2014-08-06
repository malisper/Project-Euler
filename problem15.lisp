(in-package :clamp)

(defparameter num-rows* 20)
(defparameter num-cols* 20)

(defmemo num-routes (row col)
  "Returns the number of routes starting from the specifed row and column."
  (if (or (is row num-rows*)
	  (is col num-cols*))
      1
      (+ (num-routes (+ row 1) col)
         (num-routes row (+ col 1)))))

(def solve ()
  "Solve PE problem 15."
  (num-routes 0 0))
