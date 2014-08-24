(in-package :clamp)

(def digit-canceling (n1 n2 d1 d2)
  "Is the fraction (10*N1 + N2)/(10 * D1 + D2) a fraction that can be
   cancelled incorrectly yet still get the right result?"
  (withs (numer (+ (* 10 n1) n2)
          denom (+ (* 10 d1) d2)
          correct (/ numer denom))
    (and (< numer denom)
         (or (and (is n1 d1)
                  (is correct (/ n2 d2)))
             (and (is n1 d2)
                  (is correct (/ n2 d1)))
             (and (is n2 d1)
                  (is correct (/ n1 d2)))
             (and (is n2 d2)
                  (is correct (/ n1 d1)))))))

(def solve ()
  "Solves PE problem 33."
  (denominator
    (ret result 1
      (up n1 1 10
        (up n2 1 10
          (up d1 1 10
            (up d2 1 10
              (when (digit-canceling n1 n2 d1 d2)
                (zap #'* result (/ (+ (* 10 n1) n2)
                                   (+ (* 10 d1) d2)))))))))))
