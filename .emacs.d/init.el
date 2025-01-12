;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" default))
 '(package-selected-packages
   '(zenburn-theme use-package magit catppuccin-theme rust-mode darktooth-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; update local database then install use-package if it's not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
;; tell use-package to install a package if it's not already installed
(setq use-package-always-ensure t)

;; install magit and bing `C-x g` to activate magit
(use-package magit
  :bind (("C-x g" . magit)))

;; for this theme, at least currently, i think you need to go to
;; M-x list-packages and choose to install catppuccin-theme
(load-theme 'catppuccin :no-confirm)
(package-refresh-contents)

;; javascript spacing correction (make tab give 2 spaces)
(setq js-indent-level 2)

;; Slime (Common Lisp)
(unless (package-installed-p 'slime)
  (package-install 'slime)
  (setq inferior-lisp-program "sbcl")
  (add-to-list 'slime-contribs 'slime-repl))

;; Elm-mode
(unless (package-installed-p 'elm-mode)
  (package-install 'elm-mode))

;; Clojure-mode
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))
;; inf-clojure (clojure repl)
(unless (package-installed-p 'inf-clojure)
  (package-refresh-contents)
  (package-install 'inf-clojure))

;; org-mode truncation disabled
;; this will let text wrap in org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; make new line at 80 characters in org-mode
;; (add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
;; (add-hook 'org-mode-hook 'turn-on-auto-fill)

;; running `M-x eval-buffer` in this buffer will evaluate it on the spot

;; experimenting with a capture template for Org-mode
;; things to add:
  ;; Tags
  ;; A map of contents based off tags
  ;; links?
(defun create-zettelkasten-entry ()
  "Create a dated filename for zettelkasten identification purposes."
  (let ((name (read-string "Enter the file name: ")))
    (expand-file-name (format "%s_%s.org"
      (format-time-string "%Y%m%d%H%M%S")
      name)
    "~/zettelkasten/")))

(setq org-capture-templates
  '(("z" "Zettelkasten Entry" entry (file create-zettelkasten-entry)
    "* %?\nEntered on %U\n  %i\n  %a")))

;; set dictionary server to dict.org where the Webster 1913 dicitonary is held, among others...
(setq dictionary-server "dict.org")
