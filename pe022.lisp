(in-package :clamp)

(defparameter file* "~/names.txt"
  "The file containing the names for this problem.")

(def parse-file ()
  "Returns a list containing all of the names in the file, sorted
   in alphabetical order."
  (sort #'string<
        (tokens (filechars file*)
                (notf #'alpha-char-p))))

(def charval (c)
  "Returns the alphabetical value of this char (A=1, B=2, .., Z=26)."
  (- (char-code c) #.(- (char-code #\A) 1)))

(def alphaval (name)
  "Returns the alphaval of this name. The alphaval is the sum of the
   charvals of the individual chars in the name."
  (reduce #'+ name :key #'charval))

(def solve ()
  "Solves PE problem 22."
  (loop for name in (parse-file)
        for i from 1
        sum (* i (alphaval name))))
