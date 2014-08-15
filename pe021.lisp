(in-package :clamp)

;; https://github.com/smithzvk/cl-factoring
(use-package :cl-factoring)

(defparameter largest* 10000
  "The upper bound on the problem.")

(def prime-factors (n)
  "Returns an alist of every prime factor and the number of times it
   it occurs in n."
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

(def d (n)
  "The function given in the problem. The sum of all of the prpoer 
   factors of a number."
  (reduce #'+ (proper-factors n)))

(def amicable (n)
  "Is this number part of an amicable pair [does d(d(n)) = n and
   d(n) \= n]"
  (let val (d n)
    (and (no (is n val))
         (is n (d val)))))

(def solve ()
  "Solves PE problem 21."
  (loop for i from 2 below largest*
        if (amicable i)
          sum i))
