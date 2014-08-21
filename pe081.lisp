(in-package :clamp)

(defparameter file* "~/matrix.txt"
  "The file containing the matrix.")

(def parse-matrix ()
  "Parses the matrix in file*. Returns a vector of vectors."
  (coerce (map #'parse-line (tokens (filechars file*) #\newline))
          'vector))

(def parse-line (line)
  "Parses a row of the matrix and returns a vector of every number in
   that row."
  (coerce (map #'parse-integer (tokens line #\,))
          'vector))

(defparameter matrix* (parse-matrix))
(defparameter num-rows* 80)
(defparameter num-cols* 80)

(defmemo shortest (r c)
  "Returns the shortest distance of the matrix starting at the given
   row and column."
  (+ (aref (aref matrix* r) c)
     (if (and (is r (- num-rows* 1))
              (is c (- num-cols* 1)))
           0
         (is r (- num-rows* 1))
           (shortest r (+ c 1))
         (is c (- num-cols* 1))
           (shortest (+ r 1) c)
         :else
           (min (shortest (+ r 1) c)
                (shortest r (+ c 1))))))

(def solve ()
  "Solves PE problem 81."
  (shortest 0 0))
