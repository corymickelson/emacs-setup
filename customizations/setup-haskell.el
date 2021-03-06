;;; Package --- Summary

;;; Commentary:
;;; This is setup to use the intero module
;;; To use haskell mode with ghc-mod comment out intero and uncomment the rest of the file

;;; Code:

(require 'company)
(require 'haskell-mode)
(require 'evil)
(require 'tagedit)
(require 'intero)

(add-hook 'haskell-mode-hook 'intero-mode)
(add-to-list 'load-path "~/.local/bin/ghc-mod")
(add-to-list 'load-path "~/.stack/programs/x86_64-linux/ghc-8.0.1")

(let ((hasktags-path (expand-file-name "~/.local/bin")))
  (setenv "PATH" (concat hasktags-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path hasktags-path))
(custom-set-variables '(haskell-tags-on-save t))

(let ((my-stack-path (expand-file-name "~/.local/bin")))
  (setenv "PATH" (concat my-stack-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-stack-path))


(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-font-lock-symbols t)

(custom-set-variables '(haskell-process-type 'stack-ghci))
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(custom-set-variables
 '(haskell-process-suggest-remove-import t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))
(with-eval-after-load 'haskell-mode
 '(progn
    (define-key evil-normal-state-local-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
    (define-key evil-normal-state-local-map (kbd "C-c C-z") 'haskell-interactive-switch)
    (define-key evil-normal-state-local-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
    (define-key evil-normal-state-local-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
    (define-key evil-normal-state-local-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
    (define-key evil-normal-state-local-map (kbd "C-c C-n c") 'haskell-process-cabal)
    (define-key evil-normal-state-local-map (kbd "SPC") 'haskell-mode-contextual-space)))

(with-eval-after-load 'haskell-cabal-mode
 '(progn
    (define-key evil-normal-state-local-map (kbd "C-c C-z") 'haskell-interactive-switch)
    (define-key evil-normal-state-local-map (kbd "C-c C-k") 'haskell-interactive-mode-collapse)
    (define-key evil-normal-state-local-map (kbd "C-c C-c") 'haskell-process-cabal-build)
    (define-key evil-normal-state-local-map (kbd "C-c c") 'haskell-process-cabal)))

 (provide 'setup-haskell)
;;; setup-haskell.el ends here
