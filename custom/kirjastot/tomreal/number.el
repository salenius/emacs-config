;;; -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Numeroiden käsittelyn kustomoidut funktiot
;;; Author: Tommi Salenius
;;; Email: tommisalenius@gmail.com
;;; Created: La, 1.12.2019
;;; License: GPL (2019)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'dash)

;;; Code:

(defun tomreal/inc (x)
  "X: numero.
Nosta numeroa yhdellä."
  (+ x 1))

(defun tomreal/dec (x)
  "X: numero.
Laske numeroa yhdellä."
  (- x 1))

(defun tomreal/even? (x)
  "X: numero.
Onko numero parillinen."
  (eq (% x 2) 0))

(defun tomreal/odd? (x)
  "X: numero.
Onko numero pariton."
  (eq (tomreal/even? x) nil))

(defun tomreal/round-number (luku tarkkuus)
  "LUKU: luku, joka pyöristetään.
TARKKUUS: int, kuinka monen desimaalin tarkkuus."
  (-as-> tarkkuus $
      (number-to-string $)
      (concat "%." $ "f")
      (format $ luku)
      (string-to-number $)))

;;; number.el ends here
