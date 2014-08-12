(in-package :clamp)

(defparameter digits* '(1 10 100 1000 10000 100000 1000000)
  "The decimal places needed for the problem.")

(def num-digits (n)
  "Returns the number of digits in its argument."
  (len (tostring (pr n))))

(def nth-digit (n d)
  "Gets the dth digit of the number n (from the left, zero indexed)."
  (ado (tostring (pr n))
       (char it d)
       (char->digit it)))

(def char->digit (c)
  "Takes the char version of a number and returns the actual number."
  (- (char-code c) #.(char-code #\0)))

(def get-places (places)
  "Gets all of the places specified by 'places' of Champernowne's
   constant. 'places' needs to be a list from smallest to largest."
  (ret result 1
    (loop while places
          for i from 1
          for digits = (num-digits i)
          for seen = digits then (+ seen digits)
          if (>= seen (car places))
            do (zap #'*
                    result
                    (nth-digit i (- digits 1 (- seen (pop places))))))))

(def solve ()
  "Solves PE problem 40."
  (get-places digits*))
