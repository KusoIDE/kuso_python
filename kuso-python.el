;; Set uncomment keybinding
(require 'python-mode)
(define-key py-mode-map (kbd "\C-c @") 'uncomment-region)


;; Setup Jedi
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; Setup hideshow
(add-hook 'python-mode-hook         'hs-minor-mode)


(autoload 'python-pylint "python-pylint")
(autoload 'pylint "python-pylint")


(setq KUSO_PYTHON_PATH default-directory)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* (
           (temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
           (local-file (file-relative-name temp-file (file-name-directory buffer-file-name)))
           )
      (list (concat KUSO_PYTHON_PATH "pyemacs.sh")  (list local-file)))
    )

  (add-to-list 'flymake-allowed-file-name-masks '("\\.py$" flymake-pyflakes-init))
  )
