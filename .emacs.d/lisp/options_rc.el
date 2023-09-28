;;; options_rc.el --- -*- lexical-binding: t -*-
;;; Commentary:
;; This is options configuration
;;; Code:

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode t)
(menu-bar-mode -1)

(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(setq frame-resize-pixelwise nil)
(setq cursor-in-non-selected-windows nil)

;; let's enable it for all programming major modes
;; (add-hook 'prog-mode-hook #'hl-line-mode)
;; and for all modes derived from text-mode
;; (add-hook 'text-mode-hook #'hl-line-mode)

(global-auto-revert-mode 1)
(delete-selection-mode +1)
(setq initial-buffer-choice 'recentf-open-files)

(setq global-auto-revert-non-file-buffers t)

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

;; Modify the default ibuffer column format
(setq ibuffer-formats
      '((mark modified read-only locked " "
	      (name 20 20 :left :elide)
	      " "
	      (mode 16 16 :left :elide)
	      " "
	      filename-and-process)
	(mark " "
	      (name 16 -1)
	      " " filename)))

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

;; Close Emacs safely
;; (defun ct/clean-exit ()
;;   "Exit Emacs cleanly.
;; If there are unsaved buffer, pop up a list for them to be saved
;; before existing. Replaces ‘save-buffers-kill-terminal’."
;;   (interactive)
;;   (if (frame-parameter nil 'client)
;;       (server-save-buffers-kill-terminal arg)
;;     (if-let ((buf-list (seq-filter (lambda (buf)
;;                                      (and (buffer-modified-p buf)
;;                                           (buffer-file-name buf)))
;;                                    (buffer-list))))
;;         (progn
;;           (pop-to-buffer (list-buffers-noselect t buf-list))
;;           (message "s to save, C-k to kill, x to execute"))
;;       (save-buffers-kill-emacs))))
;; (global-set-key [remap save-buffers-kill-terminal] #'ct/clean-exit)

;; ;; tab-bar color overrides so it’s less noise up there
;; (defun ct/modus-themes-tab-bar-colors ()
;;   "Override tab faces to have even less variety."
;;   (modus-themes-with-colors
;;     (custom-set-faces
;;      `(tab-bar ((,c
;;                  :height 0.8
;;                  :background ,bg-main
;;                  :box nil)))
;;      `(tab-bar-tab ((,c
;;                      :background ,bg-main
;;                      :underline (:color ,blue-intense :style line)
;;                      :box (:line-width 2 :style flat-button))))
;;      `(tab-bar-tab-inactive ((,c
;;                               :background ,bg-main
;;                               :box (:line-width 2 :style flat-button)))))))
;; (add-hook 'modus-themes-after-load-theme-hook #'ct/modus-themes-tab-bar-colors)

;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))

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
(global-display-line-numbers-mode 1)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		treemacs-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(provide 'options_rc)
;;; options_rc.el ends here
