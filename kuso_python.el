;; Set uncomment keybinding
(define-key py-mode-map (kbd "\C-c @") 'uncomment-region)


;; Setup Jedi
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
