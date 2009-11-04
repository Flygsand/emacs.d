(autoload 'python-mode "python-mode" "Python editing mode." t)

(setq auto-mode-alist
      (append '(("\\.py$" . python-mode)
		("SConstruct$" . python-mode)
		("SConscript$" . python-mode))
              auto-mode-alist))
 
(setq interpreter-mode-alist
      (cons '("python" . python-mode) interpreter-mode-alist))

;;----------------------------------------------------------------------------
;; Pymacs and Rope for Python
;;----------------------------------------------------------------------------
(add-hook 'python-mode-hook
          (lambda ()
            (require 'pymacs)
            (pymacs-load "ropemacs" "rope-")))

;;----------------------------------------------------------------------------
;; On-the-fly syntax checking via flymake
;;----------------------------------------------------------------------------
(setq flymake-python-pyflakes-executable "pyflakes")
(require 'flymake-python)
(load-library "flymake-cursor.el")
 
(add-hook 'python-mode-hook 'flymake-python-load)

(provide 'init-python)