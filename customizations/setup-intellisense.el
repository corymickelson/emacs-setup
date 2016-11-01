;;; Package --- Summary
;;; Commentary:
;;; Code:
(require 'company)
(require 'auto-complete)
(require 'flycheck)

(add-to-list 'ac-modes 'js-mode)
(ac-config-default)

(add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(add-to-list 'company-backends 'company-elm)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(provide 'setup-intellisense)
;;; setup-autocompletions.el ends here
