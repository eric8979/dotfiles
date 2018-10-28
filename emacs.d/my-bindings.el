;;; package --- Summary
;;; Commentary:

;;; Code:

(eval-when-compile (load-file "~/.emacs.d/my-config.el"))

(global-set-key (kbd "C-x ;") 'comment-region)
(global-set-key (kbd "C-x C-;") 'uncomment-region)
(define-key evil-normal-state-map (kbd "ge") 'helm-projectile)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
(define-key evil-normal-state-map (kbd "gs") 'save-buffer)

;; Window movement / management
(define-key evil-normal-state-map (kbd "gh") 'evil-window-left)
(define-key evil-normal-state-map (kbd "gj") 'evil-window-down)
(define-key evil-normal-state-map (kbd "gk") 'evil-window-up)
(define-key evil-normal-state-map (kbd "gl") 'evil-window-right)
(define-key evil-normal-state-map (kbd "go") 'delete-other-windows)
(define-key evil-normal-state-map (kbd "gq") 'delete-window)


(defun my-switch-to-other-buffer ()
  "Switch to other buffer."
  (interactive)
  (switch-to-buffer (other-buffer)))
(define-key evil-normal-state-map "gb" 'my-switch-to-other-buffer)

(define-key evil-normal-state-map (kbd "C-t") 'magit-status)

;; comment/uncomment code
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
(key-chord-define evil-normal-state-map "gc" 'comment-or-uncomment-region-or-line)

;; Exit insert mode with key chord
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

(defun my-open-zsh ()
  "Opens zsh."
  (interactive)
  (split-window-below)
  (evil-window-down 1)
  (multi-term))
(evil-leader/set-key "t" 'my-open-zsh)

;; open init.el in new window
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))
(evil-leader/set-key
  "e" 'find-user-init-file)

;; Open work org file
(defun find-org-work ()
  (interactive)
  (find-file-other-window config-org-files))
(evil-leader/set-key
  "o" 'find-org-work)

;; Ag
(evil-leader/set-key "g" 'helm-ag-project-root)

;; Easymotion (avy)
(evil-leader/set-key "w" 'avy-goto-word-or-subword-1)
(evil-leader/set-key "j" 'avy-goto-line-below)
(evil-leader/set-key "k" 'avy-goto-line-above)
(evil-leader/set-key "x" 'avy-goto-char-2)

;;; my-bindings.el ends here
