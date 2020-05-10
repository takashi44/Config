;; via http://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; diminish allows you to keep minor modes from spamming the mode line
;; via the "diminish:" directive in use-package statements
(use-package diminish
  :ensure t
  )

;; Spiffy mode line skin
(use-package powerline
  :ensure t
  :defer t
  :init
  (powerline-default-theme))

;; Shows number of matches during isearch, preview of query-replace
;; https://github.com/syohex/emacs-anzu
(use-package anzu
  :ensure t
  :diminish anzu-mode
  :config
  (global-anzu-mode +1)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  )

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status)
  ("C-c m b" . magit-blame)
  ("C-c m d" . magit-diff-buffer-file)
  ;("C-c m f" . magit-file-popup)
  :config
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-unpushed-to-upstream
                          'magit-insert-unpushed-to-upstream-or-recent
                          'replace)
  )

;; LANGUAGES
(use-package csharp-mode
  :ensure t
  :defer t)
(use-package markdown-mode
  :ensure t
  :defer t)
(use-package yaml-mode
  :ensure t
  :defer t)
(use-package cmake-mode
  :ensure t
  :defer t)
(use-package dockerfile-mode
  :ensure t
  :defer t)
(use-package glsl-mode
  :ensure t
  :defer t)
(use-package json-mode
  :ensure t
  :defer t)
(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode)
  :ensure t
  :defer t)
(use-package web-mode
  :ensure t
  :defer t
  :mode ("\\.html\\'"
         "\\.css\\'"
         "\\.php\\'")
  :config
  (progn
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-enable-auto-quoting nil)))


(add-to-list 'auto-mode-alist '("\\.usf$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.ush$" . glsl-mode))

;; Example of settings based on OS type.
(when (not (string= system-type "darwin"))
  (setq visible-bell 1)) ;; Mac has a distracting visible bell

;; Example of settings based on host name
(when (string= (system-name) "lala1111.magicleap.ds")
  (set-face-attribute 'default nil
                      :family "Menlo"
                      :height 110
                      :weight 'normal
                      :width 'normal))


(setq inhibit-splash-screen t)
(setq column-number-mode t)
(setq mac-command-modifier 'meta)
(unless (display-graphic-p)
  (menu-bar-mode -1))

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(desktop-restore-frames nil)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(display-line-numbers-width 3)
 '(global-eldoc-mode nil)
 '(mode-require-final-newline nil)
 '(package-selected-packages
   (quote
    (yaml-mode web-mode use-package powerline org-bullets markdown-mode json-mode js2-mode glsl-mode dockerfile-mode csharp-mode cmake-mode)))
 '(recentf-max-menu-items 25)
 '(recentf-max-saved-items 25)
 '(recentf-mode t)
 '(require-final-newline nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:inherit (shadow default) :foreground "gray55"))))
 '(line-number-current-line ((t (:inherit line-number :background "gray25")))))

;; key binding
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-c\C-g" 'goto-line)
(global-set-key "\C-ch" 'hilit-highlight-buffer)
