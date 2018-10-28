;;; package --- Summary
;;; Commentary:

;;; Code:

;; improve helm colors
(set-face-attribute 'helm-selection nil
                    :background "grey"
                    :foreground "black")
(set-face-attribute 'helm-source-header nil
                    :background "unspecified-bg"
                    :foreground "grey")

;; set margin colors to be the same as zenburn background
;; (set-face-attribute 'fringe nil :background "#3F3F3F" :foreground "#3F3F3F")
(set-face-attribute 'fringe nil :background "#505050" :foreground "#505050")

;; make the vertical window split line less harsh
(set-face-attribute 'vertical-border nil :foreground "#303030")

(set-background-color "#505050") ;; lighter theme

;;; my-colors.el ends here
