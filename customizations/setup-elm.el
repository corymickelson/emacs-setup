;;; Package --- Summary

;;; Commentary:

;;; Code:
(require 'elm-mode)
(require 'flycheck)
;;(require 'company)
(add-hook 'flycheck-mode-hook 'flycheck-elm-setup)
(add-hook 'elm-mode-hook #'elm-oracle-setup-completion)
;; (add-to-list 'company-backends 'company-elm)

;; (add-hook 'elm-mode-hook
;;           (lambda ()
;;             (setq company-backends '(company-elm))))

;;; setup-elm.el ends here
