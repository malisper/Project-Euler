(in-package :clamp)

(defparameter num-months* 12
  "The number of months in a year.")

(defparameter earliest-year* 1901
  "The earliest year needed to be looked at")

(defparameter latest-year* 2000
  "The last year needed to be looked at.")

(def sunday (day month year)
  "Is it a sunday on the specified day, month, and year."
  ;; the 6th return value of decode-universal time is the weekday and
  ;; sunday has a value of 6
  (is 6 (nth-value 6 (decode-universal-time
                       (encode-universal-time 0 0 0 day month year)))))

(def solve ()
  "Solves PE problem 19."
  (ret result 0
    (upto month 1 num-months*
      (upto year earliest-year* latest-year*
        (when (sunday 1 month year)
          (++ result))))))
