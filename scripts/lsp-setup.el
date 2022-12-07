
(use-package lsp-mode
:ensure t
:hook (
   (lsp-mode . lsp-enable-which-key-integration)
   (java-mode . #'lsp-deferred)
)
:init (setq 
    lsp-keymap-prefix "C-c l"              ; this is for which-key integration documentation, need to use lsp-mode-map
    lsp-enable-file-watchers nil
    read-process-output-max (* 1024 1024)  ; 1 mb
    lsp-completion-provider :capf
    lsp-idle-delay 0.500
)
:config 
    (setq lsp-intelephense-multi-root nil) ; don't scan unnecessary projects
    (with-eval-after-load 'lsp-intelephense
    (setf (lsp--client-multi-root (gethash 'iph lsp-clients)) nil))
	(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
)

(use-package lsp-ui
:ensure t
:after (lsp-mode)
:bind (:map lsp-ui-mode-map
         ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
         ([remap xref-find-references] . lsp-ui-peek-find-references))
:init (setq lsp-ui-doc-delay 1.5
      lsp-ui-doc-position 'bottom
	  lsp-ui-doc-max-width 100
	  )
:custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil)
)


(use-package lsp-java 
:ensure t
:config (add-hook 'java-mode-hook 'lsp))

(use-package groovy-mode
  :ensure t)

(use-package rustic
:ensure t
:config (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

;;(add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

;; install it using M-x lsp-install-server RET clojure-lsp

(use-package cider
  :ensure t )

(use-package clojure-mode 
  :ensure t )

(add-to-list 'cider-jack-in-cljs-dependencies '("org.clojure/clojurescript" "1.11.4"))

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
       lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
       lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      )

(use-package lsp-treemacs
  :after (lsp-mode treemacs)
  :ensure t
  :commands lsp-treemacs-errors-list
  :bind (:map lsp-mode-map
         ("M-9" . lsp-treemacs-errors-list)))

(use-package treemacs
  :ensure t
  :commands (treemacs)
  :after (lsp-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode
	 ))



(provide 'lsp-setup.el)
