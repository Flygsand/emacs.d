(autoload 'php-mode "php-mode" "mode for editing php files" t)
(add-auto-mode 'php-mode "\\.php[345]?\\'\\|\\.phtml\\." "\\.(inc|tpl)$" "\\.module$")
(add-hook 'php-mode-hook
          (lambda ()
            (require 'flymake-php)
            (flymake-mode t)))

(eval-after-load "php-mode"
  '(progn
     (define-key php-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

(provide 'init-php)
