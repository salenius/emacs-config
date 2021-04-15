;;; -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Omat päivämäärän käsittelyfunktiot
;;; Author: Tommi Salenius
;;; Email: tommisalenius@gmail.com
;;; Created: Su, 1.12.2019
;;; License: GPL (2018)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Code:

(defun tomreal/pvm (x)
  "X: String.
Aseta nykyinen päivämäärä bufferiin."
  (insert (format-time-string x)))

(defun tomreal/pvm-formated ()
  (tomreal/pvm "%d.%m.%Y"))

(defun tomreal/pvm-year ()
  (tomreal/pvm "%Y"))

;; (defun sale-pvm-formated-with-weekday)


;;; datetime.el ends here
