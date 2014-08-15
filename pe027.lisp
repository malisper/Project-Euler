(in-package :clamp)

;; https://github.com/smithzvk/cl-primality
(use-package :cl-primality)

(defparameter lower-a* -999 "The lower bound on a.")
(defparameter lower-b* -999 "The lower bound on b.")
(defparameter upper-a*  999 "The upper bound on a.")
(defparameter upper-b*  999 "The upper bound on b.")

(def quad-val (a b n)
  "Returns the value of the quadratic [n^2 + an + b] using
   the values passed in."
  (+ (* n n) (* a n) b))

(def num-prime (a b)
  "Returns the number of consecutive prime numbers this quadratic
   generates."
  (loop for n from 0
        for val = (quad-val a b n)
        while (and (> val 0) (miller-rabin val 1d-10))
        finally (return n)))

(def solve ()
  "Solves PE problem 27."
  (ret result 0
    (let best-score 0
      (upto a lower-a* upper-a*
        (upto b lower-b* upper-b*
          (let next-score (num-prime a b)
            (when (> next-score best-score)
              (= best-score next-score
                 result (* a b)))))))))
