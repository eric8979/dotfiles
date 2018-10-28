;;; package --- Summary
;;; Commentary:

;;; Ths is where all config variables will be placed to keep them out of the repo

;;; Code:

;; Install all packages automatically
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, and install if it’s not.
Return a list of installed PACKAGES or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (package-install package)
       package))
   packages))

;; General packages to install
(ensure-package-installed
 'evil
 'evil-surround
 'evil-leader
 'avy
 'key-chord
 'restclient
 'smart-mode-line
 'powerline
 'linum-relative
 'linum-off
 'yasnippet
 'git-gutter
 'projectile
 'helm-projectile
 'flycheck
 'go-eldoc
 'exec-path-from-shell
 'flx
 'flx-ido
 'multi-term
 'magit
 'vagrant
 'company
 'company-go
 'company-irony
 'company-tern
 'irony
 'helm-ag
 'helm
 'evil-mu4e
 'flymake-jslint
 'znc
 'erc-hl-nicks
 'ox-twbs
 'jira
 'xml-rpc
 'tide
 'magit-gitflow
 )

;; Modes to install
(ensure-package-installed
 'web-mode
 'php-mode
 'typescript-mode
 'markdown-mode
 'cc-mode
 'yaml-mode
 'dockerfile-mode
 'go-mode
 'js2-mode
 'writeroom-mode
 'python-mode
 )

;; Themes
(ensure-package-installed
 'smart-mode-line-powerline-theme
 'dracula-theme
 'idea-darkula-theme
 'solarized-theme
 'arjen-grey-theme
 'helm-themes
 )

;;; my-packages.el ends here
