(in-package :experimental)

(defparameter num-truncable* 11
  "The number of truncable primes.")

(mac delay (x)
  "Delays the evaluation of an expression."
  `(lambda () ,x))

(def force (x)
  "Forces a delayed expression."
  (funcall x))

(mac make-pipe (x y)
  "Creates a pipe with a head of X and a tail of Y."
  `(cons ,x (delay ,y)))

(def head (pipe)
  "Returns the head of a pipe."
  (car pipe))

(def tail (pipe)
  "Returns the tail of a pipe."
  (if (functionp (cdr pipe))
      (zap #'funcall (cdr pipe))
      (cdr pipe)))

(def integers (n)
  "Returns a pipe of the integers starting from n."
  (make-pipe n (integers+inc n)))

(def keep-pipe (f pipe)
  "Keeps all of the elements of the pipe PIPE that satisify F."
  (if (funcall f (head pipe))
      (make-pipe (head pipe) (keep-pipe f (tail pipe)))
      (keep-pipe f (tail pipe))))

(def sqr (n)
  "Returns the square of n."
  (* n n))

(defparameter primes* (make-pipe 2 (keep-pipe #'primep (integers 3)))
  "A pipe of all of the prime numbers.")

(def primep (n)
  "Is this number prime?"
  (and (> n 1)
       (rec (ps primes*)
         (or (< n (sqr+head ps))
             (and (~multiple n (head ps))
                  (recur+tail ps))))))

(def cut-left (n)
  "Cuts off the left most digit of its argument."
  (mod n (expt 10 (floor+log n 10))))

(def left-to-right-truncable (n)
  "Is this number left to right truncable?"
  (or (is n 0)
      (and (primep n)
           (left-to-right-truncable+cut-left n))))

(def cut-right (n)
  "Cuts off the right most digit of its argument."
  (floor n 10))

(def right-to-left-truncable (n)
  "Is this number right to left truncable?"
  (or (is n 0)
      (and (primep n)
           (right-to-left-truncable (cut-right n)))))

(def truncable-prime (n)
  "Is this number a truncable prime?"
  (and (right-to-left-truncable n)
       (left-to-right-truncable n)))

(def firstn-pipe (n pipe)
  "Returns a list of the first N elements of PIPE."
  (if (is n 1)
      (list (head pipe))
      (cons (head pipe) (firstn-pipe (dec n) (tail pipe)))))

(def solve ()
  "Solves PE problem 37."
  (reduce #'+
    (firstn-pipe num-truncable*
      (keep-pipe #'truncable-prime
        (tail+tail+tail+tail primes*)))))
