;;; Package --- Summary

;;; Commentary:

;;; Code:

(require 'company)
(require 'evil)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'intero-mode)
;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)

(add-to-list 'load-path "/Users/corymickelson/.local/bin/ghc-mod")
(add-to-list 'load-path "/Users/corymickelson/.stack/programs/x86_64-osx/ghc-8.0.1")

(let ((hasktags-path (expand-file-name "/Users/corymickelson/.local/bin")))
  (setenv "PATH" (concat hasktags-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path hasktags-path))
(custom-set-variables '(haskell-tags-on-save t))

(let ((my-stack-path (expand-file-name "/Users/corymickelson/.local/bin")))
  (setenv "PATH" (concat my-stack-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-stack-path))

(custom-set-variables '(haskell-process-type 'stack-ghci))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(eval-after-load 'haskell-mode
  '(progn
     (define-key evil-normal-state-local-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key evil-normal-state-local-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key evil-normal-state-local-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
     (define-key evil-normal-state-local-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
     (define-key evil-normal-state-local-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
     (define-key evil-normal-state-local-map (kbd "C-c C-n c") 'haskell-process-cabal)
     (define-key evil-normal-state-local-map (kbd "SPC") 'haskell-mode-contextual-space)))

(eval-after-load 'haskell-cabal-mode
  '(progn
     (define-key evil-normal-state-local-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key evil-normal-state-local-map (kbd "C-c C-k") 'haskell-interactive-mode-collapse)
     (define-key evil-normal-state-local-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key evil-normal-state-local-map (kbd "C-c c") 'haskell-process-cabal)))

(provide 'setup-haskell)
;;; setup-haskell.el ends here
