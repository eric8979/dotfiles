;;; package --- Summary
;;; Commentary:

;;; Code:

;; don't activate yasnippet in term mode
(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

;; turn off linums in buffers where it isn't required
(add-hook 'helm-mode-hook '(lambda () (linum-mode 0)))

(add-hook 'js-mode-hook '(lambda ()
                           (infer-indentation-style)
                           (tern-mode t)
                           (set (make-local-variable 'company-backends) '(company-tern))
                           (company-mode)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; enable company mode for autocompletion
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

;; enable irony-mode in C style files
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; sensitive mode hook
;; Note: this isn't very well tested
(setq auto-mode-alist
      (append '(("\\.gpg$" . sensitive-mode))
              auto-mode-alist))

;; term mode hooks
(add-hook 'term-mode-hook
          (lambda ()
            (hl-line-mode 0)
            (define-key term-raw-map (kbd "C-y") 'term-paste)
            (define-key term-raw-map (kbd "C-c C-l") 'term-line-mode)
            (define-key term-raw-map (kbd "C-c C-k") 'term-char-mode)
            (setq show-trailing-whitespace nil)
            (message "%s" major-mode)))

;; tide-mode
(add-hook 'tide-mode-hook
          (lambda ()
            (define-key tide-mode-map (kbd "C-c C-d")
              (lambda ()
                (interactive)
                (evil-set-jump)
                (tide-jump-to-definition)))
            (remove-hook 'before-save-hook 'delete-trailing-whitespace)))

;; enable linum in org mode
(add-hook 'org-mode-hook
          (lambda ()
            (linum-mode t)))

;; enable linum in text mode
(add-hook 'text-mode-hook
          (lambda ()
            (linum-mode t)))

;;; my-hooks.el ends here
