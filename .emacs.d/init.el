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
 '(package-selected-packages '(catppuccin-theme rust-mode darktooth-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; for this theme, at least currently, i think you need to go to
;; M-x list-packages and choose to install catppuccin-theme
(load-theme 'catppuccin :no-confirm)
(package-refresh-contents)

;; This is to make all those autosave files go to one folder
;;(setq backup-directory-alist
;;      `((".*" . ,(expand-file-name
;;             (concat user-emacs-directory "backups"))))
;;(setq auto-save-file-name-transforms
;;      `((".*" ,(expand-file-name
;;             (concat user-emacs-directory "backups") t)))


;; running `M-x eval-buffer` in this buffer will evaluate it on the spot
