(in-package :clamp)

(defparameter triangle*
"75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"
  "A string of the triangle needed for the problem.")

(def parse-line (line)
  "Returns a list containing every number from a string which is one
   row of the triangle."
  (map #'parse-integer (tokens line)))

(def parse-triangle ()
  "Returns a parsed version of the triangle where every element is a
   list representing a row."
  (map #'parse-line (tokens triangle* #\newline)))

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
  "Solves PE problem 18."
  (max-sum 0 0))
