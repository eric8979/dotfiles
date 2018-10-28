;;; package --- Summary
;;; Commentary:

;;; Code:

;;; TODO :
;;;   Remove all instances of global-set-key and put in my-bindings.el

(eval-when-compile (load-file "~/.emacs.d/my-config.el"))


;;; Package installation
;;; --------------------------------------------------------------------------------

;; Initialize package manager
(require 'package)

(setq package-enable-at-startup nil)
;; (package-initialize) ; probs not required lol

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Start the download
(eval-when-compile (load-file "~/.emacs.d/my-packages.el"))

;;; --------------------------------------------------------------------------------


;;; UI changes
;;; --------------------------------------------------------------------------------

;; Remove menu bar
(menu-bar-mode -1)

;; Fix for broken color codes on OSX
(defvar solarized-broken-srgb)
(setq solarized-broken-srgb nil)

;; Use dark background
(set-frame-parameter nil 'background-mode 'dark)

;; Disable scroll bars
(scroll-bar-mode -1)

;; Disable toolbar
(tool-bar-mode -1)

;;; --------------------------------------------------------------------------------


;;; General configuration
;;; --------------------------------------------------------------------------------

;; Move custom set variables to another file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Save backup files in another dir
(setq temporary-file-directory "~/.emacs-saves")
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

;; Add another theme load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Smoother scrolling
(defvar scroll-step)
(setq scroll-step 10)

;; Use OSX super key as meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'super)

;; Better interface for gdb
(setq gdb-many-windows t)

;; Enable narrow-to-region
(put 'narrow-to-region 'disabled nil)

;; Treat _ as part of a word in certain languages
(add-hook 'c-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'emacs-lisp-mode-hook (lambda () (modify-syntax-entry ?- "w")))
(add-hook 'javascript-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'js2-mode-hook (lambda () (modify-syntax-entry ?_ "w")))

;; Set javascript indent level to 2
(setq js-indent-level 2)

;; Fix C indenting
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

;; Disable tabs for indenting
(setq-default indent-tabs-mode nil)

;; Show matching parenthesis
(show-paren-mode t)

;; Auto add matching parenthesis
(electric-pair-mode 1)
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\{ . ?\})
                            ))

;; Set default shell
(setq multi-term-program config-shell)

;;; --------------------------------------------------------------------------------


;;; Package configuration
;;; --------------------------------------------------------------------------------

;; Recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Evil
(require 'evil)
(evil-mode t)

;; Set leader key
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")

;; Don't move curser back a character  after insert-leave
(setq evil-move-cursor-back nil)

;; Be able to move up and down naturally on wrapped lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Git gutter
(require 'git-gutter)
(global-git-gutter-mode +1)
(git-gutter:linum-setup)

;; Git flow
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; Enable key chord mode
(require 'key-chord)
(key-chord-mode 1)

;; Mode for better C style language editing (C/C++ etc)
(require 'cc-mode)

;; Simple rest client
(require 'restclient)

;; Enter js2-mode when editing a *.js file
(add-to-list 'auto-mode-alist `(,(rx ".js" string-end) . js2-mode))

;; smart line mode
(setq sml/theme 'respectful)
(sml/setup)

;; projectile
(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-window-setup 'current-window)
(define-key org-mode-map (kbd "C-c i") 'org-indent-line)
(setq org-log-done t)
(setq org-src-fontify-natively t)
(load-library "find-lisp")
(setq org-agenda-files
      (find-lisp-find-files config-org-files "\.org$"))

;; Exporting org files
(require 'ox-twbs)
(setq truncate-lines 'nil)

;; multi-term
(require 'multi-term)

;; PHP
;;(require 'php-mode) ; causes emacs to hang in recursive loop for some reason

;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.raml\\'" . yaml-mode))

;; Editing dockerfiles
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile" . dockerfile-mode))

;; Configure web mode to turn on when editing certain files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; Enable global company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Enable company irony after company mode has loaded
(require 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; Enable autocompletion for javascript
(require 'company-tern)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-tern))

;; Enable autocompletion for go
(require 'company-go)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;; Enable linting
(require 'flymake)
(add-hook 'java-mode-hook 'flymake-mode-on)
;; flycheck
(global-flycheck-mode)

;; Enable linting for go
(setenv "GOPATH" config-gopath)
(setenv "PATH" (concat (getenv "PATH") ":" config-gobin))
(setq exec-path (append exec-path (list (expand-file-name config-gobin))))
(add-to-list 'load-path (concat config-gopath "/src/github.com/dougm/goflymake"))
(require 'go-flycheck)

;; Enable documentation for go
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)

;; Enable relative line numbers
(require 'linum-relative)
(linum-on)
(linum-relative-on)
(setq linum-relative-format "%3s ")
(global-linum-mode 1)
(setq linum-relative-current-symbol "")
(set-face-attribute 'linum-relative-current-face nil :background nil :foreground "#8CD0D3" :weight 'normal)

;; Turn normal linum off
(require 'linum-off)

;; flx-ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Enable helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x g") 'helm-projectile-ag)
;; Add themes for helm
(require 'helm-themes)

;;; --------------------------------------------------------------------------------

;; Load custom files
;;; --------------------------------------------------------------------------------

(load-file "~/.emacs.d/my-indentation.el")
(load-file "~/.emacs.d/my-functions.el")
(my-load-all-in-directory "~/.emacs.d/modes.d") ; needs to be loaded after functions but before hooks
(load-file "~/.emacs.d/my-bindings.el")
(load-file "~/.emacs.d/my-hooks.el")

;;; --------------------------------------------------------------------------------


;; Final setup
;;; --------------------------------------------------------------------------------

;;; Load users theme
(load-theme config-theme)

;;; --------------------------------------------------------------------------------

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; Aligns annotations to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;;; init.el ends here
