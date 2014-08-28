(in-package :clamp)

(defparameter side* 1001
  "The length of a side of the spiral.")

(def sqr (x)
  "Returns the square of its argument."
  (* x x))

(def sigma (x y)
  "Given of a spiral (X units right, Y units up from the center),
   returns the number found at the location. This spiral is a little
   different from the one in the problem in that it goes up initially
   and goes counter clockwise."
  ;; From Concrete Mathematics pages 99 and 512.
  (let k (max (abs x) (abs y))
    (+ (sqr (* 2 k))
       (* (if (< x y) -1 1)
          (+ (* 2 k) x y))
       1)))

(def solve ()
  "Solves PE problem 28."
  ;; We can use the different spriral because the diagonals are still
  ;; the same.
  (ret result 0
    (++ result (sigma 0 0)) ; Count this only once.
    (upto x 1 (floor side* 2)
      (++ result (sigma x x))
      (++ result (sigma x (- x)))
      (++ result (sigma (- x) x))
      (++ result (sigma (- x) (- x))))))
