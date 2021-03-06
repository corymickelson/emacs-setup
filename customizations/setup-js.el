;;; Package --- Summary
;;; Commentary:
;;; To enable autocompletion and type hinting you need to enable auto-complete-mode and then run tern-ac-setup

;;; Code:
(require 'js2-refactor)
(require 'nodejs-repl)
(require 'js-doc)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'load-path "~/.nvm/versions/node/v6.9.1/lib/node_modules/tern/emacs/")
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(autoload 'tern-mode "tern.el" nil t)

(add-hook 'js-mode-hook 'my-paredit-nonlisp)
(add-hook 'js2-mode-hook 'subword-mode)
(add-hook 'html-mode-hook 'subword-mode)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(add-hook 'js2-mode 'auto-complete-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")
(setq js2-strict-missing-semi-warning nil)
(setq js2-highlight-level 3)

(defun delete-tern-process ()
  "Delete running tern server."
  (interactive)
  (delete-process "Tern"))

(setq js2-indent-level 2)
(setq js2-basic-offset 2)

(setq js-doc-email-address "mickelsoncory@gmail.com"
      js-doc-author "Cory Mickelson"
      js-doc-url "https://github.com/corymickelson"
      js-doc-license "MIT")
(js2-imenu-extras-setup)
(add-hook 'js2-mode-hook #'(lambda ()
                             (define-key js2-mode-map "C-c i" 'js-doc-insert-function-doc)
                             (define-key js2-mode-map "@" 'js-doc-insert-tag)))
(add-hook 'js2-mode-hook '(lambda ()
                            (local-set-key (kbd "RET") 'newline-and-indent)))
(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'js2-mode-hook (lambda () (tagedit-mode 1)))
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))

(eval-after-load 'tern
                 '(progn
                    (require 'tern-auto-complete)
                    (auto-complete-mode 1)
                    (tern-ac-setup)))

(define-key js-mode-map "{" 'paredit-open-curly)
(define-key js-mode-map "}" 'paredit-close-curly-and-newline)
(provide 'setup-js)
;;; setup-js.el ends here
