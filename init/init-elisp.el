;;; Package --- Summary
;;; Commentary:
;;; Code:
(require 'slime)
(require 'ielm)
(require 'elisp-slime-nav)
(require 'lively)
(require 'ipretty)
(require 'hl-sexp)
(require 'immortal-scratch)
(require 'redshank)
(require 'aggressive-indent)
(require 'cl-lib-highlight)
(require 'macrostep)
(require 'highlight-quoted)
(require 'eldoc-eval)
(require 'ert)
(require 'auto-compile)

(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq mode-name "ELisp")))

(define-key lisp-mode-map (kbd "C-c l") 'lispdoc)

(global-set-key [remap eval-expression] 'pp-eval-expression)
(define-key emacs-lisp-mode-map (kbd "C-x C-e") 'sanityinc/eval-last-sexp-or-region)
(ipretty-mode 1)

(add-hook 'emacs-lisp-mode-hook 'sanityinc/maybe-set-bundled-elisp-readonly)

(make-variable-buffer-local 'sanityinc/repl-original-buffer)

(define-key emacs-lisp-mode-map (kbd "C-c C-z") 'sanityinc/switch-to-ielm)
(define-key ielm-map (kbd "C-c C-z") 'sanityinc/repl-switch-back)
;; ----------------------------------------------------------------------------
;; Automatic byte compilation
;; ----------------------------------------------------------------------------
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

;; ----------------------------------------------------------------------------
;; Load .el if newer than corresponding .elc
;; ----------------------------------------------------------------------------
(setq load-prefer-newer t)

(add-hook 'after-init-hook 'immortal-scratch-mode)

 (diminish 'redshank-mode)
(if (boundp 'eval-expression-minibuffer-setup-hook)
    (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
  (require 'eldoc-eval)
  (eldoc-in-minibuffer-mode 1))

(add-to-list 'auto-mode-alist '("\\.emacs-project\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("archive-contents\\'" . emacs-lisp-mode))

(cl-lib-highlight-initialize)
;; ----------------------------------------------------------------------------
;; Delete .elc files when reverting the .el from VC or magit
;; ----------------------------------------------------------------------------

;; When .el files are open, we can intercept when they are modified
;; by VC or magit in order to remove .elc files that are likely to
;; be out of sync.

;; This is handy while actively working on elisp files, though
;; obviously it doesn't ensure that unopened files will also have
;; their .elc counterparts removed - VC hooks would be necessary for
;; that.
(define-key emacs-lisp-mode-map (kbd "C-c e") 'macrostep-expand)

(global-set-key (kbd "C-h K") 'find-function-on-key)

(defvar sanityinc/theme-mode-hook nil
  "Hook triggered when editing a theme file.")

(add-hook 'emacs-lisp-mode-hook 'sanityinc/run-theme-mode-hooks-if-theme t)
(add-hook 'sanityinc/theme-mode-hook 'rainbow-mode)
(add-to-list 'sanityinc/theme-mode-hook (lambda () (aggressive-indent-mode -1)) t)

;;(flycheck-package-setup)
(define-key ert-results-mode-map (kbd "g") 'ert-results-rerun-all-tests)
(provide 'init-elisp)
;;; init-elisp ends here
