(dolist (hook '(lisp-mode-hook
                emacs-lisp-mode-hook
                ruby-mode-hook
                yaml-mode
                python-mode-hook
                shell-mode-hook
                php-mode-hook
                css-mode-hook
                haskell-mode-hook
                nxml-mode-hook
                perl-mode-hook
                java-mode-hook
                c-mode-hook
                c++-mode-hook
                erlang-mode-hook))
  (add-hook hook 'flyspell-prog-mode))

(add-hook 'text-mode-hook 'flyspell-mode)

(provide 'init-flyspell)