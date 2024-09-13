(setq org-capture-templates
  '(("z" "Zettelkasten Entry" entry (file create-zettelkasten-entry)
    "* %?\nEntered on %U\n  %i\n  %a")))

(defun create-zettelkasten-entry ()
  "Create a dated filename for zettelkasten identification purposes."
  (let ((name (read-string "Enter the file name: ")))
    (expand-file-name (format "%s_%s.org"
      (format-time-string "%Y%m%d%H%M%S")
      name)
    "~/Development/notes/")))

(defun get-undated-filenames (directory)
  "Return a list of filenames in the given Directory."
    (directory-files directory nil "^[^0-9].*\.org$" t))

;; create-new-name -> get current datetime if current_datetime exists, decrement and check again else append datetime to the old name with an underscore
;; get datetimes at beginning of each file that has one
;; (directory-files "~/Development/notes/" nil "^[0-9]\\{14\\}_.*\\.org" t)
(defun get-14-digit-prefixes-as-numbers (directory)
  "Get a list of 14-digit prefixes as numbers from filenames in DIRECTORY."
  (let* ((files (directory-files directory nil "^[0-9]\\{14\\}_.*\\.org" t))
         (digits-list '()))
    (dolist (file files digits-list)
      (when (string-match "^\\([0-9]\\{14\\}\\)" file)
        (push (string-to-number (match-string 1 file)) digits-list)))))

(defun rename-file-safe (old-name new-name)
  "Rename file old-name to new-name safely."
  (condition-case err
      (progn
	(when (file-exists-p new-name)
	  (error "File '%s' already exists" new-name))
      (rename-file old-name new-name)
      (message "File renamed from '%s' to '%s'" old-name new-name))
    (error (message "Error renaming file: %s" (error-message-string err)))))
