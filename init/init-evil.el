;;; Package --- Summary
;;; Commentary:
;;; Code:
(require 'evil)
(require 'evil-iedit-state)
(require 'multiple-cursors)
(require 'powerline)

;;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; Multiple cursors
;; (define-key evil-normal-state-map "C-<" 'mc/mark-previous-like-this)
;; (define-key evil-normal-state-map "C->" 'mc/mark-next-like-this)
;; (define-key evil-normal-state-map "C-+" 'mc/mark-next-like-this)
;; (define-key evil-normal-state-map "C-c C-<" 'mc/mark-all-like-this)

(powerline-default-theme)
(provide 'setup-evil)
;;; init-evil.el ends here
