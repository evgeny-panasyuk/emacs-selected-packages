(require 'package)

;; (setq package-check-signature nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa_deleted" . "./melpa_deleted") t)

(setq package-archive-priorities
      '(("gnu" . 10)
        ("melpa" . 20)
        ("melpa_deleted" . 30)
        ))



(setq
 prelude-packages
 '(
   ac-js2
   ace-jump-mode
   ace-window
   ack
   async
   auto-complete
   avy
   bind-key
   buffer-move
   clojure-mode
   cmake-ide
   cmake-mode
   color-identifiers-mode
   color-theme
   color-theme-modern
   color-theme-sanityinc-tomorrow
   command-log-mode
   company
   company-c-headers
   company-lsp
   counsel
   counsel-gtags
   counsel-projectile
   cquery
   csv-mode
   dash
   dash-functional
   deferred
   diff-hl
   diminish
   dired+
   dired-sort-menu
   ebib
   eglot
   ein
   elpa-mirror
   elpy
   epl
   ess
   evil
   evil-escape
   evil-ledger
   evil-numbers
   expand-region
   f
   figlet
   find-file-in-project
   flx
   flx-ido
   flycheck
   flycheck-ledger
   geben
   ggtags
   git-commit
   git-gutter
   gnuplot
   gnuplot-mode
   goto-chg
   graphviz-dot-mode
   haskell-mode
   helm
   helm-company
   helm-core
   helm-descbinds
   helm-git-grep
   helm-gtags
   helm-projectile
   helm-swoop
   highlight-indentation
   htmlize
   hy-mode
   hydra
   icicles
   ido-complete-space-or-hyphen
   ido-sort-mtime
   ido-ubiquitous
   ido-vertical-mode
   iedit
   image+
   irony
   ivy
   ivy-dired-history
   ivy-rtags
   jinja2-mode
   js2-mode
   latex-pretty-symbols
   ledger-mode
   levenshtein
   linum-relative
   lispy
   lsp-clangd
   lua-mode
   magit
   magit-popup
   markdown-mode
   mmm-mode
   modern-cpp-font-lock
   move-text
   multiple-cursors
   narrow-indirect
   ob-hy
   ob-ipython
   org
   outorg
   outshine
   ox-reveal
   pandoc-mode
   paredit
   parinfer
   persp-projectile
   perspective
   phi-search
   php-mode
   pkg-info
   popup
   projectile
   projectile-speedbar
   puppet-mode
   pyvenv
   rainbow-mode
   region-bindings-mode
   request
   rtags
   s
   shm
   smex
   sr-speedbar
   swiper
   tabbar
   tablist
   undo-tree
   use-package
   vi-tilde-fringe
   visual-regexp
   w3m
   web-mode
   websocket
   wgrep
   wgrep-helm
   with-editor
   wolfram-mode
   writeroom-mode
   yaml-mode
   yasnippet
   ))


(defun prelude-packages-installed-p ()
  (require 'cl)
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(when t
  (progn
    (package-initialize)
    ;; see (info "(emacs)Package Installation")
    (setq package-enable-at-startup nil)

    (progn ;; with-demoted-errors
        (unless (prelude-packages-installed-p)
          ;; check for new packages (package versions)
          (package-refresh-contents)
          ;; install the missing packages
          (dolist (p prelude-packages)
            (print p)
            (when (not (package-installed-p p))
              (package-install p))
            )))
    ))


(elpamr-create-mirror-for-installed "./packages" 't)
