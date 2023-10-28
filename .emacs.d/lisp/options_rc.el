;;; options_rc.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; This is options configuration
;;; Code:

;; (scroll-bar-mode -1)
;; (tool-bar-mode -1)
(tooltip-mode t)
;; (menu-bar-mode -1)

;; Use no-littering to automatically set common paths to the new user-emacs-directory
(use-package no-littering)

(undo-fu-session-global-mode)

(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(setq frame-resize-pixelwise t)

(setq cursor-in-non-selected-windows nil)

;; Don't pop up UI dialogs when prompting
(setq use-dialog-box nil)

(global-auto-revert-mode 1)
(delete-selection-mode +1)
(setq inhibit-startup-screen t)
(setq global-auto-revert-non-file-buffers t)

;; (load (expand-file-name "~/.quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

(defun ct/kill-buffer--possibly-save--advice (original-function &rest args)
  "Ask user in the minibuffer whether to save before killing.

  Replaces `kill-buffer--possibly-save' as advice, so
  ORIGINAL-FUNCTION is unused and never delegated to. Its first
  parameter is the buffer, which is the `car' or ARGS."
  (let ((buffer (car args))
        (response
         (car
          (read-multiple-choice
           (format "Buffer %s modified."
                   (buffer-name))
           '((?s "Save and kill buffer" "save the buffer and then kill it")
             (?d "Discard and kill buffer without saving" "kill buffer without saving")
             (?c "Cancel" "Exit without doing anything"))
           nil nil (and (not use-short-answers)
                        (not (use-dialog-box-p)))))))
    (cond ((equal response ?s)
           (progn
             (with-current-buffer buffer
               (save-buffer))
             t))
          ((equal response ?d)
           t)
          ((equal response ?c)
           nil)
          )))

(advice-add 'kill-buffer--possibly-save :around #'ct/kill-buffer--possibly-save--advice)

;; Yes or No
(defun yes-or-no-p->-y-or-n-p (orig-fun &rest r)
  (cl-letf (((symbol-function 'yes-or-no-p) #'y-or-n-p))
    (apply orig-fun r)))

(advice-add 'projectile-kill-buffers :around #'yes-or-no-p->-y-or-n-p)
(advice-add 'project-kill-buffers :around #'yes-or-no-p->-y-or-n-p)

(setq switch-to-buffer-obey-display-actions t
      switch-to-buffer-in-dedicated-window 'pop)

;; Showing buffer in a side window
(defun ct/show-buffer-in-bottom-split ()
  (interactive)
  (let ((consult--buffer-display (lambda (buffer &rest args)
                                   (display-buffer-in-side-window buffer '((side . bottom) (slot . 0) (dedicated . t) (height . 10))))))
    (call-interactively #'consult-buffer)))

(setq ibuffer-saved-filter-groups
      `(("default"
         ("mail" (or
                  (mode . message-mode)
                  (mode . notmuch-hello-mode)
                  (mode . notmuch-search-mode)
                  (mode . notmuch-message-mode)
                  (mode . notmuch-show-mode)
                  (mode . notmuch-tree-mode)
                  (mode . bbdb-mode)
                  (mode . mail-mode)
                  (mode . mu4e-main-mode)
                  (mode . gnus-group-mode)
                  (mode . gnus-summary-mode)
                  (mode . gnus-article-mode)
                  (name . "^\\..bdb$")))
         ("org" (or
                 (mode . org-agenda-mode)
                 (mode . diary-mode)
                 (name . "^\\*Calendar\\*$")
                 (name . "^diary$")
                 (filename . "Pending/org/")))
         ("dired" (mode . dired-mode))
         ("emacs" (or
                   (name . "^\\*package.*results\\*$")
                   (name . "^\\*Shell.*Output\\*$")
                   (name . "^\\*Compile-Log\\*$")
                   (name . "^\\*Completions\\*$")
                   (name . "^\\*Backtrace\\*$")
                   (name . "^\\*dashboard\\*$")
                   (name . "^\\*Messages\\*$")
                   (name . "^\\*scratch\\*$")
                   (name . "^\\*Appointment Alert\\*$")
                   (name . "^\\*info\\*$")
                   (name . "^\\*Help\\*$")))
         )))
(defun ct/ibuffer-enable-saved-filter-groups ()
  (ibuffer-switch-to-saved-filter-groups "default"))

(add-hook 'ibuffer-mode-hook #'ct/ibuffer-enable-saved-filter-groups)

;; Move focus to new window after manual splitting
(defun ct/split-window-below (arg)
  (interactive "P")
  (split-window-below arg)
  (other-window 1))
(defun ct/split-window-right (arg)
  (interactive "P")
  (split-window-right arg)
  (other-window 1))
(global-set-key [remap split-window-below] #'ct/split-window-below)
(global-set-key [remap split-window-right] #'ct/split-window-right)

;; Save silently
(setq save-silently t)

;; Dired

;; Enable using a to open the selected file/directory and exit the current buffer,
;; instead of pushing another buffer on top of the stack
(put 'dired-find-alternate-file 'disabled nil)

;; Notable shortcuts:
;;     <a> to open directory and bury current buffer
;;     <W> for browse-url-of-dired-file will open the system default application
;;     <w> will enter wdired for text-based changes
(setq dired-dwim-target t)

;; Numberline
;; (global-display-line-numbers-mode 1)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		treemacs-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq help-window-select t)

;;; Emms

(defun track-title-from-file-name (file)
  "For using with EMMS description functions. Extracts the track
title from the file name FILE, which just means a) taking only
the file component at the end of the path, and b) removing any
file extension."
  (with-temp-buffer
    (save-excursion (insert (file-name-nondirectory (directory-file-name file))))
    (ignore-error 'search-failed
      (search-forward-regexp (rx "." (+ alnum) eol))
      (delete-region (match-beginning 0) (match-end 0)))
    (buffer-string)))

(defun my-emms-track-description (track)
  "Return a description of TRACK, for EMMS, but try to cut just
the track name from the file name, and just use the file name too
rather than the whole path."
  (let ((artist (emms-track-get track 'info-artist))
        (title (emms-track-get track 'info-title)))
    (cond ((and artist title)
           ;; Converting the artist/title to a string works around a bug in `emms-info-exiftool'
           ;; where, if your track name is a number, e.g. "1999" by Jeroen Tel, then it will be an
           ;; integer type here, confusing everything.
           ;;
           ;; I would fix the bug properly and submit a patch but I just cannot be bothered to
           ;; figure out how to do that.
           (concat (format "%s" artist) " - " (format "%s" title)))
          (title title)
          ((eq (emms-track-type track) 'file)
           (track-title-from-file-name (emms-track-name track)))
          (t (emms-track-simple-description track)))))

(setq emms-track-description-function 'my-emms-track-description)

;;; Style dispatchers

(defun prot-orderless-literal (word _index _total)
  "Read WORD= as a literal string."
  (when (string-suffix-p "=" word)
    ;; The `orderless-literal' is how this should be treated by
    ;; orderless.  The `substring' form omits the `=' from the
    ;; pattern.
    `(orderless-literal . ,(substring word 0 -1))))

(defun prot-orderless-file-ext (word _index _total)
  "Expand WORD. to a file suffix when completing file names."
  (when (and minibuffer-completing-file-name
             (string-suffix-p "." word))
    `(orderless-regexp . ,(format "\\.%s\\'" (substring word 0 -1)))))

(defun prot-orderless-beg-or-end (word _index _total)
  "Expand WORD~ to \\(^WORD\\|WORD$\\)."
  (when-let (((string-suffix-p "~" word))
             (word (substring word 0 -1)))
    `(orderless-regexp . ,(format "\\(^%s\\|%s$\\)" word word))))

(defun just-one-face (fn &rest args)
  (let ((orderless-match-faces [completions-common-part]))
    (apply fn args)))

(advice-add 'company-capf--candidates :around #'just-one-face)

;;; Treesit langs
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
	(cmake "https://github.com/uyha/tree-sitter-cmake")
	(css "https://github.com/tree-sitter/tree-sitter-css")
	(elisp "https://github.com/Wilfred/tree-sitter-elisp")
	(go "https://github.com/tree-sitter/tree-sitter-go")
	(html "https://github.com/tree-sitter/tree-sitter-html")
	(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
	(json "https://github.com/tree-sitter/tree-sitter-json")
	(make "https://github.com/alemuller/tree-sitter-make")
	(markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(python "https://github.com/tree-sitter/tree-sitter-python")
	(toml "https://github.com/tree-sitter/tree-sitter-toml")
	(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

;;; Golang
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/go/bin"))
(add-to-list 'exec-path "/home/pingvi/go/bin")

(provide 'options_rc)
;;; options_rc.el ends here
