;;; package --- Summary
;;; Commentary:

;;; Code:

(eval-when-compile (load-file "~/.emacs.d/my-config.el"))

(defun how-many-region (begin end regexp &optional interactive)
  "Print number of non-trivial matches for REGEXP in region.
Non-interactive arguments are BEGIN END Regexp"
  (interactive "r\nsHow many matches for (regexp): \np")
  (let ((count 0) opoint)
    (save-excursion
      (setq end (or end (point-max)))
      (goto-char (or begin (point)))
      (while (and (< (setq opoint (point)) end)
                  (re-search-forward regexp end t))
        (if (= opoint (point))
            (forward-char 1)
          (setq count (1+ count))))
      (if interactive (message "%d occurrences" count))
      count)))

(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if
  ;; neither, we use the current indent-tabs-mode
  (let ((space-count (how-many-region (point-min) (point-max) "^  "))
        (tab-count (how-many-region (point-min) (point-max) "^\t")))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

(defun my-load-all-in-directory (dir)
  "`load' all elisp libraries in directory DIR which are not already loaded."
  (interactive "D")
  (let ((libraries-loaded (mapcar #'file-name-sans-extension
                                  (delq nil (mapcar #'car load-history)))))
    (dolist (file (directory-files dir t ".+\\.elc?$"))
      (let ((library (file-name-sans-extension file)))
        (unless (member library libraries-loaded)
          (load library nil t)
          (push library libraries-loaded))))))

(defun empty-string-p (string)
  "Return true if the STRING is empty or nil.  Expects string."
  (or (null string)
      (zerop (length (string)))))

(defun my-writeroom-on ()
  "Enables writeroom mode and removes fluff like linum and enables flyspell."
  (interactive)
  (linum-mode 0)
  (flyspell-mode-on)
  (toggle-word-wrap)
  (writeroom-mode t))

(defun my-writeroom-off ()
  "Disables writeroom mode and enables fluff like linum and enables flyspell."
  (interactive)
  (linum-mode t)
  (flyspell-mode-off)
  (toggle-word-wrap)
  (writeroom-mode 0))

(defun my-bell-function ()
  "Disable bell on scrolling to limits."
  (unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer
                                keyboard-quit mwheel-scroll down up next-line previous-line
                                backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

(defun day-mode ()
  "Enables day time theme."
  (interactive)
  (set-frame-parameter nil 'background-mode 'light)
  (enable-theme 'solarized))

(defun night-mode ()
  "Enables night time theme."
  (interactive)
  (set-frame-parameter nil 'background-mode 'dark)
  (enable-theme 'solarized))

(defun my-update-org-agenda-files ()
  "Update org agenda files list."
  (interactive)
  (setq org-agenda-files
        (find-lisp-find-files config-org-files "\.org$")))

;;; my-functions.el ends here
