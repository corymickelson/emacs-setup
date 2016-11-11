;;; Package --- Summary
;;; Commentary:
;; Autocomplete-mode is only used for javascript, uncomment as company and auto complete conflict
;;; Code:
(require 'company)
(require 'auto-complete)
(require 'flycheck)

;; Autocomplete Mode
;;(add-to-list 'ac-modes 'js-mode)
;;(ac-config-default)

;; Flycheck Mode
(add-hook 'after-init-hook 'global-flycheck-mode)
(setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
(diminish 'flycheck-mode)

;; Company Mode
(add-to-list 'company-backends 'company-elm)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(global-company-mode 1)
(diminish 'company-mode "CMP")

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(provide 'setup-intellisense)
;;; setup-intellisense.el ends here
