;;; Package --- Summary

;;; Commentary:

;;; Code:
(require 'magit)
(require 'iedit)

(setq-default magit-diff-refine-hunk t)

(global-set-key [(meta f12)] 'magit-status)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(fullframe magit-status magit-mode-quit-window)
(global-set-key (kbd "C-x v p") #'git-messenger:popup-message)

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(add-hook 'prog-mode-hook 'diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'diff-hl-mode)

(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(provide 'init-vcs)
;;; init-vcs.el ends here
