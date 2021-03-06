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

;; key board / input method settings
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8") ; prefer utf-8 for language settings
(set-input-method nil) ; no funky input for normal editing;
(global-set-key (kbd "RET") 'newline-and-indent)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))
;;(require 'package)
;;(package-initialize)
;; (add-to-list 'package-archives
;;  '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives
;;  '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (when (not package-archive-contents)
;;  (package-refresh-contents))


;;; Color Theme Setup
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(require 'zenburn)
(color-theme-zenburn)

(helm-mode 1)
(achievements-mode 1)
(projectile-global-mode 1)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; auto indent
;; (setq auto-indent-on-visit-file t)
;; (require 'auto-indent-mode)
;; (auto-indent-global-mode)
;; (setq lisp-indent-offset 2)

(defun lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(setq clojure-defun-style-default-indent t)

(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags  '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                   (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                   (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;;(multi-web-global-mode 1)

;; whitespace
;; nuke trailing whitespaces when writing to a file
(setq whitespace-style
      '(face trailing lines space-before-tab indentation space-after-tab) whitespace-line-column 120)
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; display only tails of lines longer than 120 columns, tabs and
;; trailing whitespaces
(setq whitespace-line-column 120
      whitespace-style '(tabs trailing lines-tail))

;; setting for auto-close brackets for electric-pair-mode regardless of current major mode syntax table
(setq electric-pair-pairs '(
                            (?\" . ?\")
			    (?\' . ?\')
			    (?\( . ?\))
			    (?\{ . ?\})
			    ) )

;;
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(add-hook 'git-commit-mode-hook 'git-commit-training-wheels-mode)

(global-set-key (kbd "C-c h") 'helm-mini)

;; YAML
(add-hook 'yaml-mode-hook 'flymake-yaml-load)
