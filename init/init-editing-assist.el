;;; Package --- Summary

;;; Commentary:

;;; Code:


(require 'browse-kill-ring)
(require 'indent-guide)
(require 'undo-tree)
(require 'origami)
(require 'highlight-escape-sequences)
(require 'iedit)


(hes-mode)
(add-hook 'prog-mode-hook 'indent-guide-mode)
(diminish 'indent-guide-mode)

(global-undo-tree-mode)
(diminish 'undo-tree-mode)

(dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
  (add-hook hook 'highlight-symbol-mode)
  (add-hook hook 'highlight-symbol-nav-mode))

(add-hook 'org-mode-hook 'highlight-symbol-nav-mode)
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")
(global-set-key (kbd "M-Z") 'zap-up-to-char)

(setq browse-kill-ring-separator "\f")
(global-set-key (kbd "M-Y") 'browse-kill-ring)
(define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
  (define-key browse-kill-ring-mode-map (kbd "M-n") 'browse-kill-ring-forward)
  (define-key browse-kill-ring-mode-map (kbd "M-p") 'browse-kill-ring-previous)

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)
(show-paren-mode 1)

(add-hook 'prog-mode-hook 'origami-mode)
(diminish 'origami-mode)
(define-key origami-mode-map (kbd "C-c f") 'origami-recursively-toggle-node)
    (define-key origami-mode-map (kbd "C-c F") 'origami-toggle-all-nodes)

(global-hl-line-mode 1)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(provide 'init-editing-assist.el)

;;; init-editing-assist.el ends here
