(in-package :clamp)

(defparameter largest* 1000000
  "The upper bound on the problem.")

(def collatz-next (n)
  "Returns the next number in the collatz sequence after its argument."
  (if (even n)
      (/ n 2)
      (+ (* 3 n) 1)))

(defmemo collatz-chain (n)
  "Returns the 'Collatz chain' of its argument."
  (if (is n 1)
      '(1)
      (cons n (collatz-chain (collatz-next n)))))

(def solve ()
  "Solves PE problem 14."
  (best (compare #'>
		 (compose #'len #'collatz-chain))
	(range 1 largest*)))
