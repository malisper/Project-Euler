(in-package :clamp)

(defparameter row-length* 50
  "The length of the row for this problem.")

(defparameter tiles* '(2 3 4)
  "The tiles that can be used for this problem.")

(defmemo num-ways (m n)
  "The number of ways to tile a row of length N using only tiles of
   length M. This includes using no tiles at all."
  (if (< n m)
      1
      (+ (num-ways m (- n 1))
         (num-ways m (- n m)))))

(def num-ways-atleast-one (m n)
  "The number of ways to tile a row of length N using only tiles of
   length M. This does not inlucde using no tiles at all."
  (- (num-ways m n) 1))

(def solve ()
  "Solves PE problem 116."
  (reduce #'+ tiles* :key [num-ways-atleast-one _ row-length*]))
