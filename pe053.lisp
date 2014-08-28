(in-package :clamp)

(defparameter greater-than* 1000000
  "The number the others have to be greater than for this problem.")

(defparameter largest-n* 100
  "The upper bound on this problem for N.")

(defmemo choose (n r)
  "Returns nCr (N choose R)."
  (if (< n r)
        0
      (in r 0 n)
        1
      :else
        (+ (choose (- n 1) r)
           (choose (- n 1) (- r 1)))))

(def solve ()
  "Solves PE problem 53."
  (ret result 0
    (upto n 0 largest-n*
      (upto r 0 n
        (when (> (choose n r) greater-than*)
          (++ result))))))
