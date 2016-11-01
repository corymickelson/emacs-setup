;;; Package --- Summary
;;; Commentary:
;;; Code:
(defun dash-p ()
  "Return Dash."
  (let ((lregister "/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"))
    (and (file-executable-p lregister)
         (not (string-equal
               ""
               (shell-command-to-string
                (concat lregister " -dump|grep com.kapeli.dash")))))))
(global-set-key (kbd "C-c D") 'dash-at-point)
(provide 'setup-dash)
;;; setup-dash.el ends here
