;; GET EVIL
;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
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
;; frame transparency
(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))

;; javascript spacing correction (make tab give 2 spaces)
(setq js-indent-level 2)

;; Common Lisp - slime editor
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; Clojure-mode
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))
;; inf-clojure (clojure repl)
(unless (package-installed-p 'inf-clojure)
  (package-refresh-contents)
  (package-install 'inf-clojure))

;; org roam
;; may require the latest org mode version which can be had by running:
;; M-x package-install RET org-roam RET
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; org-mode truncation disabled
;; this will let text wrap in org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; make new line at 80 characters in org-mode
;; (add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
;; (add-hook 'org-mode-hook 'turn-on-auto-fill)


;; This is to make all those autosave files go to one folder
;;(setq backup-directory-alist
;;      `((".*" . ,(expand-file-name
;;             (concat user-emacs-directory "backups"))))
;;(setq auto-save-file-name-transforms
;;      `((".*" ,(expand-file-name
;;             (concat user-emacs-directory "backups") t)))


;; running `M-x eval-buffer` in this buffer will evaluate it on the spot

;; EXTRA POTENTIAL PACKAGES TO LOOK INTO:
;; paredit
;; flyspell-correct
;; writeroom-mode
;; which-key
;; org-bullets
;; parinfer-rust-mode <- for lisp programming, apparently
;; org-rifle
;; auctex	
;; orderless
