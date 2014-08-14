(in-package :clamp)

(defparameter triangle* "~/triangle.txt"
  "The file the triangle is stored in.")

(def parse-line (line)
  "Returns a list containing every number from a string which is one
   row of the triangle."
  (map #'parse-integer (tokens line)))

(def parse-triangle ()
  "Returns a parsed version of the triangle where every element is a
   list representing a row."
  (map #'parse-line (tokens (filechars triangle*) #\newline)))

(defparameter parsed-triangle* (parse-triangle)
  "A parsed version of the triangle. A list of lists where every
   element of the outer list represents a row in the triangle.")

(defmemo max-sum (r c)
  "Returns the maximum sum starting at the specified row and column."
  (if (>= r (len parsed-triangle*))
      0
      (+ (nth c (nth r parsed-triangle*))
	 (max (max-sum (+ r 1) (+ c 1))
	      (max-sum (+ r 1) c)))))

(def solve ()
  "Solves PE problem 67."
  (max-sum 0 0))
