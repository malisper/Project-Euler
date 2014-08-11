(in-package :clamp)

;; https://github.com/smithzvk/cl-primality
(use-package :cl-primality)

(defparameter largest* 2000000
  "The largest number needed for the problem.")

(def solve ()
  "Solves PE problem 10."
  (loop for i from 1 below largest*
        ;; use miller-rabin because we give a higher
        ;; probability for false-positives than primep
        ;; making it faster
        if (miller-rabin i 1d-10)
          sum i))
