(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
;(menu-bar-mode -1) ;Ainda n estou pronto para isso
;(load-theme 'tango-dark)
(setq visible-bell 1)
(setq line-number-mode t)
(global-display-line-numbers-mode 1)
(require 'package)

;; custom vars
(setq custom-theme-directory "./themes")

;; hotkeys
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Temas
; Carregar Tema
(load-file "~/.emacs.d/themes/kuronami-theme.el")
(load-theme 'tango-dark)
(set-face-attribute 'default nil
		    :family "JetBrains Mono"
		    :height 100
		    :weight 'light)
(set-face-attribute 'variable-pitch nil
		    :family "JetBrains Mono"
		    :height 1.0)
(set-face-attribute 'fixed-pitch nil
		    :family "JetBrains Mono"
		    :height 1.0)
;; Packages
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
;(use-package command-log-mode)
(use-package ivy
  :diminish
  :bind(;("C-s" . swiper)
	:map ivy-minibuffer-map
	("TAB" . ivy-alt-done)
	("C-l" . ivy-alt-done)
	("C-j" . ivy-next-line)
	("C-k" . ivy-previous-line)
	:map ivy-switch-buffer-map
	("C-k" . ivy-previous-line)
	("C-l" . ivy-done)
	("C-d" . ivy-switch-buffer-kill)
	:map ivy-reverse-i-search-map
	("C-k" . ivy-previous-line)
	("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(use-package magit)
;
