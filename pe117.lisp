(in-package :clamp)

(defparameter tiles* '(2 3 4)
  "The lengths of the tiles that can be used in this problem.")

(defparameter row-length* 50
  "The length of the row in this problem.")

(defmemo num-ways (tiles n)
  "The number of ways to tile a row of length N, using tiles
   of the lengths specified in the list TILES."
  (if (every [< n _] tiles)
      1
      (+ (num-ways tiles (- n 1))
         (loop for tile in (keep [<= _ n] tiles)
               sum (num-ways tiles (- n tile))))))

(def solve ()
  "Solves PE problem 117."
  (num-ways tiles* row-length*))
