;;; Package --- Summary

;;; Commentary:

;;; Code:

(when (executable-find "ag")
  (require 'ag)
  (require 'wgrep-ag)
  (setq-default ag-highlight-search t)
  (global-set-key (kbd "C-g") 'ag-project)
  (global-set-key (kbd "C-p") 'projectile-ag))

(global-set-key (kbd "C-s") 'isearch-forward-regexp)

(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(global-set-key (kbd "C-M-s") 'isearch-forward)

(global-set-key (kbd "C-M-r") 'isearch-backward)


(provide 'init-search)
;;; init-search.el ends here
