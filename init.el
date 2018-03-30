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

(setq tab-width 2) ; or any other preferred value
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
;; keep this last
(load custom-file)

(server-start)

