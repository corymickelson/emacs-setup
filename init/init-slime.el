;;; Package --- Summary
;;; Commentary:
;;; Code:

(require 'slime)
(require 'slime-company)
(require 'hippie-expand-slime)

(add-hook 'lisp-mode-hook (lambda ()
                            (unless (featurep 'slime)
                              (require 'slime)
                              (normal-mode))))
(after-load 'slime
  (when (executable-find "sbcl")
    (add-to-list 'slime-lisp-implementations
                 '(sbcl ("sbcl") :coding-system utf-8-unix)))
  (when (executable-find "lisp")
    (add-to-list 'slime-lisp-implementations
                 '(cmucl ("lisp") :coding-system iso-latin-1-unix)))
  (when (executable-find "ccl")
    (add-to-list 'slime-lisp-implementations
                 '(ccl ("ccl") :coding-system utf-8-unix))))

(slime-setup '(slime-fancy slime-company))
(setq slime-contribs '(slime-fancy))
(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "M-.") 'company-show-location)

(provide 'init-slime)
;;; init-slime.el ends here
