;; Emacsin Alias-kokoelma
;; Author: Tommi Salenius
;; Created: Ti, 29.5.2018
;; License: GPL (2018)

;; Eri modet

(defalias 'o 'org-mode)
(defalias 'r 'R)
(defalias 'py 'python-mode)
(defalias 'yn 'yas-new-snippet)
(defalias 'kb 'kill-this-buffer)
(defalias 'pack 'package-list-packages)
(defalias 'string-to-symbol 'intern)
(defalias 'symbol-to-string 'symbol-name)

;; Hae tiedostoja

(defalias 'al (lambda() (interactive)(find-file "~/.emacs.d/custom/aliakset.el")))
