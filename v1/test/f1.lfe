(include-file "include/flavors.lfe")

(defflavor f1 (a (m  42) z (share 'f1) x y)
           (f2)
  gettable-instance-variables
  (settable-instance-variables a m z)   ;share is not settable
  inittable-instance-variables)

;; Comment this out to test required-methods.
(defmethod (f1 set-y) (v)
  (tuple 'ok (mupd self 'y v)))

(defmethod (f1 after set-y) (v)
  (lfe_io:format "f1 after set-y ~p\n" (list self))
  self)

(defmethod (f1 before set-a) (v)
  (lfe_io:format "f1 before set-a ~p\n" (list self))
  self)

(defmethod (f1 one) (x y z)
  (tuple (+ x y z) self))

(defmethod (f1 before one) (x y z)
  (print "f1 before one ~p\n" (list self))
  self)

(defmethod (f1 after one) (x y z)
  (print "f1 after one ~p\n" (list self))
  self)

(defmethod (f1 two) (x y z)
  (tuple (* x y z) self))

(defmethod (f1 before two) (x y z)
  (print "f1 before two ~p\n" (list self))
  self)

;; A local function called by the methods.
(defun print (f as)
  (lfe_io:format f as))

(endflavor f1)
