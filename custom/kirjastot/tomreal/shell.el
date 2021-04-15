;;; -*- lexical-binding: t -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Shell-funktiot
;;; Author: Tommi Salenius
;;; Email: tommisalenius@gmail.com
;;; Created: 01.12.2019
;;; License: GPL (2019)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 's)
(require 'dash)

;;; Code:

(defun tomreal/ls
    ()
  "DIRECTORY: kansion nimi, jonka tiedostot haetaan.
Ajaa shell-komennon 'ls' läpi, ja tuottaa lopputuloksena listan kansiossa olevista tiedostoista ja muista kansioista."
  (-as-> default-directory $
	 (s-concat "ls " $)
	 (shell-command-to-string $)
	 (split-string $ "\n")
	 ;; (-filter (lambda (x) (> x 0)) $)
	 ))

(defun tomreal/ls-include-file
    (directory ending)
  "DIRECTORY: kansio, josta haetaan sisältö.
ENDING: tiedoston pääte, jotka filtteröidään jäljelle."
  (->> directory
       tomreal/ls
       (-filter (-partial 's-contains? ending))))

(defun tomreal/ls-exclude-file
    (directory ending)
  "DIRECTORY: kansio, josta haetaan sisältö.
ENDING: tiedoston pääte, jotka filtteröidään pois."
  (->> directory
       tomreal/ls
       (-filter (-compose 'not (-partial 's-contains? ending)))))

(defun tomreal/grep
    (pattern file)
  "PATTERN: haettava regex.
FILE: tiedosto, josta etsitään.

Plain-vanilla grep, joka tulostaa hakutuloksena tulevat rivit listana."
  (->> file
       (s-concat "grep '" pattern "' ")
       shell-command-to-string
       split-string))

(defun tomreal/grep-line-number
    (pattern file)
  "PATTERN: haettava regex.
FILE: tiedosto, josta etsitään.

Grep-ohjelman käyttö patterilla ja tiedostolla; löydettyjen rivien rivinumerot
tulostuvat ennen matchia.  Lopputulos tulee listamuodossa."
  (-as-> file $
       (s-concat "grep -n '" pattern "' " $)
       (shell-command-to-string $)
       (split-string $ "\n")))


;;; shell.el ends here
