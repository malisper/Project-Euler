(in-package :clamp)

;; https://github.com/nakrakiiya/cl-prime-maker
(use-package :cl-prime-maker)

(defparameter number* 10001
  "The number we need for the problem.")

(def solve ()
  "Solves PE problem 7."
  (get-nth-prime number*))
