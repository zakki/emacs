;; -*- no-byte-compile: t -*-

(defun terminal-init-vt102 ()
  "Terminal initialization function for vt102."
  (tty-run-terminal-initialization (selected-frame) "vt100"))

;; arch-tag: 6e839cfc-125a-4574-82f1-c23a51f7c50f
;;; vt102.el ends here
