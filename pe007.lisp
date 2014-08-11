(in-package :clamp)

;; https://github.com/nakrakiiya/cl-prime-maker
(use-package :cl-prime-maker)

(def solve ()
  "Solves PE problem 7."
  (get-nth-prime 10001))
