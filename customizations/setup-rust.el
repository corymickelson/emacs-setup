;;; Package --- Summary

;;; Commentary:
;;; Company mode does not work right now

;;; Code:
;; (require 'company)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(setq racer-cmd "racer")
(setq racer-rust-src-path "/Users/corymickelson/Resources/rust/src/")
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

;; (add-hook 'racer-mode-hook 'company-racer)
;; (add-to-list 'company-backends 'company-racer)
(provide 'setup-rust)
;;; setup-rust.el ends here
