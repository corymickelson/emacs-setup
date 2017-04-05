;;; Package --- Summary
;;; Commentary:
;;; This setup is for haskell, elm, clojure and javascript
;;; Haskell is setup with intero to use ghc-mod uncomment uncommented out packages
;;; Code:


(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))


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
              '("melpa-stable" . "http://stable.melpa.org/packages/"))

(add-to-list 'package-pinned-packages '(clj-refactor . "melpa-stable") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    company
    company-quickhelp
    company-ghc
    flycheck
    flycheck-clojure
    evil
    evil-escape
    evil-iedit-state
    neotree
    projectile
    ido-ubiquitous
    undo-tree
    yasnippet
    rainbow-delimiters
    browse-kill-ring
    expand-region
    multiple-cursors
    origami
    flx
    swiper
    iedit
    indent-guide
    highlight-symbol
    highlight-escape-sequences
    paredit
    tagedit
    epl
    typed-clojure-mode
    cider
    clojure-mode
    clj-refactor
    clojure-mode-extra-font-locking
    powerline
    counsel
    exec-path-from-shell
    ag
    wgrep-ag
    fullframe
    diminish
    git-messenger
    gitignore-mode
    gitconfig-mode
    git-timemachine
    git-commit
    diff-hl
    magit
    magit-popup
    slime
    slime-company
    hippie-expand-slime
    ielm
    elisp-slime-nav
    lively
    ipretty
    hl-sexp
    immortal-scratch
    redshank
    aggressive-indent
    cl-lib-highlight
    macrostep
    highlight-quoted
    eldoc-eval
    ert
    auto-compile))

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
(add-to-list 'load-path "~/.emacs.d/init")
(add-to-list 'load-path "~/.emacs.d/neotree")

;; Load sequence matters!!!
;; loading external modules
(load "neotree.el")
;;(load "web-formatter.el")
;;(load "web-beautify.el")

;; loading editor settings
(load "init-utility-fns.el")
(load "init-shell.el")
(load "init-defaults.el")
(load "init-fs.el")
(load "init-buffers.el")
(load "init-paredit.el")
(load "init-doc.el")
(load "init-search.el")
(load "init-evil.el")
(load "init-editing-assist.el")
(load "ui.el")
(load "init-vcs.el")
(load "init-completions.el")

;; loading lisp
(load "init-lisp-assist.el")
(load "init-elisp.el")
(load "init-slime.el")
(load "init-cl.el")

;; loading clojure
(load "init-clj.el")

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
 '(clojure-align-forms-automatically t)
 '(company-ghc-show-info t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-day)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" default)))
 '(fci-rule-color "#282a2e")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
    (ibuffer-vc slime-company geiser wgrep-ag tagedit smex simple-httpd rainbow-delimiters projectile magit ido-ubiquitous flycheck-pos-tip flycheck-clojure exec-path-from-shell evil-iedit-state cm-mode clojure-mode-extra-font-locking clj-refactor ample-regexps ag)))
 '(safe-local-variable-values
   (quote
    ((no-byte-compile t)
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init)
;;; init.el ends here

