(in-package :clamp)

;; https://github.com/smithzvk/cl-factoring
(use-package :cl-factoring)

(defparameter largest* 28123
  "The largest number that can be abundent.")

(def prime-factors (n)
  "Returns an alist of every prime factor and the number of times it
   it occurs in N."
  (ado (factor n)
       (counts it)
       (tablist it)))

(def prime-factors->all-factors (ps)
  "Given an alist of the prime-factors of a number and how often the 
   occur, return all of the factors of that number."
  (if (no ps)
      '(1)
      (cart #'*
            (map [expt (caar ps) _] (range 0 (cadar ps)))
            (prime-factors->all-factors (cdr ps)))))

(def proper-factors (n)
  "Returns all of the proper factors of a number."
  (ado (prime-factors n)
       (prime-factors->all-factors it)
       (rem n it)))

(def abundent (n)
  "Is this an abundent number?"
  (> (reduce #'+ (proper-factors n))
     n))

(def abundents (n)
  "Returns a list of all of the abundent numbers less than or equal
   to N."
  (keep #'abundent (range 1 n)))

(def non-abundent-sums ()
  "Returns a list of all of the numbers which can not be represented
   as the sum of two abundent numbers."
  (keys
    (ret tab (table)
      (upto i 1 largest*
        (= (gethash i tab) t))
      (let abundents (abundents largest*)
        (each a abundents
          (each b abundents
            (remhash (+ a b) tab)))))))

(def solve ()
  "Solves PE problem 23."
  (reduce #'+ (non-abundent-sums)))
