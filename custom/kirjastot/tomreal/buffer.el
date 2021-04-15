;;; -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Buffereiden käsittelyyn tarkoitetut funktiot
;;; Author: Tommi Salenius
;;; Email: tommisalenius@gmail.com
;;; Created: 27.04.2020
;;; License: GPL 2020
;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Code:

(require 's)

(defun tomreal/buffer-name?
    (name)
  (equal (buffer-name) name))

(defun tomreal/buffer-name-like?
    (like)
  (s-matches? like (buffer-name)))

(defun tomreal/go-to-last-buffer
    ()
  (progn (evil-switch-to-windows-last-buffer)
	 (print (concat  "Going to buffer " (buffer-name)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun tomreal/jump-scratch-buffer-or-back
      ()
    (interactive)
    (if (tomreal/buffer-name? "*scratch*")
	(tomreal/go-to-last-buffer)
      (progn (print "Going to buffer *scratch*")
	     (switch-to-buffer "*scratch*"))))

(defun tomreal/jump-to-eshell-buffer
    ()
  (interactive)
  (if (tomreal/buffer-name? "*eshell*")
      (tomreal/go-to-last-buffer)
    (switch-to-buffer "*eshell*")))

(defun tomreal/jump-to-cider-repl-and-back
    ()
  (interactive)
  (if (tomreal/buffer-name-like? "\\.clj")
      (cider-switch-to-repl-buffer)
    (cider-switch-to-last-clojure-buffer)))



;;; buffer.el ends here
