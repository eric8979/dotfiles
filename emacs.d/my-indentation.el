;;; package --- Summary
;;; Commentary:

;;; Code:

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun my-office-code-style ()
  (interactive)
  (message "Office code style!")
  (setq indent-tabs-mode nil) ; use spaces instead of tabs
  (my-setup-indent 2) ; indent 2 spaces width
  )

(defun my-personal-code-style ()
  (interactive)
  (message "My personal code style!")
  (setq indent-tabs-mode t) ; use tabs instead of spaces
  (my-setup-indent 2) ; indent 2 spaces width
  )

(defun my-setup-develop-environment ()
  (interactive)
  (if (not (empty-string-p buffer-file-name))
      (let ((proj-dir (file-name-directory (buffer-file-name))))
        ;; if hobby project path contains string "hobby-proj1"
        ;; (if (string-match-p "hobby-proj1" proj-dir)
        ;;     (my-personal-code-style))

        ;; if commericial project path contains string "work"
        (if (string-match-p "work" proj-dir)
            (my-office-code-style)
          (my-personal-code-style)))))

;; prog-mode-hook requires emacs24+
(add-hook 'prog-mode-hook 'my-setup-develop-environment)

;;; my-indentation.el ends here
