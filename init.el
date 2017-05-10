;;
;; General Customization.
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-repl-history-file "~/.emacs.d/cider-history")
 '(cider-repl-wrap-history t)
 '(electric-indent-mode nil)
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x (quote both))
 '(ergoemacs-ini-mode t)
 '(ergoemacs-keyboard-layout "dv")
 '(ergoemacs-mode nil)
 '(ergoemacs-smart-paste nil)
 '(ergoemacs-theme "standard")
 '(ergoemacs-theme-options nil)
 '(ergoemacs-use-menus t)
 '(global-hl-line-mode t)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(ido-ubiquitous-mode t)
 '(ido-use-virtual-buffers (quote auto))
 '(indent-tabs-mode nil)
 '(initial-scratch-message
   ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

")
 '(org-replace-disputed-keys nil)
 '(org-special-ctrl-a/e nil)
 '(org-support-shift-select nil)
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/"))))
 '(projectile-global-mode t)
 '(recentf-menu-before "Open File...")
 '(recentf-mode t)
 '(scroll-error-top-bottom nil)
 '(set-mark-command-repeat-pop nil)
 '(shift-select-mode t)
 '(show-paren-mode t)
 '(smex-prompt-string "M-x ")
 '(use-package-always-ensure t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)

;;
;; Package management setup
;;

(require 'package)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

;;
;; Package Selection & Configuration
;;

;; Use/Create ergonomic keybindings in emacs that will reduce RSI
(use-package ergoemacs-mode)

;; allow ido usage in as many contexts as possible.
(use-package ido-ubiquitous)
(use-package smex)

;; Git integration
(use-package magit)

;; Project navigation
(use-package projectile)

;; General Lisp programming support
(use-package rainbow-delimiters)
(use-package paredit)
(use-package company)
(use-package parinfer)

;; Clojure programming support
(use-package clojure-mode)
(use-package cider)


;;;;
;; EmacsLisp, Clojure and Cider mode hooks
;;;;

;; ;; Enable paredit for Clojure
;; (add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; ;; This is useful for working with camel-case tokens, like names of
;; ;; Java classes (e.g. JavaClassName)
;; (add-hook 'clojure-mode-hook 'subword-mode)

;; ;; syntax hilighting for midje
;; (add-hook 'clojure-mode-hook
;;           (lambda ()
;;             (setq inferior-lisp-program "lein repl")
;;             (font-lock-add-keywords
;;              nil
;;              '(("(\\(facts?\\)"
;;                 (1 font-lock-keyword-face))
;;                ("(\\(background?\\)"
;;                 (1 font-lock-keyword-face))))
;;             (define-clojure-indent (fact 1))
;;             (define-clojure-indent (facts 1))))

;; ;; provides minibuffer documentation for the code you're typing into the repl
;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; ;; enable paredit in your REPL
;; (add-hook 'cider-repl-mode-hook 'paredit-mode)

;; ;; Automatically load paredit when editing a lisp file
;; ;; More at http://www.emacswiki.org/emacs/ParEdit
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; ;; eldoc-mode shows documentation in the minibuffer when writing code
;; ;; http://www.emacswiki.org/emacs/ElDoc
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

