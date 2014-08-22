(in-package :clamp)

(defparameter row-size* 50)
(defparameter min-block* 3)

(defmemo num-ways (n)
  "The number of ways to tile a row of ROW-SIZE* using blocks of
   at least length MIN-BLOCK*."
  (if (< n min-block*)
      1 
      (+ (num-ways (- n 1))
         (loop for i from min-block* to n
               sum (num-ways (- n i 1))))))

(def solve ()
  "Solves PE problem 114."
  (num-ways row-size*))
