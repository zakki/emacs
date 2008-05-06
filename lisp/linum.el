;;; linum.el --- display line numbers in the left margin

;; Copyright (C) 2008 Free Software Foundation, Inc.

;; Author: Markus Triska <markus.triska@gmx.at>
;; Maintainer: FSF
;; Keywords: convenience

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Display line numbers for the current buffer.
;;
;; Toggle display of line numbers with M-x linum-mode.  To enable
;; line numbering in all buffers, use M-x global-linum-mode.

;;; Code:

(defconst linum-version "0.9wx")

(defvar linum-overlays nil "Overlays used in this buffer.")
(defvar linum-available nil "Overlays available for reuse.")
(defvar linum-before-numbering-hook nil
  "Functions run in each buffer before line numbering starts.")

(mapc #'make-variable-buffer-local '(linum-overlays linum-available))

(defgroup linum nil
  "Show line numbers in the left margin."
  :group 'convenience)

;;;###autoload
(defcustom linum-format 'dynamic
  "Format used to display line numbers.
Either a format string like \"%7d\", `dynamic' to adapt the width
as needed, or a function that is called with a line number as its
argument and should evaluate to a string to be shown on that line.
See also `linum-before-numbering-hook'."
  :group 'linum
  :type 'sexp)

(defface linum
  '((t :inherit shadow))
  "Face for displaying line numbers in the display margin."
  :group 'linum)

(defcustom linum-eager t
  "Whether line numbers should be updated after each command.
The conservative setting `nil' might miss some buffer changes,
and you have to scroll or press \\[recenter-top-bottom] to update the numbers."
  :group 'linum
  :type 'boolean)

(defcustom linum-delay t
  "Delay updates to give Emacs a chance for other changes."
  :group 'linum
  :type 'boolean)

;;;###autoload
(define-minor-mode linum-mode
  "Toggle display of line numbers in the left margin."
  :lighter ""                           ; for desktop.el
  (if linum-mode
      (progn
        (if linum-eager
            (add-hook 'post-command-hook (if linum-delay
                                             'linum-schedule
                                           'linum-update-current) nil t)
          (add-hook 'after-change-functions 'linum-after-change nil t))
        (add-hook 'window-scroll-functions 'linum-after-scroll nil t)
        ;; mistake in Emacs: window-size-change-functions cannot be local
        (add-hook 'window-size-change-functions 'linum-after-size)
        (add-hook 'change-major-mode-hook 'linum-delete-overlays nil t)
        (add-hook 'window-configuration-change-hook
                  'linum-after-config nil t)
        (linum-update-current))
    (remove-hook 'post-command-hook 'linum-update-current t)
    (remove-hook 'post-command-hook 'linum-schedule t)
    (remove-hook 'window-size-change-functions 'linum-after-size)
    (remove-hook 'window-scroll-functions 'linum-after-scroll t)
    (remove-hook 'after-change-functions 'linum-after-change t)
    (remove-hook 'window-configuration-change-hook 'linum-after-config t)
    (remove-hook 'change-major-mode-hook 'linum-delete-overlays t)
    (linum-delete-overlays)))

;;;###autoload
(define-globalized-minor-mode global-linum-mode linum-mode linum-on)

(defun linum-on ()
  (unless (minibufferp)
    (linum-mode 1)))

(defun linum-delete-overlays ()
  "Delete all overlays displaying line numbers for this buffer."
  (mapc #'delete-overlay linum-overlays)
  (setq linum-overlays nil)
  (dolist (w (get-buffer-window-list (current-buffer) nil t))
    (set-window-margins w 0)))

(defun linum-update-current ()
  "Update line numbers for the current buffer."
  (linum-update (current-buffer)))

(defun linum-update (buffer)
  "Update line numbers for all windows displaying BUFFER."
  (with-current-buffer buffer
    (when linum-mode
      (setq linum-available linum-overlays)
      (setq linum-overlays nil)
      (save-excursion
        (mapc #'linum-update-window
              (get-buffer-window-list buffer nil 'visible)))
      (mapc #'delete-overlay linum-available)
      (setq linum-available nil))))

(defun linum-update-window (win)
  "Update line numbers for the portion visible in window WIN."
  (goto-char (window-start win))
  (let ((line (line-number-at-pos))
        (limit (1+ (window-end win t)))
        (fmt (cond ((stringp linum-format) linum-format)
                   ((eq linum-format 'dynamic)
                    (let ((w (length (number-to-string
                                      (count-lines (point-min) (point-max))))))
                      (concat "%" (number-to-string w) "d")))))
        (width 0)
        visited
        ov)
    (run-hooks 'linum-before-numbering-hook)
    ;; Create an overlay (or reuse an existing one) for each
    ;; line visible in this window, if necessary.
    (while (and (not (eobp)) (< (point) limit))
      (setq visited nil)
      (dolist (o (overlays-in (point) (point)))
        (when (eq (overlay-get o 'linum-line) line)
          (unless (memq o linum-overlays)
            (push o linum-overlays))
          (setq linum-available (delete o linum-available))
          (setq visited t)))
      (let ((str (if fmt
                     (propertize (format fmt line) 'face 'linum)
                   (funcall linum-format line))))
        (setq width (max width (length str)))
        (unless visited
          (if (null linum-available)
              (setq ov (make-overlay (point) (point)))
            (setq ov (pop linum-available))
            (move-overlay ov (point) (point)))
          (push ov linum-overlays)
          (setq str (propertize " " 'display `((margin left-margin) ,str)))
          (overlay-put ov 'before-string str)
          (overlay-put ov 'linum-line line)))
      (forward-line)
      (setq line (1+ line)))
    (set-window-margins win width)))

(defun linum-after-change (beg end len)
  ;; update overlays on deletions, and after newlines are inserted
  (when (or (= beg end)
            (= end (point-max))
            (string-match-p "\n" (buffer-substring-no-properties beg end)))
    (linum-update-current)))

(defun linum-after-scroll (win start)
  (linum-update (window-buffer win)))

(defun linum-after-size (frame)
  (linum-after-config))

(defun linum-schedule ()
  ;; schedule an update; the delay gives Emacs a chance for display changes
  (run-with-idle-timer 0 nil #'linum-update-current))

(defun linum-after-config ()
  (walk-windows (lambda (w) (linum-update (window-buffer w))) nil 'visible))

(defun linum-unload-function ()
  "Unload the Linum library."
  (global-linum-mode -1)
  ;; continue standard unloading
  nil)

(provide 'linum)

;; arch-tag: dea45631-ed3c-4867-8b49-1c41c80aec6a
;;; linum.el ends here
