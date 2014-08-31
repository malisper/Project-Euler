(in-package :clamp)

(defparameter file* "~/words.txt"
  "The file needed for this problem.")

(def intp (n)
  "Is this number an integer? Includes floating point numbers that
   have integer values as well."
  (cl:= n (round n)))

(def parse-file ()
  "Returns a list of the names contained in the file."
  (tokens (filechars file*)
          (notf #'alpha-char-p)))

(def charval (c)
  "Returns the value of a char (the position it is in the alphabet)."
  (- (char-code c) (char-code #\A) -1))

(def wordval (word)
  "Returns the word value of WORD (the sum of the charvals of the
   individual characters of WORD)."
  (reduce #'+ word :key #'charval))

(def triangle (n)
  "Is this number a triangle number?"
  ;; This was derived using the quadratic formula.
  (intp (/ (+ -1 (sqrt (+ 1 (* 8 n))))
           2)))

(def solve ()
  "Solves PE problem 42."
  (count (compose #'triangle #'wordval)
         (parse-file)))
