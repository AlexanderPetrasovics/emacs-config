
;; Standard (Re)-Bindings

(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(global-set-key (kbd "C-x b") 'command-history)

;; Ivy standard bindings

(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

(global-set-key (kbd "C-c c") 'counsel-compile)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c L") 'counsel-git-log)
(global-set-key (kbd "C-c k") 'counsel-rg)
(global-set-key (kbd "C-c m") 'counsel-linux-app)
(global-set-key (kbd "C-c n") 'counsel-fzf)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-c J") 'counsel-file-jump)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-c w") 'counsel-wmctrl)

(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c b") 'counsel-bookmark)
(global-set-key (kbd "C-c d") 'counsel-descbinds)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c o") 'counsel-outline)
(global-set-key (kbd "C-c t") 'counsel-load-theme)
(global-set-key (kbd "C-c F") 'counsel-org-file)

;; Projectile

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(evil-define-key 'normal 'global (kbd "<leader>p") 'projectile-command-map)
(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

;; Org-roam


;; Evil Mode 

(evil-set-leader 'normal (kbd "SPC") )
(evil-set-leader 'visual (kbd "SPC") )

;; Buffers

(evil-define-key 'normal 'global (kbd "<leader>bS") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>bk") 'kill-this-buffer)
(evil-define-key 'normal 'global (kbd "<leader>bb") 'ibuffer)

  ;; :bind ("C-x C-b" . ibuffer)

(evil-define-key 'normal 'global (kbd "<leader>wt") 'treemacs)

;; Windows

(evil-define-key 'normal 'global (kbd "<leader>wN") 'evil-window-new)
(evil-define-key 'normal 'global (kbd "<leader>wv") 'evil-window-vsplit)
(evil-define-key 'normal 'global (kbd "<leader>ws") 'evil-window-split)
(evil-define-key 'normal 'global (kbd "<leader>ww") 'evil-window-next)

(evil-define-key 'normal 'global (kbd "<leader>wh") 'windmove-left)
(evil-define-key 'normal 'global (kbd "<leader>wl") 'windmove-right)
(evil-define-key 'normal 'global (kbd "<leader>wj") 'windmove-down)
(evil-define-key 'normal 'global (kbd "<leader>wk") 'windmove-up)

;; LSP Stuff

;(evil-define-key 'normal lsp-mode-map (kbd "<leader>c") 'lsp-treemacs-implementations)
;(evil-define-key 'normal lsp-command-map (kbd "<leader>c") 'lsp-keymap-prefix)
(evil-define-key 'normal lsp-command-map (kbd "<leader>gd") 'lsp-goto-type-definition)
(evil-define-key 'normal lsp-command-map (kbd "<leader>gi") 'lsp-goto-implementation)
(evil-define-key 'normal lsp-command-map (kbd "<leader>lr") 'lsp-treemacs-references)
(evil-define-key 'normal lsp-command-map (kbd "<leader>li") 'lsp-treemacs-implementations)



(provide 'keybinds.el)
