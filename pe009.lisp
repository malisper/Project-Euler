(in-package :clamp)

(defparameter total* 1000)

(def sqr (n)
  "The square of n."
  (* n n))

(def triple (a b c)
  "Are a, b, and c a pythagorean triple?"
  (is (+ (sqr a) (sqr b))
      (sqr c)))

(def solve ()
  "Solve PE problem 9"
  (upto a 1 total*
    (upto b (+ a 1) total*
      (let c (- total* a b)
	(when (triple a b c)
	  (return-from solve (* a b c)))))))
