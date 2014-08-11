(in-package :clamp)

;; https://github.com/smithzvk/cl-factoring
(use-package :cl-factoring)

(defparameter number* 600851475143
  "The number needed for the problem.")

(def solve ()
  "Solves PE problem 3."
  (last1 (factor number*)))
