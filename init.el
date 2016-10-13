;;; Package --- Summary
;;; Commentary:
;;; Code:

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
              '("melpa-stable" . "http://stable.melpa.org/packages/"))

(add-to-list 'package-pinned-packages '(clj-refactor . "melpa-stable") t)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ;; ("melpa" . "http://melpa-stable.milkbox.net/packages/")))

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(ag
    ample-regexps
    async auto-complete
    cider
    clojure-mode
    clj-refactor
    clojure-mode-extra-font-locking
    cm-mode
    company
    company-ghc
    company-racer
    epl
    evil
    evil-iedit-state
    exec-path-from-shell
    flycheck
    flycheck-clojure
    flycheck-haskell
    flycheck-pos-tip
    flycheck-rust
    git-commit
    ghc
    goto-chg
    haskell-mode
    ido-ubiquitous
    iedit
    inflections
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
    ujelly-theme
    undo-tree
    wgrep-ag
    with-editor
    yasnippet))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
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

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")


;; neotree
(add-to-list 'load-path "~/.emacs.d/neotree")

;; web beautifier
;;(add-to-list 'load-path "~/.emacs.d/web-beautify")
;;(load "web-formatter.el")


;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "other.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-rust.el")
(load "setup-clojure.el")
(load "setup-haskell.el")


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
 '(custom-safe-themes
   (quote
    ("9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" default)))
 '(fci-rule-color "#282a2e")
 '(package-selected-packages
   (quote
    (flycheck-haskell wgrep-ag ujelly-theme tagedit smex simple-httpd rainbow-delimiters racer projectile magit ido-ubiquitous flycheck-rust flycheck-pos-tip flycheck-clojure exec-path-from-shell evil-iedit-state company-racer company-ghc cm-mode clojure-mode-extra-font-locking clj-refactor auto-complete ample-regexps ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init)
;;; init.el ends here

