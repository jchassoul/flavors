(include-file "include/flavors.lfe")

;; Define the circle flavor.
(defflavor circle (radius)
           (shape)
  ;; Settables are also gettable and inittable.
  (settable-instance-variables radius))

(defmethod (draw) ()
  (lfe_io:format "Drawing circle at (~p ~p), radius ~p~n"
                 (list (get 'x) (get 'y) (get 'radius))))

(endflavor circle)

;; Define the rectangle flavor.
(defflavor rectangle (width height)
           (shape)
  ;; Settables are also gettable and inittable.
  (settable-instance-variables width height))

(defmethod (draw) ()
  (lfe_io:format "Drawing rectangle at (~p ~p), width ~p, height ~p~n"
                 (list (get 'x) (get 'y)
                       (get 'width) (get 'height))))

(endflavor rectangle)

;; Define the shape flavor.
(defflavor shape (x y)
           ()
  ;; Settables are also gettable and inittable.
  (settable-instance-variables x y))

(defmethod (move-to) (new-x new-y)
  (set 'x new-x)
  (set 'y new-y)
  'ok)

(defmethod (r-move-to) (delta-x delta-y)
  (let ((x (get 'x))
        (y (get 'y)))
    (set 'x (+ x delta-x))
    (set 'y (+ y delta-y))
    'ok))

(defmethod (draw) ()
  (lfe_io:format "Drawing shape at (~p,~p)~n"
                 (list (get 'x) (get 'y))))

(endflavor shape)
