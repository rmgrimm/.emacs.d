;; Determine platform
(defvar running-on-windows
  (string-match "windows" (prin1-to-string system-type))
  "Whether emacs is currently running on MS Windows")
(defvar running-on-linux
  (string-match "linux" (prin1-to-string system-type))
  "Whether emacs is currently running on GNU/Linux")

;; Determine variant of emacs
(defvar running-gnu-emacs
  (string-match "GNU Emacs" (version))
  "Whether the currently running version of emacs is GNU Emacs")

(provide 'rmg-environment)