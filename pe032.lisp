(in-package :clamp)

(defparameter largest-multiplicand* 10000
  ;; It is impossible for the multiplicand to have more than four
  ;; digits because than the result would also need more than four
  ;; digits and there are only nine digits total.
  "The upper bound on the multiplicands and multiplers for a
   pandigital group.")

(def digits (n)
  "Returns a list of the digits of N."
  (ret result '()
    (while (> n 0)
      (push (mod n 10) result)
      (zap #'floor n 10))))

(def pandigital (n)
  "Is this a pandigital number?"
  (iso (sort #'< (digits n)) '#.(range 1 9)))

(def pandigital-product (x y)
  "Is the number formed by concatenating X Y and X * Y a pandigital
   number?"
  (let str (tostring (pr x y (* x y)))
    (and (is (len str) 9)
         (pandigital (parse-integer str)))))

(def solve ()
  "Solves PE problem 32."
  (reduce #'+
    (keys
      (ret tab (table)
        (up a 1 largest-multiplicand*
          (up b a largest-multiplicand*
            (when (pandigital-product a b)
              (= (gethash (* a b) tab) t))))))))
