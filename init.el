;;----------------------------------------------------------------------------
;; General configuration
;;----------------------------------------------------------------------------

; disable menu bar, tool bar, scroll bar and blinking cursor
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

; disable splash screen
(setq inhibit-splash-screen t)

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

; make text-mode the default major mode
(setq default-major-mode 'text-mode)

; enable auto-fill-mode for text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

; keyboard bindings
(global-set-key "\C-cg" 'goto-line) 

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

; Handier way to add modes to auto-mode-alist
(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;;----------------------------------------------------------------------------
;; Color theme
;;----------------------------------------------------------------------------
(require 'color-theme-autoloads)
(autoload 'color-theme-twilight "color-theme-twilight" "A dark color theme" t)
(color-theme-initialize)
(color-theme-twilight)

;;----------------------------------------------------------------------------
;; Handy commands
;;----------------------------------------------------------------------------
(require 'init-handy)

;;----------------------------------------------------------------------------
;; Ido mode
;;----------------------------------------------------------------------------
(ido-mode t)
(ido-everywhere t)

;;----------------------------------------------------------------------------
;; yasnippet
;;----------------------------------------------------------------------------
(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory '("~/.emacs.d/snippets" "~/.emacs.d/site-lisp/yasnippet/snippets"))
(mapc 'yas/load-directory yas/root-directory)

;;----------------------------------------------------------------------------
;; auto-complete
;;----------------------------------------------------------------------------
;(require 'auto-complete)
;(global-auto-complete-mode t)

;;----------------------------------------------------------------------------
;; Flyspell
;;----------------------------------------------------------------------------
(require 'init-flyspell)

;;----------------------------------------------------------------------------
;; PHP
;;----------------------------------------------------------------------------
(require 'init-php)

;;----------------------------------------------------------------------------
;; Python
;;----------------------------------------------------------------------------
(require 'init-python)

;;----------------------------------------------------------------------------
;; Ruby
;;----------------------------------------------------------------------------
(require 'init-ruby)

;;----------------------------------------------------------------------------
;; YAML
;;----------------------------------------------------------------------------
(require 'init-yaml)

;;----------------------------------------------------------------------------
;; HAML
;;----------------------------------------------------------------------------
(require 'haml-mode)

;;----------------------------------------------------------------------------
;; SASS
;;----------------------------------------------------------------------------
(require 'sass-mode)

;;----------------------------------------------------------------------------
;; Rails
;;---------------------------------------------------------------------------
(require 'init-rails)

;;----------------------------------------------------------------------------
;; Haskell
;;----------------------------------------------------------------------------
(require 'init-haskell)

;;----------------------------------------------------------------------------
;; Erlang
;;----------------------------------------------------------------------------
(require 'init-erlang)

;;----------------------------------------------------------------------------
;; LaTeX
;;----------------------------------------------------------------------------
(require 'init-latex)

;;----------------------------------------------------------------------------
;; Git
;;----------------------------------------------------------------------------
(require 'init-git)

;;----------------------------------------------------------------------------
;; PKGBUILD
;;----------------------------------------------------------------------------
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode))
                              auto-mode-alist))
;;----------------------------------------------------------------------------
;; Markdown
;;----------------------------------------------------------------------------
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;----------------------------------------------------------------------------
;; Pig Latin
;;----------------------------------------------------------------------------
(autoload 'piglatin-mode "piglatin.el"
  "Major mode for editing Pig scripts" t)
(setq auto-mode-alist
      (cons '("\\.pig" . piglatin-mode) auto-mode-alist))

;;----------------------------------------------------------------------------
;; JavaScript
;;----------------------------------------------------------------------------

(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
      (autoload 'javascript-mode "javascript-mode.el" nil t)

;;----------------------------------------------------------------------------
;; ARFF
;;----------------------------------------------------------------------------
(autoload 'arff-mode "arff-mode.el"
  "Major mode for editing ARFF files" t)
(setq auto-mode-alist
      (cons '("\\.arff" . arff-mode) auto-mode-alist))

;;----------------------------------------------------------------------------
;; multi-term
;;----------------------------------------------------------------------------
(require 'multi-term)

;;----------------------------------------------------------------------------
;; ELPA
;;----------------------------------------------------------------------------
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
