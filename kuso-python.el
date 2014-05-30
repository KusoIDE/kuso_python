;; Set uncomment keybinding
(require 'python-mode)
(define-key py-mode-map (kbd "\C-c @") 'uncomment-region)


;; Setup Jedi
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; Setup hideshow
(add-hook 'python-mode-hook 'hs-minor-mode)

;; Setup flycheck
(add-hook 'python-mode-hook (lambda ()
                              (flycheck-select-checker 'python-flake8)
                              (flycheck-mode)))

;; (setq KUSO_PYTHON_PATH default-directory)
