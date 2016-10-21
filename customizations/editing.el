;;; Package --- Summary

;;; Commentary:
;;; This file sets up evil, some company setting, ag searching

;;; Code:

(require 'company)

(require 'iedit)

(require 'evil-iedit-state)

(require 'saveplace)

(global-company-mode 1)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(global-hl-line-mode 1)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)

(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(global-set-key (kbd "C-M-s") 'isearch-forward)

(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "M-/") 'hippie-expand)

(setq company-tooltip-align-annotations t)

(setq company-idle-delay 0.2)

(setq company-minimum-prefix-length 1)

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

(setq-default save-place t)

(setq save-place-file (concat user-emacs-directory "places"))

(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(setq electric-indent-mode nil)

(show-paren-mode 1)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun toggle-comment-on-line ()
  "Toggle line comment."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

(defun die-tabs ()
  "Use 2 spaces for tabs."
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

(defun ns-get-pasteboard ()
  "Fix wierd osx kill error."
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

(when (executable-find "ag")
  (require 'ag)
  (require 'wgrep-ag)
  (setq-default ag-highlight-search t)
  (global-set-key (kbd "C-g") 'ag-project)
  (global-set-key (kbd "C-p") 'projectile-ag))

(provide 'editing)
;;; editing.el ends here
