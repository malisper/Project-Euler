(in-package :clamp)

(defparameter multiplier* 6
  "The largest multiplier needed for this problem.")

(def answer (n m)
  "Is this the answer (do the numbers 1x 2x .. Mx this number, all use 
   the same digits as this number)?"
  (every [same-digits n (* n _)]
         (range 1 m)))

(def digits (n)
  "Returns a list of the digits of N."
  (ret result '()
    (while (> n 0)
      (push (mod n 10) result)
      (zap #'floor n 10))))

(def same-digits (a b)
  "Do these two numbers use the same digits?"
  (iso (sort #'< (digits a))
       (sort #'< (digits b))))

(def solve ()
  "Solves PE problem 52."
  (loop for i from 1
        if (answer i multiplier*)
          return i))
