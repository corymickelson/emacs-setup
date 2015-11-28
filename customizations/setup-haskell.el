;;; Package --- Summary

;;; Commentary:

;;; Code:
(require 'company)
(require 'evil)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)

;HaskTags

(let ((hasktags-path (expand-file-name "/Users/corymickelson/Library/Haskell/bin")))
  (setenv "PATH" (concat hasktags-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path hasktags-path))
(custom-set-variables '(haskell-tags-on-save t))

; Uncomment if not using stack for haskell projects
;(custom-set-variables '(haskell-process-type 'cabal-repl))
(custom-set-variables '(haskell-process-type 'stack-ghci))

(add-to-list 'load-path "/Users/corymickelson/Library/Haskell/share/ghc-7.10.2-x86_64")

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
