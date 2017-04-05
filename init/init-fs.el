;;; Package --- Summary

;;; Commentary:

;;; Code:

(require 'uniquify)
(require 'recentf)
(require 'smex)
(provide 'init-fs)
(provide 'ivy)
(provide 'ivy-minibuffer)

(setq uniquify-buffer-name-style 'forward)
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(recentf-mode 1)
(setq recentf-max-menu-items 40)
(setq-default ivy-use-virtual-buffers t
              ivy-count-format ""
              projectile-completion-system 'ivy
              ivy-initial-inputs-alist
              '((counsel-M-x . "^")
                (man . "^")
                (woman . "^")))
(ivy-mode 1)
(define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
(define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
(diminish 'ivy-mode)
(defun sanityinc/enable-ivy-flx-matching ()
  "Make `ivy' matching work more like IDO."
  (interactive)
  (setq-default ivy-re-builders-alist
                '((t . ivy--regex-fuzzy))))

(add-hook 'after-init-hook
          (lambda ()
            (when (bound-and-true-p ido-ubiquitous-mode)
              (ido-ubiquitous-mode -1)
              (ido-mode -1))
            (ivy-mode 1)))


(setq-default counsel-mode-override-describe-bindings t)
(add-hook 'after-init-hook 'counsel-mode)
(diminish 'counsel-mode)


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


;;; init-fs.el ends here

