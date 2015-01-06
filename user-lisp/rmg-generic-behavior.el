;; Verify SSL/TLS
(setq gnutls-verify-error t)

;; Apropos should cover everything
(setq apropos-do-all t)

;; Don't use shift to mark things
(setq shift-select-mode nil)

;; Sentences end with a dot, not with two spaces
(setq sentence-end-double-space nil)

;; Fill at 79, not 70
(setq default-fill-column 79)

;; Use y-or-n-p instead of yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

;; Default to Chinese PinYin input
(setq default-input-method 'chinese-py)

;; Mouse yank at point, not at mouse position
(rmg-on-frames t nil nil
               (when (display-mouse-p)
                 (setq mouse-yank-at-point t)))

;; Don't make sounds
(setq visible-bell t)

;; Semantic mode in programming modes
(add-hook 'prog-mode
          (lambda ()
            (semantic-mode 1)))

;; helm for M-x
(when (rmg-try-require 'helm-config)
  ;; Just to be sure; I prefer ido style for most things, actually...
  ;; maybe not.
  (helm-mode 1)

  ;; Other settings
  (setq ;helm-prevent-escaping-from-minibuffer nil
   helm-buffers-fuzzy-matching t
   helm-man-or-woman-function 'woman))

;; Allow recursive minibuffers (but not in helm)
(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode 1)

;; undo tree
(when (rmg-try-require 'undo-tree)
  (global-undo-tree-mode 1))

(provide 'rmg-generic-behavior)
