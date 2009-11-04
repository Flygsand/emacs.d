;;----------------------------------------------------------------------------
;; General configuration
;;----------------------------------------------------------------------------

; disable menu bar, tool bar, scroll bar and blinking cursor
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

; use UTF-8
(prefer-coding-system 'utf-8)
 
; Lines shouldn't be longer than 79 chars
(setq fill-column 72)
 
; shows current selected region
(setq-default transient-mark-mode t)
 
; indent via spaces not tabs
(setq-default indent-tabs-mode nil)
 
; titlebar = buffer unless filename
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
 
; show paired parenthesis
(show-paren-mode 1)
 
; TAB => 4*'\b'
(setq default-tab-width 4)

;;----------------------------------------------------------------------------
;; Set load path
;;----------------------------------------------------------------------------
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.emacs.d/site-lisp/")
           (default-directory my-lisp-dir))
      (progn
        (setq load-path (cons my-lisp-dir load-path))
        (normal-top-level-add-subdirs-to-load-path))))
(setq load-path (cons (expand-file-name "~/.emacs.d") load-path))

;;----------------------------------------------------------------------------
;; Auxiliary functions
;;----------------------------------------------------------------------------

;directory-of-library returns the path to a given library 
(require 'find-func)
(defun path-to-library (library-name)
  (file-name-as-directory (file-name-directory (find-library-name library-name))))

;;----------------------------------------------------------------------------
;; Color theme
;;----------------------------------------------------------------------------
(require 'color-theme-autoloads)
(autoload 'color-theme-twilight "color-theme-twilight" "A dark color theme" t)
(color-theme-initialize)
(color-theme-twilight)

;----------------------------------------------------------------------------
;; yasnippet
;;----------------------------------------------------------------------------
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat (path-to-library "yasnippet") "snippets"))

;----------------------------------------------------------------------------
;; auto-complete
;;----------------------------------------------------------------------------
(require 'auto-complete)
(global-auto-complete-mode t)

;;----------------------------------------------------------------------------
;; Python
;;----------------------------------------------------------------------------
(require 'init-python)
