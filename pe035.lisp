(in-package :clamp)

;; https://github.com/smithzvk/cl-primality
(use-package :cl-primality)

(defparameter largest* 1000000
  "The upper bound on the problem.")

(def primes-below (n)
  "Returns a list of all of the primes that are less than its
   argument."
  (loop for i from 2 below n
        if (miller-rabin i 1e-10)
          collect i))

(defparameter primes* (primes-below largest*)
  "All of the primes that will be used for this problem")

(defparameter prime-tab* (ret result (table)
                           (each p primes*
                             (= (gethash p result) t)))
  "A table containing all of the primes needed for this problem.")

(def digits (n)
  "Returns a list of the digits of N."
  (ret result '()
    (while (> n 0)
      (push (mod n 10) result)
      (zap #'floor n 10))))

(def list->number (xs)
  "Takes a list of digits and returns the number they represent."
  (ret result 0
    (each d xs
      (zap #'* result 10)
      (++ result d))))

(def rotations (n)
  "Returns all of the numbers that can be made by rotating the digits
   of its argument."
  (redup
    (accum a
      (let ds (digits n)
        (up i 0 (len ds)
          (mvb (front back) (split ds i)
            (a (list->number (append back front)))))))))

(def circular-prime (n)
  "Is this number a circular prime (are all of the digit rotations of
   this number prime)?"
  (every [gethash _ prime-tab*] (rotations n)))

(def solve ()
  "Solves PE problem 35."
  (count #'circular-prime primes*))
