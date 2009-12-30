(add-hook 'latex-mode-hook 
          '(lambda () (orgtbl-mode) (auto-fill-mode)))

(provide 'init-latex)