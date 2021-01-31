;;; publish.el --- Generate Weblorg page
;;; Commentary:
;;
;; Generate static website for weblorg
;;
;;; Code:
;;

;; Setup package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package htmlize) ;; syntax highlight
(use-package weblorg)

;; Defaults to localhost:8000
(if (string= (getenv "ENV") "prod")
    (setq weblorg-default-url "https://emacs.love"))

;; Generate index
(weblorg-route
 :name "index"
 :input-pattern "index.org"
 :template "index.html"
 :output "index.html"
 :url "/")

(weblorg-route
 :name "static"
 :url "/static/{{ file }}")

(weblorg-export)
;;; publish.el ends here
