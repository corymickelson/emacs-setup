;;; Package --- Summary

;;; Commentary:

;;; Code:

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; Magit pop up window
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)


;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
(provide 'other)
;;; other.el ends here
