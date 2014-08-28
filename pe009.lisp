(in-package :clamp)

(defparameter total* 1000
  "What the sum of the three numbers has to be.")

(def sqr (n)
  "Returns the square of its argument."
  (* n n))

(def triple (a b c)
  "Are A, B, and C a pythagorean triple?"
  (is (+ (sqr a) (sqr b))
      (sqr c)))

(def solve ()
  "Solve PE problem 9."
  (upto a 1 total*
    (upto b (+ a 1) total*
      (let c (- total* a b)
	(when (triple a b c)
	  (return-from solve (* a b c)))))))
