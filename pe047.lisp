(in-package :clamp)

;; https://github.com/smithzvk/cl-factoring
(use-package :cl-factoring)

(defparameter len-run* 4
  "The length of the run needed.")

(defparameter num-distinct* 4
  "The number of distinct factors needed.")

(def distinct-prime-factors (n k)
  "Does n have k distinct prime factors?"
  (is (len (dedup (factor n)))
      k))

(def run (start distinct length &optional (current 0))
  "Starting at start, find the first number of the first run of 
   consecutive numbers of length LENGTH. All the numbers in which
   have DISTINCT distinct prime factors."
  (if (is length current)
        (- start current)
      (distinct-prime-factors start distinct)
        (run (+ start 1) distinct length (+ current 1))
      :else
        (run (+ start 1) distinct length 0)))

(def solve ()
  "Solves PE problem 47."
  (run 2 num-distinct* len-run*))
