;;; undigest.el --- digest-cracking support for the RMAIL mail reader

;; Copyright (C) 1985, 1986, 1994, 1996, 2002
;; Free Software Foundation, Inc.

;; Maintainer: FSF
;; Keywords: mail

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; See Internet RFC 934 and RFC 1153

;;; Code:

(require 'rmail)

(defcustom rmail-digest-picky nil
  "Whether \[undigestify-rmail-message] should strictly follow RFC 1153
or be more tolerant of deviations from it.
Does not apply to digests that follow RFC 934."
  :type 'boolean
  :group 'rmail)

(defconst rmail-digest-start-regex
  (if rmail-digest-picky
      "^-\\{70\\}\n\n" ;rfc 1153
    "^-\\{55,\\}\n\n")
  "A regular expression for finding the end of the preamble (RFC 1153).")

(defconst rmail-digest-separator-regex
  (if rmail-digest-picky
      "^\n-\\{30\\}\n\n" ;rfc 1153
    "^\n-\\{27,\\}\n\n")
  "A regular expression for finding the end of an enclosed message (RFC 1153).")

(defconst rmail-digest-end-regex
  (if rmail-digest-picky
      "^\n-\\{30\\}\n\nEnd of .* Digest.*\n\\*\\{15,\\}\n+\'" ;rfc 1153
    "^\n-\\{27,\\}\n\nEnd of")
  "A regular expression for finding the trailer (RFC 1153).")

(defconst rmail-digest-mail-separator
  "\^_\^L\n0, unseen,,\n*** EOOH ***\n"
  "String substituted to the digest separator to create separate messages.")

;;;###autoload
(defun undigestify-rmail-message ()
  "Break up a digest message into its constituent messages.
Leaves original message, deleted, before the undigestified messages."
  (interactive)
  (with-current-buffer rmail-buffer
    (widen)
    (let ((error t)
	  (buffer-read-only nil))
      (goto-char (rmail-msgend rmail-current-message))
      (let ((msg-copy (buffer-substring (rmail-msgbeg rmail-current-message)
					(rmail-msgend rmail-current-message))))
	(narrow-to-region (point) (point))
	(insert msg-copy))
      (narrow-to-region (point-min) (1- (point-max)))
      (unwind-protect
	  (progn
	    (save-restriction
	      (goto-char (point-min))
	      (delete-region (point-min)
			     (progn (search-forward "\n*** EOOH ***\n" nil t)
				    (point)))
	      (insert rmail-digest-mail-separator)
	      (narrow-to-region (point)
				(point-max))
	      (let ((fill-prefix "")
		    (case-fold-search t)
		    digest-name type start end separator)
		(setq digest-name (mail-strip-quoted-names
				   (save-restriction
				     (search-forward "\n\n" nil 'move)
				     (setq start (point))
				     (narrow-to-region (point-min) start)
				     (or (mail-fetch-field "Reply-To")
					 (mail-fetch-field "To")
					 (mail-fetch-field "Apparently-To")
					 (mail-fetch-field "From")))))
		(unless digest-name
		  (error "Message is not a digest--bad header"))
		(unless (or (re-search-forward rmail-digest-start-regex nil t)
			    (re-search-forward "^-.*\n\n" nil t))
		  (error "Message is not a digest--no preamble delimiter"))

		;; Find the message separator string and the digest type
		(setq start (point))
		(save-match-data
		  (setq separator (concat "\n" (match-string 0)))
		  (if (search-forward separator nil t)
		      ;; rfc 934 -style message: the preamble delimiter is
		      ;; also the message separator
		      (setq type 'rfc934)
		    ;; rfc 1153 -style message: the separator is different
		    ;; from the preamble delimiter
		    (setq separator rmail-digest-separator-regex)
		    (unless (search-forward separator nil t)
		      (error "Message is not a digest--no message delimiter"))
		    (unless (search-forward rmail-digest-end-regex nil t)
		      (error "Message is not a digest--no trailer"))
		    (setq type 'rfc1153)))

		;;; Split the digest into separate rmail messages
		;; Add first rmail header
		(goto-char start)
		(replace-match rmail-digest-mail-separator)

		;; Add subsequent rmail headers
		(while (progn (setq start (point))
			      (search-forward separator nil t))
		  (setq end (match-beginning 0))
		  (replace-match rmail-digest-mail-separator)
		  (goto-char start)
		  (search-forward "\n\n" end 'move)
		  (save-restriction
		    (narrow-to-region start (point))
		    (unless (mail-fetch-field "To")
		      (goto-char start)
		      (insert "To: " digest-name "\n")))

		  ;; Undo masking of separators inside digestified messages
		  (let ((fromstring (if (eq type 'rfc934)
					"\n- -"
				      (replace-regexp-in-string
				       "\n-" "\n " separator)))
			(tostring  (if (eq type 'rfc934) "\n-" separator)))
		    (goto-char start)
		    (while (search-forward fromstring end t)
		      (replace-match tostring))
		    ))))
	    (setq error nil)
	    (message "Message successfully undigestified")
	    (let ((n rmail-current-message))
	      (rmail-forget-messages)
	      (rmail-show-message n)
	      (rmail-delete-forward)
	      (if (rmail-summary-exists)
		  (rmail-select-summary
		   (rmail-update-summary)))))
	(cond (error
	       (narrow-to-region (point-min) (1+ (point-max)))
	       (delete-region (point-min) (point-max))
	       (rmail-show-message rmail-current-message)))))))

;;;###autoload
(defun unforward-rmail-message ()
  "Extract a forwarded message from the containing message.
This puts the forwarded message into a separate rmail message
following the containing message."
  (interactive)
  ;; If we are in a summary buffer, switch to the Rmail buffer.
  (with-current-buffer rmail-buffer
    (narrow-to-region (rmail-msgbeg rmail-current-message)
		      (rmail-msgend rmail-current-message))
    (goto-char (point-min))
    (let (beg end (buffer-read-only nil) msg-string who-forwarded-it)
      (setq who-forwarded-it (mail-fetch-field "From"))
      (if (re-search-forward "^----" nil t)
	  nil
	(error "No forwarded message"))
      (forward-line 1)
      (setq beg (point))
      (if (re-search-forward "^----" nil t)
	  (setq end (match-beginning 0))
	(error "No terminator for forwarded message"))
      (widen)
      (setq msg-string (buffer-substring beg end))
      (goto-char (rmail-msgend rmail-current-message))
      (narrow-to-region (point) (point))
      (insert "\^_\^L\n0, unseen,,\n*** EOOH ***\n")
      (narrow-to-region (point) (point))
      (insert "Forwarded-by: " who-forwarded-it "\n")
      (insert msg-string)
      (goto-char (point-min))
      (while (not (eobp))
	(if (looking-at "- ")
	    (delete-region (point) (+ 2 (point))))
	(forward-line 1))
      (let ((n rmail-current-message))
	(rmail-forget-messages)
	(rmail-show-message n)
	(if (rmail-summary-exists)
	    (rmail-select-summary
	     (rmail-update-summary)))))))

(provide 'undigest)

;;; undigest.el ends here
