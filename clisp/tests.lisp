(defconstant arrays-size 1000000)
(defvar *from-array*)
(defvar *to-array*)

;;; setup test 1
(setf *from-array* (make-array arrays-size))
(setf *to-array* (make-array arrays-size))

(dotimes (i arrays-size)
    (setf (aref *from-array* i) (random arrays-size)))

(defun test1 (to from val)
  (dotimes (i arrays-size)
    (setf (aref to i) (+ (aref from i) val))))

(time (test1 *to-array* *from-array* (random arrays-size)))


;;; setup test 2

(setf *from-array* (make-array arrays-size :element-type `fixnum))
(setf *to-array* (make-array arrays-size :element-type `fixnum))

(dotimes (i arrays-size)
    (setf (aref *from-array* i) (random arrays-size)))

(defun test2 (to from val)
  (declare (type (simple-array fixnum (*)) to from))
  (declare (type fixnum val))
  (dotimes (i arrays-size)
    (setf (aref to i) (+ (aref from i) val))))

(time (test2 *to-array* *from-array* (random arrays-size))) 

;;; setup test 3

(setf *from-array* (make-array arrays-size :element-type `fixnum))
(setf *to-array* (make-array arrays-size :element-type `fixnum))

(dotimes (i arrays-size)
    (setf (aref *from-array* i) (random arrays-size)))

(defun test3 (to from val)
  (declare (optimize (speed 3)
                     (compilation-speed 0)
                     (safety 0)
                     (debug 0)))
  (declare (type (simple-array fixnum (*)) to from))
  (declare (type fixnum val))
  (dotimes (i arrays-size)
    (setf (aref to i) (+ (aref from i) val))))

(time (test3 *to-array* *from-array* (random arrays-size)))

