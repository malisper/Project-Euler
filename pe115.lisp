(in-package :clamp)

(defparameter m* 50
  "The value of M needed for this problem.")

(defparameter exceed* 1000000
  "The number needed to be exceeded for this problem.")

(defmemo f (m n)
  "The number of ways to fill a row of length N using blocks of
   minimum length M."
  (if (< n m)
      1 
      (+ (f m (- n 1))
         (loop for i from m to n
               sum (f m (- n i 1))))))

(def solve ()
  "Solves PE problem 115."
  (loop for n from 0
        if (> (f m* n) exceed*)
          return n))
