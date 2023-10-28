;;; font_rc.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Source: https://gist.github.com/DivineDominion/e15c152f2fad785f4e1167b9a4df548b#main-font-and-frame-settings
;;; Code:

(defun bb/use-face (font height weight)
  "Set font; FONT=font name; HEIGHT=font height; WEIGHT=font weight."
  (let ((the-font (format "%s-%d" font height)))
    (message the-font)
    (setq default-frame-alist
          (append (list
	           `(font . ,the-font)
	           '(min-height . 1)  '(height     . 45)
	           '(min-width  . 1)  '(width      . 101)
                   '(vertical-scroll-bars . nil)
                   '(internal-border-width . 24) ;; frame padding around the text
                   '(left-fringe    . 0)
                   '(right-fringe   . 0)
                   '(ns-transparent-titlebar . t)
                   ;; '(menu-bar-lines . 0)
                   ;; '(tool-bar-lines . 0)
		   ))))
  (set-face-attribute 'default nil
                      :font font
                      :weight weight
                      :height (* height 10))
  (set-face-attribute 'variable-pitch nil
                      :font "Iosevka Comfy"
                      :height (* height 10))
  (set-face-attribute 'fixed-pitch nil
                      :font font
                      :height (* height 10)))
(defun bb/use-regular-face ()
  "Use SF Mono Regular 22pt, for larger screens."
  (interactive)
  (bb/use-face "Iosevka Comfy" 18 'regular))

(bb/use-regular-face)

;; Map SF Symbols to a compatible font
;; (set-fontset-font t '(?􀀀 . ?􏿽) "SF Pro Display")

;;; font_rc.el ends here
