(in-package :clamp)

(defparameter next-to* 3/7
  "The number we have to find the fraction next to.")

(defparameter left* 2/5
  "A number we knew at one point was to the leftof next-to*.")

(defparameter bound* 1000000
  "The upper bound on the problem.")

(def stern-brocot (left current max-d)
  "Returns the fraction to the left of CURRENT with the largest
   largest denominator less than MAX-D. LEFT needs to be a fraction
   which was to the left of CURRENT at some point."
  ;; From Concrete Mathematics page 116.
  (with (np (numerator current) mp (denominator current))
    (rec (n (numerator left) m (denominator left) prev (numerator left))
      (if (> m max-d)
          prev
          (recur (+ n np) (+ m mp) n)))))

(def solve ()
  "Solves PE problem 71."
  (stern-brocot left* next-to* bound*))
