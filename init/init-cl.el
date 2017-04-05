;;; Package --- Summary
;;; Commentary:
;;; Code:
(require 'slime)

(setq inferior-lisp-program "/usr/bin/sbcl")
(add-auto-mode 'lisp-mode "'\\.cl\\'")

(provide 'init-cl)
;;; init-cl ends here
