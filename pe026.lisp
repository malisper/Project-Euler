(in-package :clamp)

(defparameter largest* 1000
  "The upper bound on the problem.")

(def cycle (n)
  "Return the length of the cycle in 1/N."
  (rec (numer 1 denom n seen '())
    (aif (is numer 0) ; If the numerator is zero
           0          ; there is no cycle.
         (pos numer seen) ; If we have seen this numerator already
           (+ it 1)       ; return how long ago we saw it.
         :else
           (recur (* 10 (mod numer denom)) denom (cons numer seen)))))

(def solve ()
  "Solves PE problem 26."
  (best #'> (range 1 (- largest* 1)) #'cycle))
