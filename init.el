(add-to-list 'load-path (expand-file-name "~/.emacs.d/scripts"))

(require 'package)

(setq package-archives '( ("melpa" . "https://melpa.org/packages/")
			  ("org" . "https://orgmode.org/elpa/")
			  ("elpa" . "https://elpa.gnu.org/packages/")
		  )
      )

(package-initialize)
 (unless package-archive-contents
  (package-refresh-contents)
  )

(unless ( package-installed-p 'use-package)
  (package-install 'use-package)
  )

(require 'use-package)
(setq use-package-always-ensure t)


;;(require 'simpleclip)
(unless (package-installed-p 'simpleclip)
  (package-install 'simpleclip)
  )
(simpleclip-mode 1)

;; Evil Mode
(unless (package-installed-p 'evil)
  (package-install 'evil)
  )

(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection)
  )

(unless (package-installed-p 'dracula-theme)
  (package-install 'dracula-theme)
  )

(unless (package-installed-p 'which-key)
  (package-install 'which-key)
  )

(which-key-mode)

(load-theme 'dracula t)

(setq inhibit-startup-message t)
(setq visible-bell nil)
(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10 )
(menu-bar-mode -1)

(set-face-attribute 'default nil :font "monospace" :height 110)
(display-line-numbers-mode)


(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)
(require 'evil)
;;(use-package evil
;;
;;:ensure t
;;
;;:init
;;
;;
;;:config

;;(evil-mode))
(evil-mode 1)


(when (require 'evil-collection nil t)
  (evil-collection-init)
  )



(require 'keybinds.el)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; END
