(in-package :clamp)

;; https://github.com/smithzvk/cl-factoring
(use-package :cl-factoring)

(defparameter factors* 500
  "The number of factors the solution needs to have.")

(def num-factors (n)
  "Returns the number of factors of a number."
  (ado (factor n)
       (counts it)
       (vals it)
       (reduce #'* it :key #'1+)))

(def answer (n)
  "Is this number the answer (does it have enough factors)?"
  (>= (num-factors n) factors*))

(def triangle (n)
  "Returns the Nth triangle number [(triangle 1) = 1]."
  (* (+ n 1) n 1/2))

(def solve ()
  "Solves PE problem 12."
  (loop for i from 1
        for tri = (triangle i)
        if (answer tri)
          return tri))
