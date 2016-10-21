;;; Package --- Summary
;;; Commentary:
;;; Haskell is setup with intero to use ghc-mod uncomment uncommented out packages
;;; Code:

;; Define package repositories
(require 'package)
(add-to-list
  'package-archives
  '("melpa-default" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
              '("melpa-stable" . "http://stable.melpa.org/packages/"))

(add-to-list 'package-pinned-packages '(clj-refactor . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(intero . "melpa-default") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(ag
    ample-regexps
    async
    ;; auto-complete
    cider
    clojure-mode
    clj-refactor
    clojure-mode-extra-font-locking
    cm-mode
    company
    ;; company-ghc
    company-racer
    epl
    elm-mode
    evil
    evil-iedit-state
    exec-path-from-shell
    f
    flycheck
    flycheck-clojure
    ;; flycheck-haskell
    flycheck-pos-tip
    flycheck-rust
    git-commit
    ;; ghc
    goto-chg
    haskell-mode
    ido-ubiquitous
    iedit
    inflections
    intero
    js2-mode
    js2-refactor
    js-doc
    let-alist
    magit
    magit-popup
    multiple-cursors
    paredit
    peg
    pkg-info
    popup
    projectile
    queue
    racer
    rainbow-delimiters
    rust-mode
    s
    simple-httpd
    smex
    spinner
    tagedit
    tern-auto-complete
    typed-clojure-mode
    ujelly-theme
    undo-tree
    wgrep-ag
    with-editor
    yasnippet))

(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/neotree")
;;(add-to-list 'load-path "~/.emacs.d/web-beautify")
;;(load "web-formatter.el")
(load "neotree.el")
(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "other.el")
(load "elisp-editing.el")
(load "setup-elm.el")
(load "setup-clojure.el")
(load "setup-haskell.el")
(load "setup-js.el")
(load "setup-rust.el")

(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#1d1f21"))
 '(cider-cljs-repl
   "(cemerick.piggieback/cljs-repl (cljs.repl.rhino/repl-env))")
 '(company-ghc-show-info t)
 '(custom-safe-themes
   (quote
    ("9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" default)))
 '(fci-rule-color "#282a2e")
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
    (flycheck-haskell wgrep-ag ujelly-theme tagedit smex simple-httpd rainbow-delimiters racer projectile magit ido-ubiquitous flycheck-rust flycheck-pos-tip flycheck-clojure exec-path-from-shell evil-iedit-state company-racer company-ghc cm-mode clojure-mode-extra-font-locking clj-refactor auto-complete ample-regexps ag)))
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init)
;;; init.el ends here

