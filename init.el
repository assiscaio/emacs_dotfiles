;; Flag
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
;(menu-bar-mode -1) ;Ainda n estou pronto para isso
(setq visible-bell 1)
(setq line-number-mode t)
(global-display-line-numbers-mode 1)
(require 'package)

;; Custom vars
(setq custom-theme-directory "./themes")

;; Hotkeys
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Temas
;; Carregar Tema
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
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Evita buscar iniciando com ^
(use-package magit)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.6))
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))
(use-package avy
  :config
  (global-set-key (kbd "C-;") 'avy-goto-char))
(use-package evil
  :init (evil-mode 1))
;;
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("77f1e155387d355fbbb3b382a28da41cc709b2a1cc71e7ede03ee5c1859468d2" default))
 '(package-selected-packages
   '(evil helpful counsel ivy-rich rainbow-delimiters zenburn-theme which-key wfnames undo-tree tide popup magit lsp-ui lsp-treemacs ivy helm-core crux company command-log-mode clojure-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
