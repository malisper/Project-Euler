(in-package :clamp)

(def sqr (x)
  "Returns the square of x."
  (* x x))

(def triple (a b c)
  "Are a, b, and c a pythagorean triple?"
  (and (< a b c)
       (is (+ (sqr a) (sqr b))
           (sqr c))))

(def num-solutions (p)
  "How many right triangles with integer sides are there with
   this perimeter?"
  (ret result 0
    (upto a 1 p
      (upto b a (- p a)
        (let c (- p a b)
          (when (triple a b c)
            (++ result)))))))

(def solve ()
  "Solves PE problem 39."
  (best #'> (range 1 1000) #'num-solutions))
