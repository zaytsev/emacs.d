(global-font-lock-mode 1)
(setq inhibit-splash-screen t)
(setq font-lock-maximum-decoration 3)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(transient-mark-mode t)
(setq case-fold-search t)
(blink-cursor-mode 0)
(setq ring-bell-function 'ignore)
(line-number-mode 1)
(column-number-mode 1)

(global-set-key [f1] 'menu-bar-mode)

;;; Color Theme Setup
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(require 'zenburn)
(color-theme-zenburn)

;;; White space
(setq whitespace-style '(trailing lines space-before-tab indentation space-after-tab) whitespace-line-column 80)


;; clojure-mode
(add-to-list 'load-path "~/.emacs.d/clojure-mode")
(require 'clojure-mode)

;; paredit
(add-to-list 'load-path "~/.emacs.d/paredit")
(require 'paredit)

;; slime
(eval-after-load "slime" 
  '(progn (slime-setup '(slime-repl))	
	(defun paredit-mode-enable () (paredit-mode 1))	
	(add-hook 'slime-mode-hook 'paredit-mode-enable)
	(add-hook 'slime-repl-mode-hook 'paredit-mode-enable)
	(setq slime-protocol-version 'ignore)))

(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime)
(slime-setup)
