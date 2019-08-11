(declaim (optimize (speed 3)
                   (compilation-speed 0)
                   (safety 0)
                   (debug 3)))

(defconstant arrays-size 100000000)
(defvar *from-array* (make-array arrays-size :element-type `integer))
(defvar *to-array* (make-array arrays-size :element-type `integer))

(dotimes (i arrays-size)
    (setf (aref *from-array* i) (random arrays-size)))

(defun test (to from val)
  (declare (type (simple-array integer (*)) to from))
  (declare (type integer val))
  (dotimes (i arrays-size)
    (setf (aref to i) (+ (aref from i) val))))


(defun testRecurse (to from val)
  (declare (type (simple-array integer (*)) to from))
  (declare (type integer val))
  (labels ((set-value (i)
              (declare (type integer i))
              (if (not (eq i arrays-size))
                (progn
                  (setf (aref to i) (+ (aref from i) val))
                  (set-value (1+ i))))))
    (set-value 0)))

(time (test *to-array* *from-array* (random arrays-size)))
(time (testRecurse *to-array* *from-array* (random arrays-size)))


;;;; Nie działa na windowsie :(
;;;(in-package :cl-user)
;;;(require :sb-sprof)
;;;
;;;(sb-sprof:with-profiling (:max-samples 1000
;;;                          :report :flat
;;;                          :loop t
;;;                          :show-progress t)
;;;  (test *to-array* *from-array* (random arrays-size)))

