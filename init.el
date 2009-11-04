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
;; UI tweaks
;;----------------------------------------------------------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

;;----------------------------------------------------------------------------
;; Color theme
;;----------------------------------------------------------------------------

(require 'color-theme-autoloads)
(autoload 'color-theme-twilight "color-theme-twilight" "A dark color theme" t)
(color-theme-initialize)
(color-theme-twilight)