;;; Package --- Summary

;;; Commentary:

;;; Code:

(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

(provide 'init-shell)
;;; init-shell.el ends here

