(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)

  ;; Flycheck mode:
  (add-hook 'flycheck-mode-hook
            (lambda ()
              (evil-define-key 'normal flycheck-mode-map (kbd "]e") 'flycheck-next-error)
              (evil-define-key 'normal flycheck-mode-map (kbd "[e") 'flycheck-previous-error)
              (evil-leader/set-key-for-mode 'flycheck-mode (kbd "e") 'flycheck-list-errors))

  ;; Override default flycheck triggers
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 0.8
        flycheck-disabled-checkers '(php-phpmd)
        flycheck-phpcs-standard "CSNStores")

  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

(provide 'init-flycheck)
