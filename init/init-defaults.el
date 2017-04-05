;;; Package --- Summary

;;; Commentary:

;;; Code:
(require 'saveplace)

(setq-default
 blink-cursor-interval 0.4
 Buffer-menu-size-width 30
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(global-auto-revert-mode)

(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(global-prettify-symbols-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(setq create-lockfiles nil)

(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)

(setq-default save-place t)

(setq save-place-file (concat user-emacs-directory "places"))

(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(provide 'init-defaults)
;;; init-defaults.el ends here
