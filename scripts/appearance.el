
(load-theme 'dracula t)

(setq sml/theme 'respectful)
(setq sml/no-confirm-load-theme t)
(sml/setup)

(setq inhibit-startup-message t)
(setq visible-bell nil)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq display-line-numbers 'relative)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10 )
(menu-bar-mode -1)

;; (set-face-attribute 'default nil :font "monospace" :height 110)
;; (set-face-attribute 'default nil :font "Droid Sans Mono" :height 110)
(set-face-attribute 'default nil :font "Fira Code" :height 110)
(display-line-numbers-mode)

(provide 'appearance.el)
