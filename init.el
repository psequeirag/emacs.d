;;
;; Package management setup
;;

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages that must be installed by default.
(defvar my-packages
  '(;; Use/Create ergonomic keybindings in emacs that will reduce RSI
    ergoemacs-mode

    ;; Git integration
    magit

    ;; allow ido usage in as many contexts as possible.
    ido-ubiquitous
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;
;; Package activation & customization.
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x (quote both))
 '(ergoemacs-ini-mode t)
 '(ergoemacs-keyboard-layout "dv")
 '(ergoemacs-mode nil)
 '(ergoemacs-smart-paste nil)
 '(ergoemacs-theme "standard")
 '(ergoemacs-theme-options nil)
 '(ergoemacs-use-menus t)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(ido-ubiquitous-mode t)
 '(ido-use-virtual-buffers (quote auto))
 '(initial-scratch-message
   ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

")
 '(scroll-error-top-bottom nil)
 '(set-mark-command-repeat-pop nil)
 '(shift-select-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
