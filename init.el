;; User info
(setq user-full-name "Robert Grimm"
      user-mail-address (rot13 "tevzz.ebo@tznvy.pbz"))

;; Early removal of GUI scrollbars and toolbar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Fix Aquamacs behavior
(defvar rmg:user-emacs-dir
  (file-name-directory user-init-file)
  "Real `user-emacs-directory' based on init-file location.")

;; Move customizations to separate file
(setq custom-file (concat rmg:user-emacs-dir "custom.el"))
(load custom-file 'noerror)

(defgroup rmg nil
  "Customizations specific to my setup."
  :prefix "rmg-")

;; Load custom lisp
(add-to-list 'load-path (concat rmg:user-emacs-dir "user-lisp/"))

;; Determine running environment and set up package loading
(require 'rmg-environment)
(require 'rmg-packages)

;; Before anything else, disable Aquamacs stuff
(when running-aquamacs
  (rmg-try-require 'rmg-aquamacs))

;; Run the rest of custom initialization
(rmg-try-require 'rmg-files)
(rmg-try-require 'rmg-startup)
(rmg-try-require 'rmg-panels)
(rmg-try-require 'rmg-generic-behavior)
(rmg-try-require 'rmg-misc-functions)
(rmg-try-require 'rmg-display-global)
(rmg-try-require 'rmg-display-console)
(rmg-try-require 'rmg-display-gui)
(rmg-try-require 'rmg-codestyle-global)
(rmg-try-require 'rmg-codestyle-c-like)
(rmg-try-require 'rmg-codestyle-java)
(rmg-try-require 'rmg-codestyle-javascript)
(rmg-try-require 'rmg-training-wheels)
(rmg-try-require 'rmg-keybindings)
(ignore-errors (require 'site-customizations))

;; TODOs:
;; - org mode
;; - ffir as replacement for ffip
;; - flycheck
;; - JS2-mode
;; - key for jquery-doc -- maybe C-h C-j? Only in JS modes?

(add-hook 'after-init-hook
          (lambda ()
            (message "Missing packages: %s"
                     rmg-missing-packages-list))
          t)
