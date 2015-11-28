;;; Package --- Summary
;;; Commentary:
;;; Code:
(require 'js2-refactor)
;; (require 'company)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'subword-mode)
(add-hook 'html-mode-hook 'subword-mode)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")
(setq js2-highlight-level 3)

(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

(setq js-indent-level 2)
(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq js2-basic-offset 2)

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
                    (tern-ac-setup))) 

(defun my-paredit-nonlisp ()
    "Turn on paredit mode for non-lisps."
      (interactive)
        (set (make-local-variable 'paredit-space-for-delimiter-predicates)
                    '((lambda (endp delimiter) nil)))
          (paredit-mode 1))

(add-hook 'js-mode-hook 'my-paredit-nonlisp)
(define-key js-mode-map "{" 'paredit-open-curly)
(define-key js-mode-map "}" 'paredit-close-curly-and-newline)
(provide 'setup-js)
;;; setup-js.el ends here