(require 'package)

(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)

(package-initialize)

(when (eq system-type 'darwin)
  ;; default Latin font
  (set-face-attribute 'default nil :family "SF Mono")
  (set-face-attribute 'default nil :height 160)
  )

(setq custom-file "~/.emacs.d/custom.el")

;; based on https://stackoverflow.com/questions/25791605/emacs-how-do-i-create-a-new-empty-buffer-whenever-creating-a-new-frame

(defun scotty-new-empty-frame ()
  "Create a new frame with a new empty buffer."
  (interactive)
  (let ((buffer (generate-new-buffer "untitled")))
    (set-buffer-major-mode buffer)
    (display-buffer buffer '(display-buffer-pop-up-frame . nil))))

(global-set-key (kbd "s-n") #'scotty-new-empty-frame)
(global-set-key (kbd "s-r") #'replace-string)

;;(setq tab-width 2) ; or any other preferred value
(setq-default tab-width 2)
(setq-default c-basic-offset 'tab-width)
(setq-default c-basic-indent 'tab-width)
(add-hook 'php-mode-hook #'(lambda() (setq c-basic-offset 2)))
(defvaralias 'cperl-indent-level 'tab-width)
;; keep this last
(load custom-file)

;; save backup files under ~/.saves, with versioning
;; https://www.emacswiki.org/emacs/BackupDirectory
(setq
   backup-by-copying t      ; don't clobber symlinks
   version-control t        ; use versioned backups
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   backup-directory-alist
    `(("." . "~/.saves/"))    ; don't litter my fs tree
   )

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

;;; now using emacsclient -a '' -c aliased to emacs to start daemon
;;; automatically
;;;(server-start)

