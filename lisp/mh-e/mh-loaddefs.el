;;; mh-loaddefs.el --- automatically extracted autoloads
;;
;; Copyright (C) 2003, 2004, 2005, 2006 Free Software Foundation, Inc.
;; Author: Bill Wohler <wohler@newt.com>
;; Keywords: mail
;;; Commentary:
;;; Change Log:
;;; Code:

;;;### (autoloads (mh-letter-previous-header-field mh-letter-next-header-field-or-indent
;;;;;;  mh-beginning-of-word mh-complete-word mh-open-line mh-fully-kill-draft
;;;;;;  mh-yank-cur-msg mh-insert-letter mh-send-letter mh-insert-auto-fields
;;;;;;  mh-check-whom mh-insert-signature mh-to-fcc mh-to-field mh-get-header-field
;;;;;;  mh-send-other-window mh-send mh-reply mh-redistribute mh-forward
;;;;;;  mh-extract-rejected-mail mh-edit-again) "mh-comp" "mh-comp.el"
;;;;;;  (17350 5277))
;;; Generated autoloads from mh-comp.el

(autoload (quote mh-edit-again) "mh-comp" "\
Edit a MESSAGE to send it again.

If you don't complete a draft for one reason or another, and if
the draft buffer is no longer available, you can pick your draft
up again with this command. If you don't use a draft folder, your
last \"draft\" file will be used. If you use draft folders,
you'll need to visit the draft folder with \"\\[mh-visit-folder]
drafts <RET>\", use \\[mh-next-undeleted-msg] to move to the
appropriate message, and then use \\[mh-edit-again] to prepare
the message for editing.

This command can also be used to take messages that were sent to
you and to send them to more people.

Don't use this command to re-edit a message from a Mailer-Daemon
who complained that your mail wasn't posted for some reason or
another (see `mh-extract-rejected-mail').

The default message is the current message.

See also `mh-send'.

\(fn MESSAGE)" t nil)

(autoload (quote mh-extract-rejected-mail) "mh-comp" "\
Edit a MESSAGE that was returned by the mail system.

This command prepares the message for editing by removing the
Mailer-Daemon envelope and unneeded header fields. Fix whatever
addressing problem you had, and send the message again with
\\[mh-send-letter].

The default message is the current message.

See also `mh-send'.

\(fn MESSAGE)" t nil)

(autoload (quote mh-forward) "mh-comp" "\
Forward message.

You are prompted for the TO and CC recipients. You are given a
draft to edit that looks like it would if you had run the MH
command \"forw\". You can then add some text.

You can forward several messages by using a RANGE. All of the
messages in the range are inserted into your draft. Check the
documentation of `mh-interactive-range' to see how RANGE is read
in interactive use.

The hook `mh-forward-hook' is called on the draft.

See also `mh-compose-forward-as-mime-flag',
`mh-forward-subject-format', and `mh-send'.

\(fn TO CC &optional RANGE)" t nil)

(autoload (quote mh-redistribute) "mh-comp" "\
Redistribute a message.

This command is similar in function to forwarding mail, but it
does not allow you to edit the message, nor does it add your name
to the \"From\" header field. It appears to the recipient as if
the message had come from the original sender. When you run this
command, you are prompted for the TO and CC recipients. The
default MESSAGE is the current message.

Also investigate the command \\[mh-edit-again] for another way to
redistribute messages.

See also `mh-redist-full-contents-flag'.

\(fn TO CC &optional MESSAGE)" t nil)

(autoload (quote mh-reply) "mh-comp" "\
Reply to a MESSAGE.

When you reply to a message, you are first prompted with \"Reply
to whom?\" (unless the optional argument REPLY-TO is provided).
You have several choices here.

     Response     Reply Goes To

     from         The person who sent the message.  This is the
                  default, so <RET> is sufficient.

     to           Replies to the sender, plus all recipients in the
                  \"To:\" header field.

     all
     cc           Forms a reply to the sender, plus all recipients.

Depending on your answer, \"repl\" is given a different argument
to form your reply. Specifically, a choice of \"from\" or none at
all runs \"repl -nocc all\", and a choice of \"to\" runs \"repl
-cc to\". Finally, either \"cc\" or \"all\" runs \"repl -cc all
-nocc me\".

Two windows are then created. One window contains the message to
which you are replying in an MH-Show buffer. Your draft, in
MH-Letter mode (see `mh-letter-mode'), is in the other window.

If you supply a prefix argument INCLUDEP, the message you are
replying to is inserted in your reply after having first been run
through \"mhl\" with the format file \"mhl.reply\".

Alternatively, you can customize the option `mh-yank-behavior'
and choose one of its \"Automatically\" variants to do the same
thing. If you do so, the prefix argument has no effect.

Another way to include the message automatically in your draft is
to use \"repl: -filter repl.filter\" in your MH profile.

If you wish to customize the header or other parts of the reply
draft, please see \"repl\" and \"mh-format\".

See also `mh-reply-show-message-flag',
`mh-reply-default-reply-to', and `mh-send'.

\(fn MESSAGE &optional REPLY-TO INCLUDEP)" t nil)

(autoload (quote mh-send) "mh-comp" "\
Compose a message.

Your letter appears in an Emacs buffer whose mode is
MH-Letter (see `mh-letter-mode').

The arguments TO, CC, and SUBJECT can be used to prefill the
draft fields or suppress the prompts if `mh-compose-prompt-flag'
is on. They are also passed to the function set in the option
`mh-compose-letter-function'.

See also `mh-insert-x-mailer-flag' and `mh-letter-mode-hook'.

Outside of an MH-Folder buffer (`mh-folder-mode'), you must call
either \\[mh-smail] or \\[mh-smail-other-window] to compose a new
message.

\(fn TO CC SUBJECT)" t nil)

(autoload (quote mh-send-other-window) "mh-comp" "\
Compose a message in another window.

See `mh-send' for more information and a description of how the
TO, CC, and SUBJECT arguments are used.

\(fn TO CC SUBJECT)" t nil)

(autoload (quote mh-get-header-field) "mh-comp" "\
Find and return the body of FIELD in the mail header.
Returns the empty string if the field is not in the header of the
current buffer.

\(fn FIELD)" nil nil)

(autoload (quote mh-to-field) "mh-comp" "\
Move to specified header field.

The field is indicated by the previous keystroke (the last
keystroke of the command) according to the list in the variable
`mh-to-field-choices'.
Create the field if it does not exist.
Set the mark to point before moving.

\(fn)" t nil)

(autoload (quote mh-to-fcc) "mh-comp" "\
Move to \"Fcc:\" header field.

This command will prompt you for the FOLDER name in which to file
a copy of the draft.

\(fn &optional FOLDER)" t nil)

(autoload (quote mh-insert-signature) "mh-comp" "\
Insert signature in message.

This command inserts your signature at the current cursor location.

By default, the text of your signature is taken from the file
\"~/.signature\". You can read from other sources by changing the
option `mh-signature-file-name'.

A signature separator (\"-- \") will be added if the signature block
does not contain one and `mh-signature-separator-flag' is on.

The hook `mh-insert-signature-hook' is run after the signature is
inserted. Hook functions may access the actual name of the file or the
function used to insert the signature with `mh-signature-file-name'.

The signature can also be inserted using Identities (see
`mh-identity-list').

In a program, you can pass in a signature FILE.

\(fn &optional FILE)" t nil)

(autoload (quote mh-check-whom) "mh-comp" "\
Verify recipients, showing expansion of any aliases.

This command expands aliases so you can check the actual address(es)
in the alias. A new buffer named \"*MH-E Recipients*\" is created with
the output of \"whom\".

\(fn)" t nil)

(autoload (quote mh-insert-auto-fields) "mh-comp" "\
Insert custom fields if recipient is found in `mh-auto-fields-list'.

Sets buffer-local `mh-insert-auto-fields-done-local' if header
fields were added. If NON-INTERACTIVE is non-nil, perform actions
quietly and only if `mh-insert-auto-fields-done-local' is nil.

An `identity' entry is skipped if one was already entered
manually.

Return t if fields added; otherwise return nil.

\(fn &optional NON-INTERACTIVE)" t nil)

(autoload (quote mh-send-letter) "mh-comp" "\
Save draft and send message.

When you are all through editing a message, you send it with this
command. You can give a prefix argument ARG to monitor the first stage
of the delivery; this output can be found in a buffer called \"*MH-E
Mail Delivery*\".

The hook `mh-before-send-letter-hook' is run at the beginning of
this command. For example, if you want to check your spelling in
your message before sending, add the function `ispell-message'.

In case the MH \"send\" program is installed under a different name,
use `mh-send-prog' to tell MH-E the name.

\(fn &optional ARG)" t nil)

(autoload (quote mh-insert-letter) "mh-comp" "\
Insert a message.

This command prompts you for the FOLDER and MESSAGE number, which
defaults to the current message in that folder. It then inserts
the message, indented by `mh-ins-buf-prefix' (\"> \") unless
`mh-yank-behavior' is set to one of the supercite flavors in
which case supercite is used to format the message. Certain
undesirable header fields (see
`mh-invisible-header-fields-compiled') are removed before
insertion.

If given a prefix argument VERBATIM, the header is left intact, the
message is not indented, and \"> \" is not inserted before each line.
This command leaves the mark before the letter and point after it.

\(fn FOLDER MESSAGE VERBATIM)" t nil)

(autoload (quote mh-yank-cur-msg) "mh-comp" "\
Insert the current message into the draft buffer.

It is often useful to insert a snippet of text from a letter that
someone mailed to provide some context for your reply. This
command does this by adding an attribution, yanking a portion of
text from the message to which you're replying, and inserting
`mh-ins-buf-prefix' (`> ') before each line.

The attribution consists of the sender's name and email address
followed by the content of the option
`mh-extract-from-attribution-verb'.

You can also turn on the option
`mh-delete-yanked-msg-window-flag' to delete the window
containing the original message after yanking it to make more
room on your screen for your reply.

You can control how the message to which you are replying is
yanked into your reply using `mh-yank-behavior'.

If this isn't enough, you can gain full control over the
appearance of the included text by setting `mail-citation-hook'
to a function that modifies it. For example, if you set this hook
to `trivial-cite' (which is NOT part of Emacs), set
`mh-yank-behavior' to \"Body and Header\" (see URL
`http://shasta.cs.uiuc.edu/~lrclause/tc.html').

Note that if `mail-citation-hook' is set, `mh-ins-buf-prefix' is
not inserted. If the option `mh-yank-behavior' is set to one of
the supercite flavors, the hook `mail-citation-hook' is ignored
and `mh-ins-buf-prefix' is not inserted.

\(fn)" t nil)

(autoload (quote mh-fully-kill-draft) "mh-comp" "\
Quit editing and delete draft message.

If for some reason you are not happy with the draft, you can use
this command to kill the draft buffer and delete the draft
message. Use the command \\[kill-buffer] if you don't want to
delete the draft message.

\(fn)" t nil)

(autoload (quote mh-open-line) "mh-comp" "\
Insert a newline and leave point before it.

This command is similar to the command \\[open-line] in that it
inserts a newline after point. It differs in that it also inserts
the right number of quoting characters and spaces so that the
next line begins in the same column as it was. This is useful
when breaking up paragraphs in replies.

\(fn)" t nil)

(autoload (quote mh-complete-word) "mh-comp" "\
Complete WORD at from CHOICES.
Any match found replaces the text from BEGIN to END.

\(fn WORD CHOICES BEGIN END)" nil nil)

(autoload (quote mh-beginning-of-word) "mh-comp" "\
Return position of the N th word backwards.

\(fn &optional N)" nil nil)

(autoload (quote mh-letter-next-header-field-or-indent) "mh-comp" "\
Cycle to next field.

Within the header of the message, this command moves between
fields that are highlighted with the face
`mh-letter-header-field', skipping those fields listed in
`mh-compose-skipped-header-fields'. After the last field, this
command then moves point to the message body before cycling back
to the first field. If point is already past the first line of
the message body, then this command indents by calling
`indent-relative' with the given prefix argument ARG.

\(fn ARG)" t nil)

(autoload (quote mh-letter-previous-header-field) "mh-comp" "\
Cycle to the previous header field.

This command moves backwards between the fields and cycles to the
body of the message after the first field. Unlike the command
\\[mh-letter-next-header-field-or-indent], it will always take
point to the last field from anywhere in the body.

\(fn)" t nil)

;;;***

;;;### (autoloads (mh-prefix-help mh-help mh-ephem-message mh-store-buffer
;;;;;;  mh-store-msg mh-undo-folder mh-sort-folder mh-page-digest-backwards
;;;;;;  mh-page-digest mh-pipe-msg mh-pack-folder mh-list-folders
;;;;;;  mh-kill-folder mh-copy-msg mh-burst-digest) "mh-funcs" "mh-funcs.el"
;;;;;;  (17350 5277))
;;; Generated autoloads from mh-funcs.el

(autoload (quote mh-burst-digest) "mh-funcs" "\
Break up digest into separate messages\\<mh-folder-mode-map>.

This command uses the MH command \"burst\" to break out each
message in the digest into its own message. Using this command,
you can quickly delete unwanted messages, like this: Once the
digest is split up, toggle out of MH-Folder Show mode with
\\[mh-toggle-showing] so that the scan lines fill the screen and
messages aren't displayed. Then use \\[mh-delete-msg] to quickly
delete messages that you don't want to read (based on the
\"Subject:\" header field). You can also burst the digest to
reply directly to the people who posted the messages in the
digest. One problem you may encounter is that the \"From:\"
header fields are preceded with a \">\" so that your reply can't
create the \"To:\" field correctly. In this case, you must
correct the \"To:\" field yourself.

\(fn)" t nil)

(autoload (quote mh-copy-msg) "mh-funcs" "\
Copy RANGE to FOLDER\\<mh-folder-mode-map>.

If you wish to copy a message to another folder, you can use this
command (see the \"-link\" argument to \"refile\"). Like the
command \\[mh-refile-msg], this command prompts you for the name
of the target folder and you can specify a range. Note that
unlike the command \\[mh-refile-msg], the copy takes place
immediately. The original copy remains in the current folder.

Check the documentation of `mh-interactive-range' to see how
RANGE is read in interactive use.

\(fn RANGE FOLDER)" t nil)

(autoload (quote mh-kill-folder) "mh-funcs" "\
Remove folder.

Remove all of the messages (files) within the current folder, and
then remove the folder (directory) itself.

Run the abnormal hook `mh-kill-folder-suppress-prompt-hooks'. The
hook functions are called with no arguments and should return a
non-nil value to suppress the normal prompt when you remove a
folder. This is useful for folders that are easily regenerated.

\(fn)" t nil)

(autoload (quote mh-list-folders) "mh-funcs" "\
List mail folders.

\(fn)" t nil)

(autoload (quote mh-pack-folder) "mh-funcs" "\
Pack folder\\<mh-folder-mode-map>.

This command packs the folder, removing gaps from the numbering
sequence. If you don't want to rescan the entire folder
afterward, this command will accept a RANGE. Check the
documentation of `mh-interactive-range' to see how RANGE is read
in interactive use.

This command will ask if you want to process refiles or deletes
first and then either run \\[mh-execute-commands] for you or undo
the pending refiles and deletes, which are lost.

\(fn RANGE)" t nil)

(autoload (quote mh-pipe-msg) "mh-funcs" "\
Pipe message through shell command COMMAND.

You are prompted for the Unix command through which you wish to
run your message. If you give a prefix argument INCLUDE-HEADER to
this command, the message header is included in the text passed
to the command.

\(fn COMMAND INCLUDE-HEADER)" t nil)

(autoload (quote mh-page-digest) "mh-funcs" "\
Display next message in digest.

\(fn)" t nil)

(autoload (quote mh-page-digest-backwards) "mh-funcs" "\
Display previous message in digest.

\(fn)" t nil)

(autoload (quote mh-sort-folder) "mh-funcs" "\
Sort folder.

By default, messages are sorted by date. The option
`mh-sortm-args' holds extra arguments to pass on to the command
\"sortm\" when a prefix argument EXTRA-ARGS is used.

\(fn &optional EXTRA-ARGS)" t nil)

(autoload (quote mh-undo-folder) "mh-funcs" "\
Undo all refiles and deletes in the current folder.

\(fn)" t nil)

(autoload (quote mh-store-msg) "mh-funcs" "\
Unpack message created with \"uudecode\" or \"shar\".

The default DIRECTORY for extraction is the current directory;
however, you have a chance to specify a different extraction
directory. The next time you use this command, the default
directory is the last directory you used. If you would like to
change the initial default directory, customize the option
`mh-store-default-directory', change the value from \"Current\"
to \"Directory\", and then enter the name of the directory for
storing the content of these messages.

\(fn DIRECTORY)" t nil)

(autoload (quote mh-store-buffer) "mh-funcs" "\
Unpack buffer created with \"uudecode\" or \"shar\".

See `mh-store-msg' for a description of DIRECTORY.

\(fn DIRECTORY)" t nil)

(autoload (quote mh-ephem-message) "mh-funcs" "\
Display STRING in the minibuffer momentarily.

\(fn STRING)" nil nil)

(autoload (quote mh-help) "mh-funcs" "\
Display cheat sheet for the MH-E commands.

\(fn)" t nil)

(autoload (quote mh-prefix-help) "mh-funcs" "\
Display cheat sheet for the commands of the current prefix in minibuffer.

\(fn)" t nil)

;;;***

;;;### (autoloads (mh-identity-handler-bottom mh-identity-handler-top
;;;;;;  mh-identity-insert-attribution-verb mh-identity-handler-attribution-verb
;;;;;;  mh-identity-handler-signature mh-identity-handler-gpg-identity
;;;;;;  mh-insert-identity mh-identity-list-set mh-identity-make-menu)
;;;;;;  "mh-identity" "mh-identity.el" (17350 5277))
;;; Generated autoloads from mh-identity.el

(autoload (quote mh-identity-make-menu) "mh-identity" "\
Build the Identity menu.
This should be called any time `mh-identity-list' or
`mh-auto-fields-list' change.

\(fn)" nil nil)

(autoload (quote mh-identity-list-set) "mh-identity" "\
Update the `mh-identity-list' variable, and rebuild the menu.
Sets the default for SYMBOL (for example, `mh-identity-list') to
VALUE (as set in customization). This is called after 'customize
is used to alter `mh-identity-list'.

\(fn SYMBOL VALUE)" nil nil)

(autoload (quote mh-insert-identity) "mh-identity" "\
Insert fields specified by given IDENTITY.
See `mh-identity-list'.

\(fn IDENTITY)" t nil)

(autoload (quote mh-identity-handler-gpg-identity) "mh-identity" "\
Process header FIELD \":pgg-default-user-id\".
The ACTION is one of 'remove or 'add. If 'add, the VALUE is added.
The buffer-local variable `mh-identity-pgg-default-user-id' is set to
VALUE when action 'add is selected.

\(fn FIELD ACTION &optional VALUE)" nil nil)

(autoload (quote mh-identity-handler-signature) "mh-identity" "\
Process header FIELD \":signature\".
The ACTION is one of 'remove or 'add. If 'add, the VALUE is
added.

\(fn FIELD ACTION &optional VALUE)" nil nil)

(autoload (quote mh-identity-handler-attribution-verb) "mh-identity" "\
Process header FIELD \":attribution-verb\".
The ACTION is one of 'remove or 'add. If 'add, the VALUE is
added.

\(fn FIELD ACTION &optional VALUE)" nil nil)

(autoload (quote mh-identity-insert-attribution-verb) "mh-identity" "\
Insert VALUE as attribution verb, setting up delimiting markers.
If VALUE is nil, use `mh-extract-from-attribution-verb'.

\(fn VALUE)" nil nil)

(autoload (quote mh-identity-handler-top) "mh-identity" "\
Process header FIELD.
The ACTION is one of 'remove or 'add. If 'add, the VALUE is
added. If the field wasn't present, it is added to the top of the
header.

\(fn FIELD ACTION &optional VALUE)" nil nil)

(autoload (quote mh-identity-handler-bottom) "mh-identity" "\
Process header FIELD.
The ACTION is one of 'remove or 'add. If 'add, the VALUE is
added. If the field wasn't present, it is added to the bottom of
the header.

\(fn FIELD ACTION &optional VALUE)" nil nil)

;;;***

;;;### (autoloads (mh-inc-spool-list-set) "mh-inc" "mh-inc.el" (17350
;;;;;;  4091))
;;; Generated autoloads from mh-inc.el

(autoload (quote mh-inc-spool-list-set) "mh-inc" "\
Set-default SYMBOL to VALUE to update the `mh-inc-spool-list' variable.
Also rebuilds the user commands.
This is called after 'customize is used to alter `mh-inc-spool-list'.

\(fn SYMBOL VALUE)" nil nil)

;;;***

;;;### (autoloads (mh-index-choose mh-namazu-execute-search mh-swish++-execute-search
;;;;;;  mh-swish-execute-search mh-index-ticked-messages mh-index-new-messages
;;;;;;  mh-index-sequenced-messages mh-index-delete-from-sequence
;;;;;;  mh-index-add-to-sequence mh-index-execute-commands mh-index-visit-folder
;;;;;;  mh-index-delete-folder-headers mh-index-group-by-folder mh-index-create-imenu-index
;;;;;;  mh-index-insert-folder-headers mh-index-previous-folder mh-index-next-folder
;;;;;;  mh-index-parse-search-regexp mh-index-do-search mh-index-p
;;;;;;  mh-index-read-data mh-index-search mh-index-create-sequences
;;;;;;  mh-create-sequence-map mh-index-update-maps) "mh-index" "mh-index.el"
;;;;;;  (17350 5277))
;;; Generated autoloads from mh-index.el

(autoload (quote mh-index-update-maps) "mh-index" "\
Annotate all as yet unannotated messages in FOLDER with their MD5 hash.
As a side effect msg -> checksum map is updated. Optional
argument ORIGIN-MAP is a hashtable which maps each message in the
index folder to the original folder and message from whence it
was copied. If present the checksum -> (origin-folder,
origin-index) map is updated too.

\(fn FOLDER &optional ORIGIN-MAP)" nil nil)

(autoload (quote mh-create-sequence-map) "mh-index" "\
Return a map from msg number to list of sequences in which it is present.
SEQ-LIST is an assoc list whose keys are sequence names and whose
cdr is the list of messages in that sequence.

\(fn SEQ-LIST)" nil nil)

(autoload (quote mh-index-create-sequences) "mh-index" "\
Mirror sequences present in source folders in index folder.

\(fn)" nil nil)

(autoload (quote mh-index-search) "mh-index" "\
Perform an indexed search in an MH mail folder.

Use a prefix argument to repeat the last search.

Unlike regular searches, the prompt for the folder to search can
be \"all\" to search all folders; in addition, the search works
recursively on the listed folder. The search criteria are entered
in an MH-Pick buffer as described in `mh-search-folder'.\\<mh-pick-mode-map>

To perform the search, type \\[mh-do-search]. Another difference
from the regular searches is that because the search operates on
more than one folder, the messages that are found are put in a
temporary sub-folder of \"+mhe-index\" and are displayed in an
MH-Folder buffer. This buffer is special because it displays
messages from multiple folders; each set of messages from a given
folder has a heading with the folder name.\\<mh-folder-mode-map>

The appearance of the heading can be modified by customizing the
face `mh-index-folder'. You can jump back and forth between the
headings using the commands \\[mh-index-next-folder] and
\\[mh-index-previous-folder].

In addition, the command \\[mh-index-visit-folder] can be used to
visit the folder of the message at point. Initially, only the
messages that matched the search criteria are displayed in the
folder. While the temporary buffer has its own set of message
numbers, the actual messages numbers are shown in the visited
folder. Thus, the command \\[mh-index-visit-folder] is useful to
find the actual message number of an interesting message, or to
view surrounding messages with the command \\[mh-rescan-folder].

Because this folder is temporary, you'll probably get in the
habit of killing it when you're done with
\\[mh-kill-folder].

If you have run the command \\[mh-search-folder], but change your
mind while entering the search criteria and actually want to run
an indexed search, then you can use the command
\\<mh-pick-mode-map>\\[mh-index-do-search] in the MH-Pick
buffer.\\<mh-folder-mode-map>

The command \\[mh-index-search] runs the command defined by the
option `mh-index-program'. The default value is \"Auto-detect\"
which means that MH-E will automatically choose one of
\"swish++\", \"swish-e\", \"mairix\", \"namazu\", \"pick\" and
\"grep\" in that order. If, for example, you have both
\"swish++\" and \"mairix\" installed and you want to use
\"mairix\", then you can set this option to \"mairix\".

                                *NOTE*

     The \"pick\" and \"grep\" commands do not perform a
     recursive search on the given folder.

This command uses an \"X-MHE-Checksum:\" header field to cache
the MD5 checksum of a message. This means that if an incoming
message already contains an \"X-MHE-Checksum:\" field, that
message might not be found by this command. The following
\"procmail\" recipe avoids this problem by renaming the existing
header field:

     :0 wf
     | formail -R \"X-MHE-Checksum\" \"X-Old-MHE-Checksum\"

The documentation for the following commands describe how to set
up the various indexing programs to use with MH-E. The \"pick\"
and \"grep\" commands do not require additional configuration.

    - `mh-swish++-execute-search'
    - `mh-swish-execute-search'
    - `mh-mairix-execute-search'
    - `mh-namazu-execute-search'
    - `mh-pick-execute-search'
    - `mh-grep-execute-search'

In a program, if REDO-SEARCH-FLAG is non-nil and the current
folder buffer was generated by a index search, then the search is
repeated. Otherwise, FOLDER is searched with SEARCH-REGEXP and
the results are presented in an MH-E folder. If FOLDER is \"+\"
then mail in all folders are searched. Optional argument
WINDOW-CONFIG stores the window configuration that will be
restored after the user quits the folder containing the index
search results.

\(fn REDO-SEARCH-FLAG FOLDER SEARCH-REGEXP &optional WINDOW-CONFIG)" t nil)

(autoload (quote mh-index-read-data) "mh-index" "\
Read index data from file.

\(fn)" nil nil)

(autoload (quote mh-index-p) "mh-index" "\
Non-nil means that this folder was generated by an index search.

\(fn)" nil nil)

(autoload (quote mh-index-do-search) "mh-index" "\
Find messages that match the qualifications in the current pattern buffer.

\(fn)" t nil)

(autoload (quote mh-index-parse-search-regexp) "mh-index" "\
Construct parse tree for INPUT-STRING.
All occurrences of &, |, ! and ~ in INPUT-STRING are replaced by
AND, OR and NOT as appropriate. Then the resulting string is
parsed.

\(fn INPUT-STRING)" nil nil)

(autoload (quote mh-index-next-folder) "mh-index" "\
Jump to the next folder marker.

With non-nil optional argument BACKWARD-FLAG, jump to the previous
group of results.

\(fn &optional BACKWARD-FLAG)" t nil)

(autoload (quote mh-index-previous-folder) "mh-index" "\
Jump to the previous folder marker.

\(fn)" t nil)

(autoload (quote mh-index-insert-folder-headers) "mh-index" "\
Annotate the search results with original folder names.

\(fn)" nil nil)

(autoload (quote mh-index-create-imenu-index) "mh-index" "\
Create alist of folder names and positions in index folder buffers.

\(fn)" nil nil)

(autoload (quote mh-index-group-by-folder) "mh-index" "\
Partition the messages based on source folder.
Returns an alist with the the folder names in the car and the cdr
being the list of messages originally from that folder.

\(fn)" nil nil)

(autoload (quote mh-index-delete-folder-headers) "mh-index" "\
Delete the folder headers.

\(fn)" nil nil)

(autoload (quote mh-index-visit-folder) "mh-index" "\
Visit original folder from where the message at point was found.

\(fn)" t nil)

(autoload (quote mh-index-execute-commands) "mh-index" "\
Delete/refile the actual messages.
The copies in the searched folder are then deleted/refiled to get
the desired result. Before deleting the messages we make sure
that the message being deleted is identical to the one that the
user has marked in the index buffer.

\(fn)" nil nil)

(autoload (quote mh-index-add-to-sequence) "mh-index" "\
Add to SEQ the messages in the list MSGS.
This function updates the source folder sequences. Also makes an
attempt to update the source folder buffer if we have it open.

\(fn SEQ MSGS)" nil nil)

(autoload (quote mh-index-delete-from-sequence) "mh-index" "\
Delete from SEQ the messages in MSGS.
This function updates the source folder sequences. Also makes an
attempt to update the source folder buffer if present.

\(fn SEQ MSGS)" nil nil)

(autoload (quote mh-index-sequenced-messages) "mh-index" "\
Display messages in any sequence.

All messages from the FOLDERS in `mh-new-messages-folders' in the
SEQUENCE you provide are listed. With a prefix argument, enter a
space-separated list of folders at the prompt, or nothing to
search all folders.

\(fn FOLDERS SEQUENCE)" t nil)

(autoload (quote mh-index-new-messages) "mh-index" "\
Display unseen messages.

If you use a program such as \"procmail\" to use \"rcvstore\" to file
your incoming mail automatically, you can display new, unseen,
messages using this command. All messages in the \"unseen\"
sequence from the folders in `mh-new-messages-folders' are
listed.

With a prefix argument, enter a space-separated list of FOLDERS,
or nothing to search all folders.

\(fn FOLDERS)" t nil)

(autoload (quote mh-index-ticked-messages) "mh-index" "\
Display ticked messages.

All messages in `mh-tick-seq' from the folders in
`mh-ticked-messages-folders' are listed.

With a prefix argument, enter a space-separated list of FOLDERS,
or nothing to search all folders.

\(fn FOLDERS)" t nil)

(autoload (quote mh-swish-execute-search) "mh-index" "\
Execute swish-e and read the results.

In the examples below, replace \"/home/user/Mail\" with the path
to your MH directory.

First create the directory \"/home/user/Mail/.swish\". Then
create the file \"/home/user/Mail/.swish/config\" with the
following contents:

     DefaultContents TXT*
     IndexDir /home/user/Mail
     IndexFile /home/user/Mail/.swish/index
     IndexName \"Mail Index\"
     IndexDescription \"Mail Index\"
     IndexPointer \"http://nowhere\"
     IndexAdmin \"nobody\"
     #MetaNames automatic
     IndexReport 3
     FollowSymLinks no
     UseStemming no
     IgnoreTotalWordCountWhenRanking yes
     WordCharacters abcdefghijklmnopqrstuvwxyz0123456789-
     BeginCharacters abcdefghijklmnopqrstuvwxyz
     EndCharacters abcdefghijklmnopqrstuvwxyz0123456789
     IgnoreLimit 50 1000
     IndexComments 0
     FileRules filename contains \\D
     FileRules pathname contains /home/user/Mail/.swish
     FileRules pathname contains /home/user/Mail/mhe-index

This configuration does not index the folders that hold the
results of your searches in \"+mhe-index\" since they tend to be
ephemeral and the original messages are indexed anyway.

If there are any directories you would like to ignore, append
lines like the following to \"config\":

     FileRules pathname contains /home/user/Mail/scripts

Use the following command line to generate the swish index. Run
this daily from cron:

         swish-e -c /home/user/Mail/.swish/config

In a program, FOLDER-PATH is the directory in which SEARCH-REGEXP
is used to search.

\(fn FOLDER-PATH SEARCH-REGEXP)" nil nil)

(autoload (quote mh-swish++-execute-search) "mh-index" "\
Execute swish++ and read the results.

In the examples below, replace \"/home/user/Mail\" with the path to
your MH directory.

First create the directory \"/home/user/Mail/.swish++\". Then create
the file \"/home/user/Mail/.swish++/swish++.conf\" with the following
contents:

     IncludeMeta         Bcc Cc Comments Content-Description From Keywords
     IncludeMeta         Newsgroups Resent-To Subject To
     IncludeMeta         Message-Id References In-Reply-To
     IncludeFile         Mail    *
     IndexFile           /home/user/Mail/.swish++/swish++.index

Use the following command line to generate the swish index. Run
this daily from cron:

     find /home/user/Mail -path /home/user/Mail/mhe-index -prune \\
                          -o -path /home/user/Mail/.swish++ -prune \\
                          -o -name \"[0-9]*\" -print \\
         | index -c /home/user/Mail/.swish++/swish++.conf -

This command does not index the folders that hold the results of your
searches in \"+mhe-index\" since they tend to be ephemeral and the
original messages are indexed anyway.

On some systems (Debian GNU/Linux, for example), use \"index++\"
instead of \"index\".

In a program, FOLDER-PATH is the directory in which SEARCH-REGEXP is
used to search.

\(fn FOLDER-PATH SEARCH-REGEXP)" nil nil)

(autoload (quote mh-namazu-execute-search) "mh-index" "\
Execute namazu and read the results.

In the examples below, replace \"/home/user/Mail\" with the path to
your MH directory.

First create the directory \"/home/user/Mail/.namazu\". Then create
the file \"/home/user/Mail/.namazu/mknmzrc\" with the following
contents:

     package conf;  # Don't remove this line!
     $ADDRESS = 'user@localhost';
     $ALLOW_FILE = \"[0-9]*\";
     $EXCLUDE_PATH = \"^/home/user/Mail/(mhe-index|spam)\";

This configuration does not index the folders that hold the results of
your searches in \"+mhe-index\" since they tend to be ephemeral and
the original messages are indexed anyway.

Use the following command line to generate the namazu index. Run this
daily from cron:

     mknmz -f /home/user/Mail/.namazu/mknmzrc -O /home/user/Mail/.namazu \\
              /home/user/Mail

In a program, FOLDER-PATH is the directory in which SEARCH-REGEXP
is used to search.

\(fn FOLDER-PATH SEARCH-REGEXP)" nil nil)

(autoload (quote mh-index-choose) "mh-index" "\
Choose an indexing function.
The side-effects of this function are that the variables
`mh-indexer', `mh-index-execute-search-function', and
`mh-index-next-result-function' are set according to the first
indexer in `mh-indexer-choices' present on the system.

\(fn)" nil nil)

;;;***

;;;### (autoloads (mh-image-load-path mh-variant-p mh-variant-set
;;;;;;  mh-variants) "mh-init" "mh-init.el" (17350 4091))
;;; Generated autoloads from mh-init.el

(autoload (quote mh-variants) "mh-init" "\
Return a list of installed variants of MH on the system.
This function looks for MH in `mh-sys-path', `mh-path' and
`exec-path'. The format of the list of variants that is returned
is described by the variable `mh-variants'.

\(fn)" nil nil)

(autoload (quote mh-variant-set) "mh-init" "\
Set the MH variant to VARIANT.
Sets `mh-progs', `mh-lib', `mh-lib-progs' and
`mh-flists-present-flag'.
If the VARIANT is \"autodetect\", then first try nmh, then MH and
finally GNU mailutils.

\(fn VARIANT)" t nil)

(autoload (quote mh-variant-p) "mh-init" "\
Return t if variant is any of VARIANTS.
Currently known variants are 'MH, 'nmh, and 'mu-mh.

\(fn &rest VARIANTS)" nil nil)

(autoload (quote mh-image-load-path) "mh-init" "\
Ensure that the MH-E images are accessible by `find-image'.
Images for MH-E are found in ../../etc/images relative to the
files in \"lisp/mh-e\". If `image-load-path' exists (since Emacs
22), then the images directory is added to it if isn't already
there. Otherwise, the images directory is added to the
`load-path' if it isn't already there.

\(fn)" nil nil)

;;;***

;;;### (autoloads (mh-junk-whitelist mh-junk-blacklist) "mh-junk"
;;;;;;  "mh-junk.el" (17350 4091))
;;; Generated autoloads from mh-junk.el

(autoload (quote mh-junk-blacklist) "mh-junk" "\
Blacklist RANGE as spam.

This command trains the spam program in use (see the option
`mh-junk-program') with the content of RANGE and then handles the
message(s) as specified by the option `mh-junk-disposition'.

Check the documentation of `mh-interactive-range' to see how RANGE is
read in interactive use.

For more information about using your particular spam fighting
program, see:

  - `mh-spamassassin-blacklist'
  - `mh-bogofilter-blacklist'
  - `mh-spamprobe-blacklist'

\(fn RANGE)" t nil)

(autoload (quote mh-junk-whitelist) "mh-junk" "\
Whitelist RANGE as ham.

This command reclassifies the RANGE as ham if it were incorrectly
classified as spam (see the option `mh-junk-program'). It then
refiles the message into the \"+inbox\" folder.

Check the documentation of `mh-interactive-range' to see how
RANGE is read in interactive use.

\(fn RANGE)" t nil)

;;;***

;;;### (autoloads (mh-display-with-external-viewer mh-mime-inline-part
;;;;;;  mh-mime-save-part mh-push-button mh-press-button mh-mime-display
;;;;;;  mh-decode-message-header mh-toggle-mh-decode-mime-flag mh-mime-save-parts
;;;;;;  mh-display-emphasis mh-display-smileys mh-add-missing-mime-version-header
;;;;;;  mh-destroy-postponed-handles mh-mime-cleanup mh-mml-tag-present-p
;;;;;;  mh-mml-secure-message-signencrypt mh-mml-secure-message-encrypt
;;;;;;  mh-mml-secure-message-sign mh-mml-unsecure-message mh-mml-attach-file
;;;;;;  mh-mml-query-cryptographic-method mh-mml-forward-message
;;;;;;  mh-mml-to-mime mh-mh-directive-present-p mh-mh-to-mime-undo
;;;;;;  mh-mh-to-mime mh-mh-forward-message mh-mh-compose-external-type
;;;;;;  mh-mh-compose-external-compressed-tar mh-mh-compose-anon-ftp
;;;;;;  mh-mh-attach-file mh-file-mime-type mh-have-file-command
;;;;;;  mh-compose-forward mh-compose-insertion) "mh-mime" "mh-mime.el"
;;;;;;  (17350 5277))
;;; Generated autoloads from mh-mime.el

(autoload (quote mh-compose-insertion) "mh-mime" "\
Add tag to include a file such as an image or sound.

You are prompted for the filename containing the object, the
media type if it cannot be determined automatically, and a
content description. If you're using MH-style directives, you
will also be prompted for additional attributes.

The option `mh-compose-insertion' controls what type of tags are
inserted. Optional argument INLINE means make it an inline
attachment.

\(fn &optional INLINE)" t nil)

(autoload (quote mh-compose-forward) "mh-mime" "\
Add tag to forward a message.

You are prompted for a content DESCRIPTION, the name of the
FOLDER in which the messages to forward are located, and a RANGE
of messages, which defaults to the current message in that
folder. Check the documentation of `mh-interactive-range' to see
how RANGE is read in interactive use.

The option `mh-compose-insertion' controls what type of tags are inserted.

\(fn &optional DESCRIPTION FOLDER RANGE)" t nil)

(autoload (quote mh-have-file-command) "mh-mime" "\
Return t if 'file' command is on the system.
'file -i' is used to get MIME type of composition insertion.

\(fn)" nil nil)

(autoload (quote mh-file-mime-type) "mh-mime" "\
Return MIME type of FILENAME from file command.
Returns nil if file command not on system.

\(fn FILENAME)" nil nil)

(autoload (quote mh-mh-attach-file) "mh-mime" "\
Add a tag to insert a MIME message part from a file.
You are prompted for the FILENAME containing the object, the
media TYPE if it cannot be determined automatically, and a
content DESCRIPTION. In addition, you are also prompted for
additional ATTRIBUTES.

See also \\[mh-mh-to-mime].

\(fn FILENAME TYPE DESCRIPTION ATTRIBUTES)" t nil)

(autoload (quote mh-mh-compose-anon-ftp) "mh-mime" "\
Add tag to include anonymous ftp reference to a file.

You can have your message initiate an \"ftp\" transfer when the
recipient reads the message. You are prompted for the remote HOST
and FILENAME, the media TYPE, and the content DESCRIPTION.

See also \\[mh-mh-to-mime].

\(fn HOST FILENAME TYPE DESCRIPTION)" t nil)

(autoload (quote mh-mh-compose-external-compressed-tar) "mh-mime" "\
Add tag to include anonymous ftp reference to a compressed tar file.

In addition to retrieving the file via anonymous \"ftp\" as per
the command \\[mh-mh-compose-anon-ftp], the file will also be
uncompressed and untarred. You are prompted for the remote HOST
and FILENAME and the content DESCRIPTION.

See also \\[mh-mh-to-mime].

\(fn HOST FILENAME DESCRIPTION)" t nil)

(autoload (quote mh-mh-compose-external-type) "mh-mime" "\
Add tag to refer to a remote file.

This command is a general utility for referencing external files.
In fact, all of the other commands that insert directives to
access external files call this command. You are prompted for the
ACCESS-TYPE, remote HOST and FILENAME, and content TYPE. If you
provide a prefix argument, you are also prompted for a content
DESCRIPTION, ATTRIBUTES, PARAMETERS, and a COMMENT.

See also \\[mh-mh-to-mime].

\(fn ACCESS-TYPE HOST FILENAME TYPE &optional DESCRIPTION ATTRIBUTES PARAMETERS COMMENT)" t nil)

(autoload (quote mh-mh-forward-message) "mh-mime" "\
Add tag to forward a message.
You are prompted for a content DESCRIPTION, the name of the
FOLDER in which the messages to forward are located, and the
MESSAGES' numbers.

See also \\[mh-mh-to-mime].

\(fn &optional DESCRIPTION FOLDER MESSAGES)" t nil)

(autoload (quote mh-mh-to-mime) "mh-mime" "\
Compose MIME message from MH-style directives.

Typically, you send a message with attachments just like any other
message. However, you may take a sneak preview of the MIME encoding if
you wish by running this command.

If you wish to pass additional arguments to \"mhbuild\" (\"mhn\")
to affect how it builds your message, use the option
`mh-mh-to-mime-args'. For example, you can build a consistency
check into the message by setting `mh-mh-to-mime-args' to
\"-check\". The recipient of your message can then run \"mhbuild
-check\" on the message--\"mhbuild\" (\"mhn\") will complain if
the message has been corrupted on the way. This command only
consults this option when given a prefix argument EXTRA-ARGS.

The hook `mh-mh-to-mime-hook' is called after the message has been
formatted.

The effects of this command can be undone by running
\\[mh-mh-to-mime-undo].

\(fn &optional EXTRA-ARGS)" t nil)

(autoload (quote mh-mh-to-mime-undo) "mh-mime" "\
Undo effects of \\[mh-mh-to-mime].

It does this by reverting to a backup file. You are prompted to
confirm this action, but you can avoid the confirmation by adding
a prefix argument NOCONFIRM.

\(fn NOCONFIRM)" t nil)

(autoload (quote mh-mh-directive-present-p) "mh-mime" "\
Check if the text between BEGIN and END might be a MH-style directive.
The optional argument BEGIN defaults to the beginning of the
buffer, while END defaults to the the end of the buffer.

\(fn &optional BEGIN END)" nil nil)

(autoload (quote mh-mml-to-mime) "mh-mime" "\
Compose MIME message from MML tags.

Typically, you send a message with attachments just like any
other message. However, you may take a sneak preview of the MIME
encoding if you wish by running this command.

This action can be undone by running \\[undo].

\(fn)" t nil)

(autoload (quote mh-mml-forward-message) "mh-mime" "\
Forward a message as attachment.

The function will prompt the user for a DESCRIPTION, a FOLDER and
MESSAGE number.

\(fn DESCRIPTION FOLDER MESSAGE)" nil nil)

(autoload (quote mh-mml-query-cryptographic-method) "mh-mime" "\
Read the cryptographic method to use.

\(fn)" nil nil)

(autoload (quote mh-mml-attach-file) "mh-mime" "\
Add a tag to insert a MIME message part from a file.

You are prompted for the filename containing the object, the
media type if it cannot be determined automatically, a content
description and the DISPOSITION of the attachment.

This is basically `mml-attach-file' from Gnus, modified such that a prefix
argument yields an \"inline\" disposition and Content-Type is determined
automatically.

\(fn &optional DISPOSITION)" nil nil)

(autoload (quote mh-mml-unsecure-message) "mh-mime" "\
Remove any secure message tags.

\(fn)" t nil)

(autoload (quote mh-mml-secure-message-sign) "mh-mime" "\
Add tag to sign the message.

A proper multipart message is created for you when you send the
message. Use the command \\[mh-mml-unsecure-message] to remove
this tag. Use a prefix argument METHOD to be prompted for one of
the possible security methods (see `mh-mml-method-default').

\(fn METHOD)" t nil)

(autoload (quote mh-mml-secure-message-encrypt) "mh-mime" "\
Add tag to encrypt the message.

A proper multipart message is created for you when you send the
message. Use the command \\[mh-mml-unsecure-message] to remove
this tag. Use a prefix argument METHOD to be prompted for one of
the possible security methods (see `mh-mml-method-default').

\(fn METHOD)" t nil)

(autoload (quote mh-mml-secure-message-signencrypt) "mh-mime" "\
Add tag to encrypt and sign the message.

A proper multipart message is created for you when you send the
message. Use the command \\[mh-mml-unsecure-message] to remove
this tag. Use a prefix argument METHOD to be prompted for one of
the possible security methods (see `mh-mml-method-default').

\(fn METHOD)" t nil)

(autoload (quote mh-mml-tag-present-p) "mh-mime" "\
Check if the current buffer has text which may be a MML tag.

\(fn)" nil nil)

(autoload (quote mh-mime-cleanup) "mh-mime" "\
Free the decoded MIME parts.

\(fn)" nil nil)

(autoload (quote mh-destroy-postponed-handles) "mh-mime" "\
Free MIME data for externally displayed MIME parts.

\(fn)" nil nil)

(autoload (quote mh-add-missing-mime-version-header) "mh-mime" "\
Some mail programs don't put a MIME-Version header.
I have seen this only in spam, so maybe we shouldn't fix
this ;-)

\(fn)" nil nil)

(autoload (quote mh-display-smileys) "mh-mime" "\
Display smileys.

\(fn)" nil nil)

(autoload (quote mh-display-emphasis) "mh-mime" "\
Display graphical emphasis.

\(fn)" nil nil)

(autoload (quote mh-mime-save-parts) "mh-mime" "\
Save attachments.

You can save all of the attachments at once with this command.
The attachments are saved in the directory specified by the
option `mh-mime-save-parts-default-directory' unless you use a
prefix argument PROMPT in which case you are prompted for the
directory. These directories may be superseded by MH profile
components, since this function calls on \"mhstore\" (\"mhn\") to
do the work.

\(fn PROMPT)" t nil)

(autoload (quote mh-toggle-mh-decode-mime-flag) "mh-mime" "\
Toggle the value of `mh-decode-mime-flag'.

\(fn)" t nil)

(autoload (quote mh-decode-message-header) "mh-mime" "\
Decode RFC2047 encoded message header fields.

\(fn)" nil nil)

(autoload (quote mh-mime-display) "mh-mime" "\
Display (and possibly decode) MIME handles.
Optional argument, PRE-DISSECTED-HANDLES is a list of MIME
handles. If present they are displayed otherwise the buffer is
parsed and then displayed.

\(fn &optional PRE-DISSECTED-HANDLES)" nil nil)

(autoload (quote mh-press-button) "mh-mime" "\
View contents of button.

This command is a toggle so if you use it again on the same
attachment, the attachment is hidden.

\(fn)" t nil)

(autoload (quote mh-push-button) "mh-mime" "\
Click MIME button for EVENT.

If the MIME part is visible then it is removed. Otherwise the
part is displayed. This function is called when the mouse is used
to click the MIME button.

\(fn EVENT)" t nil)

(autoload (quote mh-mime-save-part) "mh-mime" "\
Save MIME part at point.

\(fn)" t nil)

(autoload (quote mh-mime-inline-part) "mh-mime" "\
Toggle display of the raw MIME part.

\(fn)" t nil)

(autoload (quote mh-display-with-external-viewer) "mh-mime" "\
View attachment externally.

If Emacs does not know how to view an attachment, you could save
it into a file and then run some program to open it. It is
easier, however, to launch the program directly from MH-E with
this command. While you'll most likely use this to view
spreadsheets and documents, it is also useful to use your browser
to view HTML attachments with higher fidelity than what Emacs can
provide.

This command displays the attachment associated with the button
under the cursor. If the cursor is not located over a button,
then the cursor first moves to the next button, wrapping to the
beginning of the message if necessary. You can provide a numeric
prefix argument PART-INDEX to view the attachment labeled with
that number.

This command tries to provide a reasonable default for the viewer
by calling the Emacs function `mailcap-mime-info'. This function
usually reads the file \"/etc/mailcap\".

\(fn PART-INDEX)" t nil)

;;;***

;;;### (autoloads (mh-do-search mh-pick-do-search mh-search-folder)
;;;;;;  "mh-pick" "mh-pick.el" (17350 5277))
;;; Generated autoloads from mh-pick.el

(autoload (quote mh-search-folder) "mh-pick" "\
Search FOLDER for messages matching a pattern.

With this command, you can search a folder for messages to or
from a particular person or about a particular subject. In fact,
you can also search for messages containing selected strings in
any arbitrary header field or any string found within the
messages.

You are first prompted for the name of the folder to search and
then placed in the following buffer in MH-Pick mode:

     From:
     To:
     Cc:
     Date:
     Subject:
     --------

Edit this template by entering your search criteria in an
appropriate header field that is already there, or create a new
field yourself. If the string you're looking for could be
anywhere in a message, then place the string underneath the row
of dashes. The command \\[mh-search-folder] uses the MH command
\"pick\" to do the real work.

There are no semantics associated with the search criteria--they
are simply treated as strings. Case is ignored when all lowercase
is used, and regular expressions (a la \"ed\") are available. It
is all right to specify several search criteria. What happens
then is that a logical _and_ of the various fields is performed.
If you prefer a logical _or_ operation, run \\[mh-search-folder]
multiple times.

As an example, let's say that we want to find messages from
Ginnean about horseback riding in the Kosciusko National
Park (Australia) during January, 1994. Normally we would start
with a broad search and narrow it down if necessary to produce a
manageable amount of data, but we'll cut to the chase and create
a fairly restrictive set of criteria as follows:

     From: ginnean
     To:
     Cc:
     Date: Jan 1994
     Subject: horse.*kosciusko
     --------

As with MH-Letter mode, MH-Pick provides commands like
\\<mh-pick-mode-map>\\[mh-to-field] to help you fill in the
blanks.

To perform the search, type \\[mh-do-search]. The selected
messages are placed in the \"search\" sequence, which you can use
later in forwarding, printing, or narrowing your field of view.
Subsequent searches are appended to the \"search\" sequence. If,
however, you wish to start with a clean slate, first delete the
\"search\" sequence.

If you're searching in a folder that is already displayed in an
MH-Folder buffer, only those messages contained in the buffer are
used for the search. Therefore, if you want to search in all
messages, first kill the folder's buffer with
\\<mh-folder-mode-map>\\[kill-buffer] or scan the entire folder
with \\[mh-rescan-folder].

If you find that you do the same thing over and over when editing
the search template, you may wish to bind some shortcuts to keys.
This can be done with the variable `mh-pick-mode-hook', which is
called when \\[mh-search-folder] is run on a new pattern.

If you have run the \\[mh-index-search] command, but change your
mind while entering the search criteria and actually want to run
a regular search, then you can use the command
\\<mh-pick-mode-map>\\[mh-pick-do-search] in the MH-Pick buffer.

In a program, argument WINDOW-CONFIG is the current window
configuration and is used when the search folder is dismissed.

\(fn FOLDER WINDOW-CONFIG)" t nil)

(autoload (quote mh-pick-do-search) "mh-pick" "\
Find messages that match the qualifications in the current pattern buffer.

Messages are searched for in the folder named in
`mh-searching-folder'. Add the messages found to the sequence
named \"search\".

\(fn)" t nil)

(autoload (quote mh-do-search) "mh-pick" "\
Use the default searching function.

If \\[mh-search-folder] was used to create the search pattern
then pick is used to search the folder. Otherwise if
\\[mh-index-search] was used then the indexing program specified
in `mh-index-program' is used.

\(fn)" t nil)

;;;***

;;;### (autoloads (mh-print-msg mh-ps-print-toggle-color mh-ps-print-toggle-faces
;;;;;;  mh-ps-print-msg-file mh-ps-print-msg) "mh-print" "mh-print.el"
;;;;;;  (17350 4091))
;;; Generated autoloads from mh-print.el

(autoload (quote mh-ps-print-msg) "mh-print" "\
Print RANGE\\<mh-folder-mode-map>.

Check the documentation of `mh-interactive-range' to see how RANGE is
read in interactive use.

This command will print inline text attachments but will not decrypt
messages. However, when a message is displayed in an MH-Show buffer,
then that buffer is used verbatim for printing with the caveat that
only text attachments, if opened inline, are printed. Therefore,
encrypted messages can be printed by showing and decrypting them
first.

MH-E uses the \"ps-print\" package to do the printing, so you can
customize the printing further by going to the `ps-print'
customization group. This command does not use the options
`mh-lpr-command-format' or `mh-print-background-flag'. See also the
commands \\[mh-ps-print-toggle-color] and
\\[mh-ps-print-toggle-faces].

\(fn RANGE)" t nil)

(autoload (quote mh-ps-print-msg-file) "mh-print" "\
Print RANGE to FILE\\<mh-folder-mode-map>.

Check the documentation of `mh-interactive-range' to see how RANGE is
read in interactive use.

This command will print inline text attachments but will not decrypt
messages. However, when a message is displayed in an MH-Show buffer,
then that buffer is used verbatim for printing with the caveat that
only text attachments, if opened inline, are printed. Therefore,
encrypted messages can be printed by showing and decrypting them
first.

MH-E uses the \"ps-print\" package to do the printing, so you can
customize the printing further by going to the `ps-print'
customization group. This command does not use the options
`mh-lpr-command-format' or `mh-print-background-flag'. See also the
commands \\[mh-ps-print-toggle-color] and
\\[mh-ps-print-toggle-faces].

\(fn RANGE FILE)" t nil)

(autoload (quote mh-ps-print-toggle-faces) "mh-print" "\
Toggle whether printing is done with faces or not.

When faces are enabled, the printed message will look very
similar to the message in the MH-Show buffer.

\(fn)" t nil)

(autoload (quote mh-ps-print-toggle-color) "mh-print" "\
Toggle whether color is used in printing messages.

Colors are emulated on black-and-white printers with shades of
gray. This might produce illegible output, even if your screen
colors only use shades of gray. If this is the case, try using
this command to toggle between color, no color, and a black and
white representation of the colors and see which works best. You
change this setting permanently by customizing the option
`ps-print-color-p'.

\(fn)" t nil)

(autoload (quote mh-print-msg) "mh-print" "\
Print RANGE the old fashioned way\\<mh-folder-mode-map>.

The message is formatted with \"mhl\" (see option
`mh-mhl-format-file') and printed with the \"lpr\" command (see
option `mh-lpr-command-format').

Check the documentation of `mh-interactive-range' to see how
RANGE is read in interactive use.

Consider using \\[mh-ps-print-msg] instead.

\(fn RANGE)" t nil)

;;;***

;;;### (autoloads (mh-narrow-to-tick mh-toggle-tick mh-thread-refile
;;;;;;  mh-thread-delete mh-thread-ancestor mh-thread-previous-sibling
;;;;;;  mh-thread-next-sibling mh-thread-forget-message mh-toggle-threads
;;;;;;  mh-thread-add-spaces mh-thread-update-scan-line-map mh-thread-inc
;;;;;;  mh-delete-subject-or-thread mh-delete-subject mh-narrow-to-range
;;;;;;  mh-narrow-to-to mh-narrow-to-cc mh-narrow-to-from mh-narrow-to-subject
;;;;;;  mh-interactive-range mh-range-to-msg-list mh-iterate-on-range
;;;;;;  mh-iterate-on-messages-in-region mh-add-to-sequence mh-notate-cur
;;;;;;  mh-rename-seq mh-translate-range mh-read-range mh-read-seq-default
;;;;;;  mh-notate-deleted-and-refiled mh-widen mh-put-msg-in-seq
;;;;;;  mh-narrow-to-seq mh-msg-is-in-seq mh-list-sequences mh-delete-seq)
;;;;;;  "mh-seq" "mh-seq.el" (17350 5277))
;;; Generated autoloads from mh-seq.el

(autoload (quote mh-delete-seq) "mh-seq" "\
Delete SEQUENCE.

You are prompted for the sequence to delete. Note that this
deletes only the sequence, not the messages in the sequence. If
you want to delete the messages, use \"\\[universal-argument]
\\[mh-delete-msg]\".

\(fn SEQUENCE)" t nil)

(autoload (quote mh-list-sequences) "mh-seq" "\
List all sequences in folder.

The list appears in a buffer named \"*MH-E Sequences*\".

\(fn)" t nil)

(autoload (quote mh-msg-is-in-seq) "mh-seq" "\
Display the sequences in which the current message appears.

Use a prefix argument to display the sequences in which another
MESSAGE appears.

\(fn MESSAGE)" t nil)

(autoload (quote mh-narrow-to-seq) "mh-seq" "\
Restrict display to messages in SEQUENCE.

You are prompted for the name of the sequence. What this command
does is show only those messages that are in the selected
sequence in the MH-Folder buffer. In addition, it limits further
MH-E searches to just those messages.

When you want to widen the view to all your messages again, use
\\[mh-widen].

\(fn SEQUENCE)" t nil)

(autoload (quote mh-put-msg-in-seq) "mh-seq" "\
Add RANGE to SEQUENCE\\<mh-folder-mode-map>.

To place a message in a sequence, use this command to do it
manually, or use the MH command \"pick\" or the MH-E version of
\"pick\", \\[mh-search-folder], which create a sequence
automatically.

Give this command a RANGE and you can add all the messages in a
sequence to another sequence (for example,
\"\\[universal-argument] \\[mh-put-msg-in-seq] SourceSequence RET
DestSequence RET\"). Check the documentation of
`mh-interactive-range' to see how RANGE is read in interactive
use.

\(fn RANGE SEQUENCE)" t nil)

(autoload (quote mh-widen) "mh-seq" "\
Remove last restriction.

Each limit or sequence restriction can be undone in turn with
this command. Give this command a prefix argument ALL-FLAG to
remove all limits and sequence restrictions.

\(fn &optional ALL-FLAG)" t nil)

(autoload (quote mh-notate-deleted-and-refiled) "mh-seq" "\
Notate messages marked for deletion or refiling.
Messages to be deleted are given by `mh-delete-list' while
messages to be refiled are present in `mh-refile-list'.

\(fn)" nil nil)

(autoload (quote mh-read-seq-default) "mh-seq" "\
Read and return sequence name with default narrowed or previous sequence.
PROMPT is the prompt to use when reading. If NOT-EMPTY is non-nil
then a non-empty sequence is read.

\(fn PROMPT NOT-EMPTY)" nil nil)

(autoload (quote mh-read-range) "mh-seq" "\
Read a message range with PROMPT.

If FOLDER is non-nil then a range is read from that folder, otherwise
use `mh-current-folder'.

If DEFAULT is a string then use that as default range to return. If
DEFAULT is nil then ask user with default answer a range based on the
sequences that seem relevant. Finally if DEFAULT is t, try to avoid
prompting the user. Unseen messages, if present, are returned. If the
folder has fewer than `mh-large-folder' messages then \"all\" messages
are returned. Finally as a last resort prompt the user.

If EXPAND-FLAG is non-nil then a list of message numbers corresponding
to the input is returned. If this list is empty then an error is
raised. If EXPAND-FLAG is nil just return the input string. In this
case we don't check if the range is empty.

If ASK-FLAG is non-nil, then the user is always queried for a range of
messages. If ASK-FLAG is nil, then the function checks if the unseen
sequence is non-empty. If that is the case, `mh-unseen-seq', or the
list of messages in it depending on the value of EXPAND, is returned.
Otherwise if the folder has fewer than `mh-large-folder' messages then
the list of messages corresponding to \"all\" is returned. If neither
of the above holds then as a last resort the user is queried for a
range of messages.

If NUMBER-AS-RANGE-FLAG is non-nil, then if a number, N is read as
input, it is interpreted as the range \"last:N\".

This function replaces the existing function `mh-read-msg-range'.
Calls to:

  (mh-read-msg-range folder flag)

should be replaced with:

  (mh-read-range \"Suitable prompt\" folder t nil flag
                 mh-interpret-number-as-range-flag)

\(fn PROMPT &optional FOLDER DEFAULT EXPAND-FLAG ASK-FLAG NUMBER-AS-RANGE-FLAG)" nil nil)

(autoload (quote mh-translate-range) "mh-seq" "\
In FOLDER, translate the string EXPR to a list of messages numbers.

\(fn FOLDER EXPR)" nil nil)

(autoload (quote mh-rename-seq) "mh-seq" "\
Rename SEQUENCE to have NEW-NAME.

\(fn SEQUENCE NEW-NAME)" t nil)

(autoload (quote mh-notate-cur) "mh-seq" "\
Mark the MH sequence cur.
In addition to notating the current message with `mh-note-cur'
the function uses `overlay-arrow-position' to put a marker in the
fringe.

\(fn)" nil nil)

(autoload (quote mh-add-to-sequence) "mh-seq" "\
The sequence SEQ is augmented with the messages in MSGS.

\(fn SEQ MSGS)" nil nil)

(autoload (quote mh-iterate-on-messages-in-region) "mh-seq" "\
Iterate over region.

VAR is bound to the message on the current line as we loop
starting from BEGIN till END. In each step BODY is executed.

If VAR is nil then the loop is executed without any binding.

\(fn VAR BEGIN END &rest BODY)" nil (quote macro))

(autoload (quote mh-iterate-on-range) "mh-seq" "\
Iterate an operation over a region or sequence.

VAR is bound to each message in turn in a loop over RANGE, which
can be a message number, a list of message numbers, a sequence, a
region in a cons cell, or a MH range (something like last:20) in
a string. In each iteration, BODY is executed.

The parameter RANGE is usually created with
`mh-interactive-range' in order to provide a uniform interface to
MH-E functions.

\(fn VAR RANGE &rest BODY)" nil (quote macro))

(autoload (quote mh-range-to-msg-list) "mh-seq" "\
Return a list of messages for RANGE.

Check the documentation of `mh-interactive-range' to see how
RANGE is read in interactive use.

\(fn RANGE)" nil nil)

(autoload (quote mh-interactive-range) "mh-seq" "\
Return interactive specification for message, sequence, range or region.
By convention, the name of this argument is RANGE.

If variable `transient-mark-mode' is non-nil and the mark is active,
then this function returns a cons-cell of the region.

If optional prefix argument is provided, then prompt for message range
with RANGE-PROMPT. A list of messages in that range is returned.

If a MH range is given, say something like last:20, then a list
containing the messages in that range is returned.

If DEFAULT non-nil then it is returned.

Otherwise, the message number at point is returned.

This function is usually used with `mh-iterate-on-range' in order to
provide a uniform interface to MH-E functions.

\(fn RANGE-PROMPT &optional DEFAULT)" nil nil)

(autoload (quote mh-narrow-to-subject) "mh-seq" "\
Limit to messages with same subject.
With a prefix argument, edit PICK-EXPR.

Use \\<mh-folder-mode-map>\\[mh-widen] to undo this command.

\(fn &optional PICK-EXPR)" t nil)

(autoload (quote mh-narrow-to-from) "mh-seq" "\
Limit to messages with the same \"From:\" field.
With a prefix argument, edit PICK-EXPR.

Use \\<mh-folder-mode-map>\\[mh-widen] to undo this command.

\(fn &optional PICK-EXPR)" t nil)

(autoload (quote mh-narrow-to-cc) "mh-seq" "\
Limit to messages with the same \"Cc:\" field.
With a prefix argument, edit PICK-EXPR.

Use \\<mh-folder-mode-map>\\[mh-widen] to undo this command.

\(fn &optional PICK-EXPR)" t nil)

(autoload (quote mh-narrow-to-to) "mh-seq" "\
Limit to messages with the same \"To:\" field.
With a prefix argument, edit PICK-EXPR.

Use \\<mh-folder-mode-map>\\[mh-widen] to undo this command.

\(fn &optional PICK-EXPR)" t nil)

(autoload (quote mh-narrow-to-range) "mh-seq" "\
Limit to RANGE.

Check the documentation of `mh-interactive-range' to see how
RANGE is read in interactive use.

Use \\<mh-folder-mode-map>\\[mh-widen] to undo this command.

\(fn RANGE)" t nil)

(autoload (quote mh-delete-subject) "mh-seq" "\
Delete messages with same subject\\<mh-folder-mode-map>.

To delete messages faster, you can use this command to delete all
the messages with the same subject as the current message. This
command puts these messages in a sequence named \"subject\". You
can undo this action by using \\[mh-undo] with a prefix argument
and then specifying the \"subject\" sequence.

\(fn)" t nil)

(autoload (quote mh-delete-subject-or-thread) "mh-seq" "\
Delete messages with same subject or thread\\<mh-folder-mode-map>.

To delete messages faster, you can use this command to delete all
the messages with the same subject as the current message. This
command puts these messages in a sequence named \"subject\". You
can undo this action by using \\[mh-undo] with a prefix argument
and then specifying the \"subject\" sequence.

However, if the buffer is displaying a threaded view of the
folder then this command behaves like \\[mh-thread-delete].

\(fn)" t nil)

(autoload (quote mh-thread-inc) "mh-seq" "\
Update thread tree for FOLDER.
All messages after START-POINT are added to the thread tree.

\(fn FOLDER START-POINT)" nil nil)

(autoload (quote mh-thread-update-scan-line-map) "mh-seq" "\
In threaded view update `mh-thread-scan-line-map'.
MSG is the message being notated with NOTATION at OFFSET.

\(fn MSG NOTATION OFFSET)" nil nil)

(autoload (quote mh-thread-add-spaces) "mh-seq" "\
Add COUNT spaces to each scan line in `mh-thread-scan-line-map'.

\(fn COUNT)" nil nil)

(autoload (quote mh-toggle-threads) "mh-seq" "\
Toggle threaded view of folder.

\(fn)" t nil)

(autoload (quote mh-thread-forget-message) "mh-seq" "\
Forget the message INDEX from the threading tables.

\(fn INDEX)" nil nil)

(autoload (quote mh-thread-next-sibling) "mh-seq" "\
Display next sibling.

With non-nil optional argument PREVIOUS-FLAG jump to the previous
sibling.

\(fn &optional PREVIOUS-FLAG)" t nil)

(autoload (quote mh-thread-previous-sibling) "mh-seq" "\
Display previous sibling.

\(fn)" t nil)

(autoload (quote mh-thread-ancestor) "mh-seq" "\
Display ancestor of current message.

If you do not care for the way a particular thread has turned,
you can move up the chain of messages with this command. This
command can also take a prefix argument THREAD-ROOT-FLAG to jump
to the message that started everything.

\(fn &optional THREAD-ROOT-FLAG)" t nil)

(autoload (quote mh-thread-delete) "mh-seq" "\
Delete thread.

\(fn)" t nil)

(autoload (quote mh-thread-refile) "mh-seq" "\
Refile (output) thread into FOLDER.

\(fn FOLDER)" t nil)

(autoload (quote mh-toggle-tick) "mh-seq" "\
Toggle tick mark of RANGE.

This command adds messages to the \"tick\" sequence (which you can customize
via the option `mh-tick-seq'). This sequence can be viewed later with the
\\[mh-index-ticked-messages] command.

Check the documentation of `mh-interactive-range' to see how RANGE is read in
interactive use.

\(fn RANGE)" t nil)

(autoload (quote mh-narrow-to-tick) "mh-seq" "\
Limit to ticked messages.

What this command does is show only those messages that are in
the \"tick\" sequence (which you can customize via the
`mh-tick-seq' option) in the MH-Folder buffer. In addition, it
limits further MH-E searches to just those messages. When you
want to widen the view to all your messages again, use
\\[mh-widen].

\(fn)" t nil)

;;;***

;;;### (autoloads (mh-speed-add-folder mh-speed-invalidate-map mh-speed-flists
;;;;;;  mh-speed-view mh-speed-toggle mh-folder-speedbar-buttons)
;;;;;;  "mh-speed" "mh-speed.el" (17350 4091))
;;; Generated autoloads from mh-speed.el

(autoload (quote mh-folder-speedbar-buttons) "mh-speed" "\
Interface function to create MH-E speedbar buffer.
BUFFER is the MH-E buffer for which the speedbar buffer is to be
created.

\(fn BUFFER)" nil nil)

(defalias (quote mh-show-speedbar-buttons) (quote mh-folder-speedbar-buttons))

(defalias (quote mh-letter-speedbar-buttons) (quote mh-folder-speedbar-buttons))

(autoload (quote mh-speed-toggle) "mh-speed" "\
Toggle the display of child folders in the speedbar.
The optional ARGS from speedbar are ignored.

\(fn &rest ARGS)" t nil)

(autoload (quote mh-speed-view) "mh-speed" "\
Visits the selected folder just as if you had used \\<mh-folder-mode-map>\\[mh-visit-folder].
The optional ARGS from speedbar are ignored.

\(fn &rest ARGS)" t nil)

(autoload (quote mh-speed-flists) "mh-speed" "\
Execute flists -recurse and update message counts.
If FORCE is non-nil the timer is reset.

Any number of optional FOLDERS can be specified. If specified,
flists is run only for that one folder.

\(fn FORCE &rest FOLDERS)" t nil)

(autoload (quote mh-speed-invalidate-map) "mh-speed" "\
Remove FOLDER from various optimization caches.

\(fn FOLDER)" t nil)

(autoload (quote mh-speed-add-folder) "mh-speed" "\
Add FOLDER since it is being created.
The function invalidates the latest ancestor that is present.

\(fn FOLDER)" nil nil)

;;;***

;;;### (autoloads nil nil ("mh-acros.el" "mh-buffers.el" "mh-customize.el"
;;;;;;  "mh-e.el" "mh-gnus.el" "mh-utils.el") (17350 9105 559763))

;;;***

;;;### (autoloads (mh-alias-apropos mh-alias-add-address-under-point
;;;;;;  mh-alias-grab-from-field mh-alias-add-alias mh-alias-for-from-p
;;;;;;  mh-alias-address-to-alias mh-alias-letter-expand-alias mh-alias-minibuffer-confirm-address
;;;;;;  mh-read-address mh-alias-reload-maybe mh-alias-reload) "mh-alias"
;;;;;;  "mh-alias.el" (17350 5277))
;;; Generated autoloads from mh-alias.el

(autoload (quote mh-alias-reload) "mh-alias" "\
Reload MH aliases.

Since aliases are updated frequently, MH-E reloads aliases
automatically whenever an alias lookup occurs if an alias source has
changed. Sources include files listed in your \"Aliasfile:\" profile
component and your password file if option `mh-alias-local-users' is
turned on. However, you can reload your aliases manually by calling
this command directly.

This function runs `mh-alias-reloaded-hook' after the aliases have
been loaded.

\(fn)" t nil)

(autoload (quote mh-alias-reload-maybe) "mh-alias" "\
Load new MH aliases.

\(fn)" nil nil)

(autoload (quote mh-read-address) "mh-alias" "\
Read an address from the minibuffer with PROMPT.

\(fn PROMPT)" nil nil)

(autoload (quote mh-alias-minibuffer-confirm-address) "mh-alias" "\
Display the alias expansion if `mh-alias-flash-on-comma' is non-nil.

\(fn)" t nil)

(autoload (quote mh-alias-letter-expand-alias) "mh-alias" "\
Expand mail alias before point.

\(fn)" nil nil)

(autoload (quote mh-alias-address-to-alias) "mh-alias" "\
Return the ADDRESS alias if defined, or nil.

\(fn ADDRESS)" nil nil)

(autoload (quote mh-alias-for-from-p) "mh-alias" "\
Return t if sender's address has a corresponding alias.

\(fn)" nil nil)

(autoload (quote mh-alias-add-alias) "mh-alias" "\
Add ALIAS for ADDRESS in personal alias file.

This function prompts you for an alias and address. If the alias
exists already, you will have the choice of inserting the new
alias before or after the old alias. In the former case, this
alias will be used when sending mail to this alias. In the latter
case, the alias serves as an additional folder name hint when
filing messages.

\(fn ALIAS ADDRESS)" t nil)

(autoload (quote mh-alias-grab-from-field) "mh-alias" "\
Add alias for the sender of the current message.

\(fn)" t nil)

(autoload (quote mh-alias-add-address-under-point) "mh-alias" "\
Insert an alias for address under point.

\(fn)" t nil)

(autoload (quote mh-alias-apropos) "mh-alias" "\
Show all aliases or addresses that match a regular expression REGEXP.

\(fn REGEXP)" t nil)

;;;***

(provide 'mh-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; mh-loaddefs.el ends here
