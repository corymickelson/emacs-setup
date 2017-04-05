;;; Package --- Summary
;;; Commentary:
;;; Code:
(require 'eldoc-eval)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(provide 'init-doc)
;;; init-doc.el ends here
