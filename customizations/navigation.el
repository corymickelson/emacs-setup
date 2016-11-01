;;; Package --- Summary

;;; Commentary:

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
;; Directory navigation using ivy

;;; Code:

;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)

(require 'recentf)

;; (require 'neotree)

(require 'smex)

(setq uniquify-buffer-name-style 'forward)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; ido-mode allows you to more easily navigate choices. For example,
;; when you want to switch buffers, ido presents you with a list
;; of buffers in the the mini-buffer. As you start to type a buffer's
;; name, ido will narrow down the list of buffers to match the text
;; you've typed in
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
;; (ido-mode t)
;; (ido-everywhere t)
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-filename-at-point nil)
;; (setq ido-auto-merge-work-directories-length -1)
;; (setq ido-use-virtual-buffers t)
;; (setq-default org-completion-use-ido t)
;; (setq-default magit-completing-read-function 'magit-ido-completing-read)

;; (ido-ubiquitous-mode t)

;; (setq ido-default-buffer-method 'selected-window)

;; (add-hook 'ido-setup-hook (lambda () (define-key ido-completion-map [up] 'previous-history-element)))
(setq-default ivy-use-virtual-buffers t
              ivy-count-format ""
              projectile-completion-system 'ivy
              ivy-initial-inputs-alist
              '((counsel-M-x . "^")
                (man . "^")
                (woman . "^")))
;;(define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
;;(define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
(ivy-mode 1)
(diminish 'ivy-mode)
(defun sanityinc/enable-ivy-flx-matching ()
  "Make `ivy' matching work more like IDO."
  (interactive)
  (require-package 'flx)
  (setq-default ivy-re-builders-alist
                '((t . ivy--regex-fuzzy))))

(add-hook 'after-init-hook
          (lambda ()
            (when (bound-and-true-p ido-ubiquitous-mode)
              (ido-ubiquitous-mode -1)
              (ido-mode -1))
            (ivy-mode 1)))


(setq-default counsel-mode-override-describe-bindings t)
(diminish 'counsel-mode)
(add-hook 'after-init-hook 'counsel-mode)


;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; projectile everywhere!
(projectile-global-mode)

;; NeoTree
(global-set-key [f8] 'neotree-toggle)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "DEL") 'neotree-delete-node)
            (define-key evil-normal-state-local-map (kbd "C-.") 'neotree-hidden-files-toggle)
            (define-key evil-normal-state-local-map (kbd "C-+") 'neotree-create-node)))

;; Save buffers, on next start up open previous buffers
;; (desktop-save-mode 1)

(provide 'navigation)

;;; navigation.el ends here
