
;; Standard (Re)-Bindings

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(evil-set-leader 'normal (kbd "SPC") )
(evil-set-leader 'visual (kbd "SPC") )

;; Buffers

(evil-define-key 'normal 'global (kbd "<leader>bS") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>bk") 'kill-this-buffer)
(evil-define-key 'normal 'global (kbd "<leader>bb") 'ibuffer)
  ;; :bind ("C-x C-b" . ibuffer)

;; Windows

(evil-define-key 'normal 'global (kbd "<leader>wN") 'evil-window-new)
(evil-define-key 'normal 'global (kbd "<leader>wv") 'evil-window-vsplit)
(evil-define-key 'normal 'global (kbd "<leader>ws") 'evil-window-split)
(evil-define-key 'normal 'global (kbd "<leader>ww") 'evil-window-next)

(evil-define-key 'normal 'global (kbd "<leader>wh") 'windmove-left)
(evil-define-key 'normal 'global (kbd "<leader>wl") 'windmove-right)
(evil-define-key 'normal 'global (kbd "<leader>wj") 'windmove-down)
(evil-define-key 'normal 'global (kbd "<leader>wk") 'windmove-up)



(provide 'keybinds.el)
