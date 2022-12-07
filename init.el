(add-to-list 'load-path (expand-file-name "~/.emacs.d/scripts"))

;; start the initial frame maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

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


(unless (package-installed-p 'simpleclip)
  (package-install 'simpleclip)
  )


;; Evil Mode \m/
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

(unless (package-installed-p 'vterm)
  (package-install 'vterm)
  )

(use-package ibuffer
  :ensure nil
  :init
  (use-package ibuffer-vc
    :commands (ibuffer-vc-set-filter-groups-by-vc-root)
    :custom
    (ibuffer-vc-skip-if-remote 'nil))
  :custom
  (ibuffer-formats
   '((mark modified read-only locked " "
           (name 35 35 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process)
     (mark " "
           (name 16 -1)
           " " filename)))
  )



(unless (package-installed-p 'smart-mode-line)
  (package-install 'smart-mode-line)
  )

(unless (package-installed-p 'smart-mode-line-powerline-theme)
  (package-install 'smart-mode-line-powerline-theme)
  )

(unless (package-installed-p 'company )
  (package-install 'company )
  )

(unless (package-installed-p 'company-web )
  (package-install 'company-web )
  )

(unless (package-installed-p 'magit )
  (package-install 'magit )
  )

(unless (package-installed-p 'ivy )
  (package-install 'ivy )
  )

(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))


(use-package counsel
  :after ivy
  :config (counsel-mode)
  )

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))


(use-package yasnippet :config (yas-global-mode))
(use-package yasnippet-snippets :ensure t)


(simpleclip-mode 1)
(ivy-mode)
(which-key-mode)
(company-mode)


(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hok #'lsp-enable-which-key-integration))

(require 'company-web-html)        
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'web-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-web-html))
                          (company-mode t)))


;; Run THIS Command AFTER installing the package! -> M-x all-the-icons-install-fonts
(use-package all-the-icons
  :if (display-graphic-p))


(use-package org
  :config 
  (setq org-ellipsis " ▼" )
  (setq org-directory "~/Documents/org")
  (setq org-agenda-files '("~/Documents/org/agenda.org") ) )


(org-babel-do-load-languages
 'org-babel-load-languages '(
			     (C . t) ;; C
			     (shell . t)
			     (lisp . t) ;; lisp
			     (sed . t) ;;  SED
			     (lua . t) ;; Lua
			     (python . t) ;; Python
			     (js . t) ;; Javascript
			     (plantuml . t) ;; Javascript

			     ) )

(setq org-display-remote-inline-images t)


(use-package org-bullets
  :after org
  :hook ( org-mode . org-bullets-mode )
  :custom
  (org-bullets-bullet-list '(
			    "◯"
			    "○"
			    "○"
			    "○"
			    "○"
			    "○"
			    "○" ) ) )


;; Exports to HTML on save (Toggle)
(defun toggle-org-html-export-on-save ()
  (interactive)
  (if (memq 'org-html-export-to-html after-save-hook)
      (progn
        (remove-hook 'after-save-hook 'org-html-export-to-html t)
        (message "Disabled org html export on save for current buffer..."))
    (add-hook 'after-save-hook 'org-html-export-to-html nil t)
    (message "Enabled org html export on save for current buffer...")))

(use-package ox-gfm)

(eval-after-load "org"
  '(require 'ox-gfm nil t))

(defadvice org-export-output-file-name (before org-add-export-dir activate)
  "Modifies org-export to place exported files in a different directory"
  (when (not pub-dir)
      (setq pub-dir "export")
      (when (not (file-directory-p pub-dir))
       (make-directory pub-dir))))

;; Always redisplay inline images after executing SRC block
(eval-after-load 'org
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images))


(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Documents/org-roam") ;; Create directory before calling this
  :bind ( ("C-c r l" . org-roam-buffer-toggle)
	  ("C-c r f" . org-roam-node-find )
	  ("C-c r i" . org-roam-node-insert ) )
  :config
  (org-roam-setup) )
[[id:0e776a6a-0382-4f2e-8178-bf071d0d3dfe][AdKOMM]]
(use-package projectile)
(setq projectile-project-search-path '(
				       ( "~/Documents/MKS" . 2)
				       ( "~/Documents/Projects" . 2)
				       ( "~/Documents/org-roam" . 1)
				       ( "~/Documents/org" . 1 ) ) )
(setq projectile-generic-command "fd . -0 --type f --color=never")
(projectile-mode +1)



(use-package plantuml-mode
  :init
    (setq plantuml-default-exec-mode 'jar)
    (setq plantuml-jar-path "~/toolz/plantuml/plantuml.jar")
    (setq org-plantuml-jar-path (expand-file-name "~/toolz/plantuml/plantuml.jar"))
    (setq org-startup-with-inline-images t)
    (add-to-list 'org-src-lang-modes '("puml" . plantuml))
    (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))


;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))

(define-derived-mode plantuml-mode prog-mode "plantuml")
(define-derived-mode plantuml-mode python-mode "plantuml")

(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)


(when (require 'evil-collection nil t)
  (evil-collection-init)
  )


(setq-default org-display-custom-times t )
(setq org-time-stamp-custom-formats '("<%d-%m-%y>". "<%d-%m-%y %a %H:%M>") )


(auto-image-file-mode 1)

(require 'lsp-setup.el)
(require 'appearance.el)
(require 'keybinds.el)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(org-agenda-files '("~/Documents/org/agenda.org"))
 '(package-selected-packages
   '(groovy-mode cider clojure-mode closure-lsp plantuml-mode org-roam ox-gfm all-the-icons org-bullets magit rustic lsp-rustic lsp-rust-analyzer lsp-rust flycheck lsp-ui lsp-java lsp-mode company counsel ivy smart-mode-line-powerline-theme smart-mode-line vterm ibuffer-vc iBuffer which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; END
