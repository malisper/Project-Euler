(in-package :clamp)

(defparameter position* 1000000
  "The position we need for this problem.")

(def permutations (xs)
  "Returns a list of all of the permutations of xs."
  (if (null xs)
      '(())
      (cart #'cons xs (permutations (rem it xs :count 1)))))

(def list->number (xs)
  "Takes a list of digits and returns the number they represent."
  (ret result 0
    (each d xs
      (zap #'* result 10)
      (++ result d))))

(def solve ()
  "Solves PE problem 24."
  (ado (range 0 9)
       (permutations it)
       (nth (- position* 1) it)
       (list->number it)))
