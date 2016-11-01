;;; Package --- Summary
;;; Commentary:
;;; Code:


(setq-default magit-diff-refine-hunk t)

(global-set-key [(meta f12)] 'magit-status)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(fullframe magit-status magit-mode-quit-window)
(global-set-key (kbd "C-x v p") #'git-messenger:popup-message)

(add-to-list 'vc-handled-backends 'DARCS)
(autoload 'vc-darcs-find-file-hook "vc-darcs")
(add-hook 'find-file-hooks 'vc-darcs-find-file-hook)
(unless (boundp 'vc-disable-async-diff)
    (setq vc-disable-async-diff nil))
(setq darcsum-whatsnew-switches "-l")

(global-git-gutter-mode +1)
(git-gutter:linum-setup)

(provide 'setup-versioning)
;;; setup-versioning.el ends here
