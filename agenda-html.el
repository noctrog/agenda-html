;; -*- mode: lisp-interaction-mode -*-

(require 'org)

(load-file "./config.el")
(load-file "./emacs-htmlize/htmlize.el")

(org-agenda-list)
(org-agenda-goto-today)
(let ((inhibit-read-only t))
  (when agenda-arrows
    (insert "--> ")
    (move-end-of-line nil)
    (insert " <--"))
  (goto-char (point-min))
  (insert "Generated on "
          (current-time-string) " "
          (cadr (current-time-zone))
          "\n\n"))
(when agenda-html-file
  (org-agenda-write agenda-html-file))
(when agenda-text-file
  (org-agenda-write agenda-text-file))
(kill-buffer-and-window)
