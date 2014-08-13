(in-package :clamp)

;; https://github.com/smithzvk/cl-primality
(use-package :cl-primality)

(def digits (n)
  "Returns a list of the digits of n."
  (ret result '()
    (while (> n 0)
      (push (mod n 10) result)
      (zap #'floor n 10))))

(def permutations (xs)
  "Returns a list of all of the permutations of xs."
  (if (null xs)
      '(())
      (cart #'cons xs (permutations (rem it xs :count 1)))))

(def pandigital (x)
  "Is this a pandigital number (does it use all of the digits from 1
   to some number k exactly once)?"
  (let ds (digits x)
    (iso (nsort #'< ds) (range 1 (len ds)))))

(def list->number (xs)
  "Takes a list of digits and returns the number they represent."
  (ret result 0
    (each d xs
      (zap #'* result 10)
      (++ result d))))

(def solve ()
  "Solves PE problem 41."
  (downfrom n 9 1 ; the largest pandigital only has 9 digits
    (each pan (nsort #'> (map #'list->number (permutations (range 1 n))))
      (when (primep pan)
        (return-from solve pan)))))
