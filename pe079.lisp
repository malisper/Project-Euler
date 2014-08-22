(in-package :clamp)

(defparameter file* "~/keylog.txt")

(def digits (n)
  "Returns a list of the digits of n."
  (ret result '()
    (while (> n 0)
      (push (mod n 10) result)
      (zap #'floor n 10))))

(def parse-file ()
  "Returns a list of lists representing the digits entered on each
   passcode entered."
  (map (compose #'digits #'parse-integer) (tokens (filechars file*))))

(def valid1 (passcode entered-code)
  "Does this passcode work for this single code?"
  (loop for d in entered-code
        for start = (pos d passcode) then (pos d passcode :start (+ start 1))
        unless start ; This digit does not come after the previous one.
          return nil
        finally (return t)))

(def valid (passcode entered)
  "Does this passcode (a list of digits), work for all of the digits
   entered?"
  (every [valid1 passcode _] entered))

(def solve ()
  "Solves PE problem 79."
  (loop with entered = (parse-file)
        for i from 0
        if (valid (digits i) entered)
          return i))


