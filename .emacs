;;; Package: --- Summary
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-save-query nil)
 '(TeX-source-correlate-mode t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#ff6188" "#fcfcfa"] t)
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(cua-enable-cua-keys 'shift)
 '(custom-enabled-themes '(solarized-zenburn))
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "8b58ef2d23b6d164988a607ee153fd2fa35ee33efc394281b1028c2797ddeebb" "f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" default))
 '(erc-nick "sublime83")
 '(exec-path-from-shell-arguments '("-l"))
 '(font-use-system-font t)
 '(global-auto-revert-mode t)
 '(global-visual-line-mode t)
 '(helm-minibuffer-history-key "M-p")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (lambda nil (get-buffer "*Org Agenda*")))
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(org-latex-default-packages-alist
   '(("AUTO" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("" "hyperref" nil nil)))
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-enable-at-startup nil)
 '(package-selected-packages
   '(evil-numbers org-ref docker dockerfile-mode lsp-treemacs solarized-theme telega helm-lsp ob-sagemath ob-sage org-pomodoro proof-general pkgbuild-mode yaml-mode treemacs-evil evil-org org-tree-slide yasnippet-snippets evil-collection evil-surround evil undo-tree delight use-package elcord elcort rustic treemacs-projectile helm-projectile projectile monokai-theme twittering-mode mingus pretty-symbols treemacs-magit fira-code-mode cmake-ide helm-org-refile org-refile cdlatex diminish pos-tip pos-top company-box cargo flycheck-rust ob-rust racer company-auctex auctex helm-org blacken company-postframe py-isort yasnippets blacked telephone-line circadian exec-path-from-shell flycheck-google-cpplint google-c-style all-the-icons-dired all-the-icons dap-lldb oauth2 magit-gh-pulls gist ox-gfm helm-bibtex org-caldav biblio eldoc-mode mu4e ag helm/purpose helm-purpose window-purpose purpose cquery cquary lsp jedi sage-shell-mode mu4e-alert auctex-latexmk org-journal mozc org company-coq dired-sort evil-magit ivy-hydra flx evil-tabs hideshow-org ido-vertical-mode ox-mediawiki interleave wc-mode dired-rainbow rainbow-delimiters rainbow-identifiers org-gcal xkcd micgoline cmake-font-lock cmake-mode cuda-mode company-c-headers nyan-mode gnuplot org-ac ghci-completion ghc fuzzy eldoc-eval c-eldoc rainbow-mode ox-reveal auto-package-update))
 '(recentf-max-menu-items 100)
 '(recentf-max-saved-items 200)
 '(recentf-mode t)
 '(rustic-format-trigger 'on-save)
 '(safe-local-variable-values
   '((eval setq dockerfile-build-args
           (mapcar
            (lambda
              (input)
              (format "%s=%s"
                      (car input)
                      (substring
                       (shell-command-to-string
                        (cadr input))
                       0 -1)))
            '(("USER_ID" "id -u")
              ("USER" "id -un")
              ("GROUP_ID" "id -g")
              ("GROUP" "id -gn"))))
     (c-offsets-alist
      (inexpr-class . +)
      (inexpr-statement . +)
      (lambda-intro-cont . +)
      (inlambda . c-lineup-inexpr-block)
      (template-args-cont c-lineup-template-args +)
      (incomposition . +)
      (inmodule . +)
      (innamespace . +)
      (inextern-lang . +)
      (composition-close . 0)
      (module-close . 0)
      (namespace-close . 0)
      (extern-lang-close . 0)
      (composition-open . 0)
      (module-open . 0)
      (namespace-open . 0)
      (extern-lang-open . 0)
      (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
      (objc-method-args-cont . c-lineup-ObjC-method-args)
      (objc-method-intro .
                         [0])
      (friend . 0)
      (cpp-define-intro c-lineup-cpp-define +)
      (cpp-macro-cont . +)
      (cpp-macro .
                 [0])
      (inclass . +)
      (stream-op . c-lineup-streamop)
      (arglist-cont-nonempty c-lineup-gcc-asm-reg c-lineup-arglist)
      (arglist-cont c-lineup-gcc-asm-reg 0)
      (arglist-intro . +)
      (catch-clause . 0)
      (else-clause . 0)
      (do-while-closure . 0)
      (label . 2)
      (access-label . -)
      (substatement-label . 2)
      (substatement . +)
      (statement-case-open . 0)
      (statement-case-intro . +)
      (statement-block-intro . +)
      (statement-cont . +)
      (statement . 0)
      (brace-entry-open . 0)
      (brace-list-entry . 0)
      (brace-list-intro . +)
      (brace-list-close . 0)
      (brace-list-open . 0)
      (block-close . 0)
      (inher-cont . c-lineup-multi-inher)
      (inher-intro . +)
      (member-init-cont . c-lineup-multi-inher)
      (member-init-intro . +)
      (annotation-var-cont . +)
      (annotation-top-cont . 0)
      (topmost-intro-cont . c-lineup-topmost-intro-cont)
      (topmost-intro . 0)
      (knr-argdecl . 0)
      (func-decl-cont . +)
      (inline-close . 0)
      (inline-open . +)
      (class-close . 0)
      (class-open . 0)
      (defun-block-intro . +)
      (defun-close . 0)
      (defun-open . 0)
      (string . c-lineup-dont-change)
      (arglist-close . c-lineup-arglist)
      (substatement-open . 0)
      (case-label . 0)
      (block-open . 0)
      (c . 1)
      (comment-intro . 0)
      (knr-argdecl-intro . -))
     (c-cleanup-list scope-operator brace-else-brace brace-elseif-brace brace-catch-brace empty-defun-braces list-close-comma defun-close-semi)
     (c-hanging-semi&comma-criteria c-semi&comma-no-newlines-before-nonblanks)
     (c-hanging-colons-alist
      (member-init-intro before)
      (inher-intro)
      (case-label after)
      (label after)
      (access-label after))
     (c-hanging-braces-alist
      (substatement-open after)
      (brace-list-open after)
      (brace-entry-open)
      (defun-open after)
      (class-open after)
      (inline-open after)
      (block-open after)
      (block-close . c-snug-do-while)
      (statement-case-open after)
      (substatement after))
     (c-comment-only-line-offset . 0)
     (c-tab-always-indent . t)
     (TeX-engine . "xetex")
     (eval org-sbe "sel")
     (org-html-protect-char-alist
      ("&" . "&amp;"))
     (org-html-protect-char-alist quote
                                  (("&" . "&amp;")))
     (org-export-initial-scope . subtree)
     (TeX-master . t)))
 '(sage-shell:use-prompt-toolkit nil)
 '(sage-shell:use-simple-prompt t)
 '(save-place-mode t)
 '(send-mail-function 'smtpmail-send-it)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(tool-bar-style 'image)
 '(user-full-name "Emil VATAI")
 '(user-mail-address "emil.vatai@gmail.com")
 '(visible-bell t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "CTDB" :slant normal :weight normal :height 120 :width normal)))))

(package-initialize)

(require 'smtpmail)
(let ((package 'use-package))
  (unless (package-installed-p package)
    (package-install package)))
;; (eval-when-compile
;;  (require 'use-package))
(use-package diminish :ensure t)
(use-package bind-key :ensure t)
;; (require 'diminish)                ;; if you use :diminish
;; (require 'bind-key)                ;; if you use any :bind variant(custom-set-variables

;; Initial setup
;; (run-at-time nil (* 5 60) 'recentf-save-list)
(add-hook 'find-file-hook #'recentf-save-list)
(add-hook 'markdown-mode-hook #'flyspell-mode)
;; (windmove-default-keybindings)

"Basic packages"

;; NEEDS FIXING - caused trouble!
;;
;; Without special settings, emacs daemon doesn't start properly.
(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

(use-package mozc
  :custom (default-input-method "japanese-mozc"))

;; (setq system-time-locale "ja_JP.utf8") ;; LC_TIME should kick in
;; (set-language-environment "Japanese")

(use-package diminish :ensure t)

(use-package delight :ensure t)

"Functionality"

(use-package ag :ensure t)

;; (use-package smartparens
;;   :ensure t
;;   :delight
;;   :config
;;   (sp-pair "'" nil :actions :rem)
;;   ;; (show-smartparens-global-mode 1)
;;   (smartparens-global-mode 1))

(use-package hideshow
  :ensure t
  :delight hs-minor-mode
  :diminish
  :hook ((c-mode-common . hs-minor-mode)
         (rustic-mode . hs-minor-mode)
         (emacs-lisp-mode . hs-minor-mode)
         (java-mode . hs-minor-mode)
         (lisp-mode . hs-minor-mode)
         (sage-mode . hs-minor-mode)
         (perl-mode . hs-minor-mode)
         (sh-mode . hs-minor-mode)
         (python-mode . hs-minor-mode)))

(use-package undo-tree
  :ensure t
  :delight
  :config
  (global-undo-tree-mode))

;; (use-package idle-highlight-mode
;;   :ensure t
;;   :delight
;;   :config
;;   (define-globalized-minor-mode global-idle-highlight-mode
;;     idle-highlight-mode idle-highlight-mode)
;;   (global-idle-highlight-mode))

"evil"

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  ;; (add-to-list 'evil-emacs-state-modes 'nav-mode)
  ;; (add-to-list 'evil-emacs-state-modes 'neotree-mode)
  ;; (add-to-list 'evil-emacs-state-modes 'xref-mode)
  ;; (add-to-list 'evil-emacs-state-modes 'mingus-browse-mode)
  ;; (add-to-list 'evil-emacs-state-modes 'mingus-playlist-mode)
  (evil-set-undo-system 'undo-tree)
  (evil-mode))

(use-package evil-numbers
  :ensure t
  :bind (("C-c +" . evil-numbers/inc-at-pt)
         ("C-c -" . evil-numbers/dec-at-pt)))

(use-package evil-surround
  :after evil
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

"Helm"

(use-package helm
  :ensure t
  :delight
  :demand
  :bind (("M-x" . helm-M-x)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini))
  :config
  ;; (use-package helm-org :ensure t)
  (helm-mode 1))

"Development"

(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'flymake-mode)

(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)
  ;; :config
  ;; (global-display-line-numbers-mode)
  )

;; (use-package flycheck-posframe :ensure t)

;; (use-package company-posframe
;;   :ensure t
;;   :hook (company-mode . company-posframe-mode))

(use-package company-box
  :ensure t
  :delight
  :after all-the-icons
  :hook (company-mode . company-box-mode)
  :init (setq company-box-icons-alist 'company-box-icons-all-the-icons)
  :config
  (setq company-box-backends-colors nil)
  (setq company-box-show-single-candidate t)
  ;; (setq company-box-max-candidates 10)

  (defun company-box-icons--elisp (candidate)
    (when (derived-mode-p 'emacs-lisp-mode)
      (let ((sym (intern candidate)))
        (cond ((fboundp sym) 'Function)
              ((featurep sym) 'Module)
              ((facep sym) 'Color)
              ((boundp sym) 'Variable)
              ((symbolp sym) 'Text)
              (t . nil)))))

  (with-eval-after-load 'all-the-icons
    (declare-function all-the-icons-faicon 'all-the-icons)
    (declare-function all-the-icons-fileicon 'all-the-icons)
    (declare-function all-the-icons-material 'all-the-icons)
    (declare-function all-the-icons-octicon 'all-the-icons)
    (setq company-box-icons-all-the-icons
          `((Unknown . ,(all-the-icons-material "find_in_page" :height 0.7 :v-adjust -0.15))
            (Text . ,(all-the-icons-faicon "book" :height 0.68 :v-adjust -0.15))
            (Method . ,(all-the-icons-faicon "cube" :height 0.7 :v-adjust -0.05 :face 'font-lock-constant-face))
            (Function . ,(all-the-icons-faicon "cube" :height 0.7 :v-adjust -0.05 :face 'font-lock-constant-face))
            (Constructor . ,(all-the-icons-faicon "cube" :height 0.7 :v-adjust -0.05 :face 'font-lock-constant-face))
            (Field . ,(all-the-icons-faicon "tags" :height 0.65 :v-adjust -0.15 :face 'font-lock-warning-face))
            (Variable . ,(all-the-icons-faicon "tag" :height 0.7 :v-adjust -0.05 :face 'font-lock-warning-face))
            (Class . ,(all-the-icons-faicon "clone" :height 0.65 :v-adjust 0.01 :face 'font-lock-constant-face))
            (Interface . ,(all-the-icons-faicon "clone" :height 0.65 :v-adjust 0.01))
            (Module . ,(all-the-icons-octicon "package" :height 0.7 :v-adjust -0.15))
            (Property . ,(all-the-icons-octicon "package" :height 0.7 :v-adjust -0.05 :face 'font-lock-warning-face)) ;; Golang module
            (Unit . ,(all-the-icons-material "settings_system_daydream" :height 0.7 :v-adjust -0.15))
            (Value . ,(all-the-icons-material "format_align_right" :height 0.7 :v-adjust -0.15 :face 'font-lock-constant-face))
            (Enum . ,(all-the-icons-material "storage" :height 0.7 :v-adjust -0.15 :face 'all-the-icons-orange))
            (Keyword . ,(all-the-icons-material "filter_center_focus" :height 0.7 :v-adjust -0.15))
            (Snippet . ,(all-the-icons-faicon "code" :height 0.7 :v-adjust 0.02 :face 'font-lock-variable-name-face))
            (Color . ,(all-the-icons-material "palette" :height 0.7 :v-adjust -0.15))
            (File . ,(all-the-icons-faicon "file-o" :height 0.7 :v-adjust -0.05))
            (Reference . ,(all-the-icons-material "collections_bookmark" :height 0.7 :v-adjust -0.15))
            (Folder . ,(all-the-icons-octicon "file-directory" :height 0.7 :v-adjust -0.05))
            (EnumMember . ,(all-the-icons-material "format_align_right" :height 0.7 :v-adjust -0.15 :face 'all-the-icons-blueb))
            (Constant . ,(all-the-icons-faicon "tag" :height 0.7 :v-adjust -0.05))
            (Struct . ,(all-the-icons-faicon "clone" :height 0.65 :v-adjust 0.01 :face 'font-lock-constant-face))
            (Event . ,(all-the-icons-faicon "bolt" :height 0.7 :v-adjust -0.05 :face 'all-the-icons-orange))
            (Operator . ,(all-the-icons-fileicon "typedoc" :height 0.65 :v-adjust 0.05))
            (TypeParameter . ,(all-the-icons-faicon "hashtag" :height 0.65 :v-adjust 0.07 :face 'font-lock-const-face))
            (Template . ,(all-the-icons-faicon "code" :height 0.7 :v-adjust 0.02 :face 'font-lock-variable-name-face))))))

(use-package company
  :ensure t
  :delight
  :config
  ;; (setq company-global-modes '(not eshell-mode))
  (global-company-mode)
  )

(use-package flycheck
  :ensure t
  :delight
  :config
  (setq flycheck-gcc-language-standard  "c++17")
  (setq flycheck-clang-language-standard "c++17")
  (flycheck-add-next-checker 'python-flake8 'python-pylint)
  (global-flycheck-mode))

(use-package projectile
  ;; :ensure t
  :delight
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path
        '("~/code/"
          ;; "~/Dropbox/"
          ;; "~/Dropbox/Work/publications/endrody"
          ))
  (projectile-mode +1))

(use-package helm-projectile
  :ensure t
  :commands helm-projectile
  :config (helm-projectile))

(use-package eldoc
  :ensure t
  :delight
  :hook (emacs-lisp-mode . eldoc-mode))

(use-package lsp-mode
  :ensure t
  :custom
  ;; Optimisations (see lsp-doctor)
  (gc-cons-threshold 100000000)
  (read-process-output-max (* 1024 1024))
  ;; (lsp-completion-provider :capf)
  ;; customisations
  (lsp-idle-delay 0.500)
  :hook (prog-mode . lsp)
  :commands lsp
  )

(use-package helm-lsp
  :ensure t
  :config
  (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
  )

(use-package lsp-ui
  :ensure t
  ;; :requires lsp-mode
  :hook ((lsp-mode . lsp-ui-mode))
  :custom
  ;; lsp-ui-doc
  (lsp-ui-doc-enable nil)  ;; big gray window covering everything
  (lsp-ui-doc-delay 0)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature nil)
  (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  (lsp-ui-doc-max-width 120)
  (lsp-ui-doc-max-height 30)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit t)
  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-delay 3)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-symbol t)
  (lsp-ui-sideline-show-hover t) ;; sideline: message from the statusbar making text to jump
  (lsp-ui-sideline-show-diagnostics nil)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-code-actions-prefix "")
  ;; lsp-ui-imenu
  (lsp-ui-imenu-enable t)
  ;; lsp-ui-peek
  (lsp-ui-peek-enable t)
  ;; lsp-ui
  (lsp-ui-flycheck-enable t)
  :config
  ;; (add-hook 'lsp-ui-doc-frame-hook
  ;;           (lambda (frame _w)
  ;;             (set-face-attribute 'default frame :height 50)))
  ;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  ;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  :commands lsp-ui-mode)

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package yasnippet-snippets :ensure t)

(use-package yasnippet :ensure t
  :delight yas-minor-mode
  :config
  ;; (dolist (fun '(yas-load-directory
  ;;                yas--load-directory-1
  ;;                yas--load-directory-2
  ;;                yas--load-snippet-dirs
  ;;                yas-reload-all
  ;;                yas--load-pending-jits))
  ;;   (trace-function fun))
  (yas-global-mode 1))

(use-package cmake-mode
  :ensure t)

(use-package cquery
  :commands lsp-cquery-enable
  :requires (lsp-mode lsp-ui)
  :hook (c-mode-common . lsp-cquery-enable))

(use-package dap-mode
  :ensure t
  :requires (lsp))

(use-package google-c-style
  :ensure t
  :hook ((c-mode-common . google-set-c-style)
         (c-mode-common . google-make-newline-indent)))

(use-package c-eldoc
  :ensure t
  :hook (c-mode-common . c-turn-on-eldoc-mode))

(use-package cuda-mode :ensure t)

"Development - Java"

(use-package lsp-java :ensure t)

"Development - Rust"

;; (use-package flycheck-rust
;;   :ensure t)

;; (use-package pos-tip
;;   :ensure t)

;; (use-package racer
;;   :ensure t)

;; (use-package cargo
;;   :ensure t)

;; (use-package rustic
;;   :ensure t
;;   :custom
;;   (rustic-format-trigger 'on-save)
;;   :hook
;;   (rustic-mode . (lambda () (setq buffer-save-without-query t)))
;;   )

"Development - Python"

(use-package blacken
  :ensure t
  :hook (python-mode . blacken-mode))

(use-package py-isort
  :ensure t
  :config (add-hook 'before-save-hook #'py-isort-before-save))

(defun remove-py-isort-hook ()
  (interactive)
  (remove-hook 'before-save-hook #'py-isort-before-save))

"Development - Science"

;; (use-package ein :ensure t)

(use-package ob-sagemath :ensure t)

(use-package sage-shell-mode
  :ensure t
  :config
  ;; Run SageMath by M-x run-sage instead of M-x sage-shell:run-sage
  (sage-shell:define-alias)

  ;; Turn on eldoc-mode in Sage terminal and in Sage source files
  ;; (add-hook 'sage-shell-mode-hook #'eldoc-mode)
  ;; (add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)
  )

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package docker-tramp :ensure t)

(use-package dockerfile-mode :ensure t)

"Latex"

(use-package auctex
  :hook (LaTeX-mode . flyspell-mode))

(use-package auctex-latexmk
  :ensure t
  :config
  (auctex-latexmk-setup))

(use-package cdlatex
  :ensure t
  :hook (LaTeX-mode . cdlatex-mode)
  :init
  (setq cdlatex-math-symbol-alist
        '((?: ("\\cdots" "\\ldots" "\\vdots")))))

"org"

(use-package org
  :ensure t
  :hook ((after-init . org-agenda-list)
         (org-mode . turn-on-org-cdlatex)
         (org-mode . flyspell-mode))
  :custom
  ;; BEGIN [from custom]
  (org-image-actual-width nil)
  (org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 2 :fileskip0 t)))
  (org-agenda-files
   (quote ("~/org/"
           ;; "~/endrody/endrody.org"
           )))
  (org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (C . t)
     (shell . t)
     (maxima . t)
     (sql . t)
     (dot . t)
     (ledger . t)
     (latex . t)
     (octave . t)
     (python . t)
     (ditaa . t)
     (sqlite . t))))
  (org-capture-templates
   (quote
    (("r" "Remember" entry
      (file+headline "~/org/capture.org" "Remember")
      (format "* %T: %?\n"))
     ("t" "Todo" entry
      (file+headline "~/org/capture.org" "Tasks")
      (format "* TODO %?\nSCHEDULED: %T\nlink: %a"))
     ("i" "Idea" entry
      (file+headline "~/org/capture.org" "Ideas")
      (format "* Idea on %t: %?\n")))))
  (org-clock-persist (quote history))
  (org-confirm-babel-evaluate nil)
  (org-default-notes-file "~/org/capture.org")
  (org-ditaa-eps-jar-path "/usr/share/java/ditaa-eps/DitaaEps.jar")
  (org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0_10.jar")
  (org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "setsid -w xdg-open %s"))))
  (org-journal-dir "~/org/journal/")
  (org-latex-listings (quote minted))
  (org-latex-packages-alist (quote (("" "minted" nil) ("" "booktabs" nil))))
  (org-latex-pdf-process
   (quote
    ("latexmk -pdflatex='%latex -shell-escape -bibtex -interaction nonstopmode' -pdf -f  %f")))
  (org-preview-latex-default-process (quote dvisvgm))
  (org-use-property-inheritance (quote ("NOWEB-REF")))
  ;; END [from custom]
  (org-agenda-archives-mode nil)
  (org-agenda-skip-comment-trees nil)
  (org-agenda-skip-function nil)
  (org-catch-invisible-edits 'show-and-error)
  (org-habit-show-habits-only-for-today nil)
  (org-log-into-drawer t)
  (org-mobile-directory "~/.mobileorg")
  (org-outline-path-complete-in-steps nil)
  (org-refile-allow-creating-parent-nodes 'confirm)
  (org-refile-targets '((org-agenda-files :maxlevel . 3)))
  (org-refile-use-outline-path t)
  ;; (org-completion-use-ido nil) ;; Doesn't work (from https://emacs.stackexchange.com/questions/14535/how-can-i-use-helm-with-org-refile)
  ;; (org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))

  :config
  (add-to-list 'org-modules 'org-habit)
  (org-clock-persistence-insinuate)

  ;; Exporting
  (require 'ox-latex)

  ;; Keybindings
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-cb" 'org-switchb)
  (define-key global-map "\C-cc" 'org-capture)

  (add-to-list
   'org-latex-classes
   '("letter"
     "\\documentclass{letter}"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  ;; (org-babel-do-load-languages
  ;;  'org-babel-load-languages
  ;;  '((python . t)))
  ;; This code makes marking of code-snippets as bellow possible:
  ;;
  ;; #+BEGIN_SRC python :exports none
  ;;   {{{print('hello')}}}
  ;;   print('hi')
  ;; #+END_SRC

  (require 'ox)
  (defun org-html-add-mark-tag (src backend _info)
    (when (org-export-derived-backend-p backend 'html)
      (replace-regexp-in-string "{{{\\([^\n]+\\)}}}" "<mark>\\1</mark>"
                                src)))
  (add-to-list 'org-export-filter-src-block-functions
               'org-html-add-mark-tag))

(use-package ob-rust
  :ensure t)

(use-package org-pomodoro
  :ensure t
  :custom
  (org-pomodoro-short-break-sound
   ;; "/usr/share/sounds/freedesktop/stereo/service-logout.oga")
   "~/Sync/sounds/uhoh.wav")
  (org-pomodoro-finished-sound
   ;; "/usr/share/sounds/freedesktop/stereo/service-logout.oga")
   "~/Sync/sounds/uhoh.wav")
  ;; (org-pomodoro-audio-player "/usr/bin/paplay")
)

(use-package ox-gfm
  :ensure t
  :after (org))

(use-package org-tree-slide
  :ensure t
  :requires org
  :bind (("<f8>" . org-tree-slide-mode)
         ("S-<f8>" . org-tree-slide-skip-done-toggle)
         :map org-tree-slide-mode-map
         ("<prior>" . org-tree-slide-move-previous-tree)
         ("<next>" . org-tree-slide-move-next-tree)
         ("<f11>" . org-tree-slide-content)))

;; scale latex fragments
(defun update-org-latex-fragments ()
  "Hook to sync latex fragments and text scale."
  (when (derived-mode-p 'org-mode)
    (org-toggle-latex-fragment '(64))
    ;; (org-latex-preview '(64))
    (plist-put org-format-latex-options
               :scale (* 1.5 text-scale-mode-amount))
    (org-toggle-latex-fragment '(16))
    ;; (org-latex-preview '(16))
    ))
(add-hook 'text-scale-mode-hook 'update-org-latex-fragments)

(use-package oauth2 :ensure t)

(use-package org-caldav
  :ensure t
  :after (org oauth2)
  :custom
  (org-caldav-oauth2-client-id "486464281128-d4o0bo3lfhod2ktv96emo7466g0c2jjv.apps.googleusercontent.com")
  (org-caldav-oauth2-client-secret "raDsBy9aoQ8WabCB44ixmfj1")
  (org-caldav-url 'google)
  ;; (org-caldav-calendar-id "cgla0c274be9pqkmqar32lflrc@group.calendar.google.com")
  (org-caldav-calendar-id "2dspcp6dv5geckhhv9av9ik6ag@group.calendar.google.com")
  ;; (org-caldav-inbox "~/org/gcal.org")
  (org-icalendar-timezone "UTC")
  (plstore-cache-passphrase-for-symmetric-encryption t))

(use-package evil-org
  :ensure t
  :delight
  :demand
  :after evil org
  :hook ((org-mode . evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package helm-org
  :after helm org
  :ensure t)

"Bling - Appearance"

;; (load "~/.emacs.d/sanity.el")
;; (load "~/.emacs.d/elegance.el")

;; (use-package circadian :ensure t
;;   :config
;;   (setq circadian-themes '(("6:00" . standard) ("19:30" . railscast)))
;;   ;; light: blippblopp
;;   ;; dark: desert, railscast, monokai, gruvbox
;;   (circadian-setup))

(use-package all-the-icons :ensure t)

(use-package all-the-icons-dired :ensure t)

(use-package pretty-symbols
  :ensure t)

(use-package nyan-mode
  :ensure t
  :config (nyan-mode))

(use-package telephone-line
  :ensure t
  :custom
  (telephone-line-primary-left-separator 'telephone-line-abs-left)
  (telephone-line-primary-right-separator 'telephone-line-abs-right)
  (telephone-line-secondary-left-separator 'telephone-line-nil)
  (telephone-line-secondary-right-separator 'telephone-line-nil)
  (telephone-line-evil-use-short-tag t)
  (telephone-line-center-rhs '((nil telephone-line-nyan-segment)))
  :config
  (telephone-line-mode 1))

(use-package fira-code-mode
  :ensure t
  :delight
  :hook prog-mode)

(use-package solarized-theme :ensure t)

;; (load "~/Dropbox/.emacs.d/setup-ligatures.el")

(load "~/Sync/.emacs.d/indent-file.el")
(indent-file-when-save)
(add-hook 'c-mode-common-hook #'indent-file-when-save)

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :after (all-the-icons)
  :config (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package treemacs
  :ensure t
   :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package elcord
  :ensure t)

;; (use-package neotree
;;   :ensure t
;;   :requires (all-the-icons)
;;   :demand (all-the-icons evil-mode)
;;   :config
;;   ;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;;   (setq neo-theme 'icons))

;; (use-package micgoline
;;   :ensure t
;;   :requires powerline)

;; (use-package nyan-mode
;;   :ensure t
;;   :config
;;   (nyan-mode 1))

"git"

(use-package magit
  :ensure t
  :config
  (setq git-commit-setup-hook 'git-commit-turn-on-flyspell
        git-commit-summary-max-length 50
        magit-save-repository-buffers 'dontask))

(use-package gist :ensure t)

"mu4e"

(use-package mu4e
  ;; use mbsync/isync for mail fetching
  :bind
  (([C-f1] . mu4e))
  :hook (mu4e-compose-mode . flyspell-mode)
  :config
  (setq mu4e-maildir "~/.mail"
        mu4e-change-filenames-when-moving t
        mu4e-update-interval 600
        mu4e-headers-date-format "%F")
  (add-to-list 'mu4e-bookmarks
               (make-mu4e-bookmark
                :name "Flagged"
                :query "flag:f AND NOT flag:trashed"
                :key ?f)
               t)
  (setq mu4e-view-show-addresses 't)
  (setq mu4e-user-mail-address-list
  '("emil.vatai@riken.jp" "vatai@inf.elte.hu" "vatai.emil@mail.u-tokyo.ac.jp"))
  (let* (
         (riken-vars
          '((user-mail-address . "emil.vatai@riken.jp")
            (user-full-name . "Emil VATAI")
            (smtpmail-smtp-user . "emil.vatai")
            (smtpmail-smtp-server . "postman.riken.jp")
            (smtpmail-smtp-service . 587)
            (smtpmail-stream-type . nil)
            (mu4e-get-mail-command . "mbsync Riken")
            (mu4e-sent-folder . "/Riken/Sent")
            (mu4e-drafts-folder . "/Riken/Draft")
            (mu4e-refile-folder . "/Riken/Inbox/.Archive")
            (mu4e-trash-folder  . "/Riken/Trash")
            (mu4e-compose-signature
             .
             (concat
              "Emil VATAI (PhD)\n"
              "High Performance Aritificial Intelligence Systems Research Team\n"
              "RIKEN Center for Computational Science\n"
              "\n"
              "Nihonbashi 1-chome Mitsui Building, 15th floor\n"
              "1-4-1 Nihonbashi, Chuo-ku, Tokyo 103-0027, Japan\n"
              "tel: 03-6225-2473\n"))))
         (riken-ctx
          (make-mu4e-context
           :name "Riken"
           :enter-func (lambda () (mu4e-message "Entering Riken context"))
           :leave-func (lambda () (mu4e-message "Leaving Riken context"))
           ;; we match based on the maildir of the message
           :match-func (lambda (msg)
                         (when msg
                           (string-match-p "^/Riken" (mu4e-message-field msg :maildir))))
           :vars riken-vars))
         (ut-vars
          '((user-mail-address . "vatai.emil@mail.u-tokyo.ac.jp")
            (user-full-name . "Emil VATAI")
            (smtpmail-smtp-user . "8570589345@utac.u-tokyo.ac.jp")
            (smtpmail-smtp-server . "smtp.office365.com")
            (smtpmail-smtp-service . 587)
            (smtpmail-stream-type . starttls)
            (mu4e-get-mail-command . "mbsync UT")
            (mu4e-sent-folder . "/UT/Sent Items")
            (mu4e-drafts-folder . "/UT/Drafts")
            (mu4e-refile-folder . "/UT/Archive")
            (mu4e-trash-folder  . "/UT/Deleted Items")
            (mu4e-compose-signature
             .
             (concat
              "Emil VATAI (PhD)\n"
              "The University of Tokyo\n"
              "Graduate School of Information Science and Technology\n"
              "Department of Information Science\n"
              "Tokyo 113-0033, JAPAN\n"
              "Bunkyo-ku, Hongo 7-3-1\n"
              "Faculty of Science Bldg.7, 4F, room 403\n"))))
         (ut-ctx
          (make-mu4e-context
           :name "UT"
           :enter-func (lambda () (mu4e-message "Entering UT context"))
           :leave-func (lambda () (mu4e-message "Leaving UT context"))
           ;; we match based on the maildir of the message
           :match-func (lambda (msg)
                         (when msg
                           (string-match-p "^/UT" (mu4e-message-field msg :maildir))))
           :vars ut-vars))
         (elte-vars
          '((user-mail-address . "vatai@inf.elte.hu")
            (user-full-name . "Emil VATAI" )
            (smtpmail-smtp-user . "vatai@inf.elte.hu")
            (smtpmail-smtp-server . "smtp.office365.com")
            (smtpmail-smtp-service . 587)
            (smtpmail-stream-type . starttls)
            (mu4e-get-mail-command . "mbsync ELTE")
            (mu4e-sent-folder . "/ELTE/Sent Items")
            (mu4e-drafts-folder . "/ELTE/Drafts")
            (mu4e-refile-folder . "/ELTE/Archive")
            (mu4e-trash-folder  . "/ELTE/Deleted Items")
            (mu4e-compose-signature
             . (concat
                "Emil VATAI (PhD)\n"
                "ELTE Eötvös Loránd University\n"
                "Faculty of Infromatics\n"
                "Department of Computer Algebra\n"
                "1117 Budapest, HUNGARY\n"
                "Pázmány Péter sétány 1/C\n"
                "Room D2-204 (South building)\n")
             )))
         (elte-ctx
          (make-mu4e-context
           :name "ELTE"
           :enter-func (lambda () (mu4e-message "Entering ELTE context"))
           :leave-func (lambda () (mu4e-message "Leaving ELTE context"))
           ;; we match based on the maildir of the message
           :match-func (lambda (msg)
                         (when msg
                           (string-match-p "^/ELTE" (mu4e-message-field msg :maildir))))
           :vars elte-vars))
         )
    (setq mu4e-contexts (list riken-ctx ut-ctx elte-ctx)))
  (setq mu4e-compose-context-policy 'ask-if-none)
  (setq mu4e-context-policy 'pick-first))

;; (use-package mu4e-conversation
;;   :ensure t
;;   :after mu4e
;;   :config
;;   (global-mu4e-conversation-mode))

(use-package mu4e-alert
  :ensure t
  :requires mu4e
  :hook ((after-init . mu4e-alert-enable-notifications)
         (after-init . mu4e-alert-enable-mode-line-display))
  :config
  (mu4e-alert-set-default-style 'libnotify))

(use-package org-mu4e
  :config
  (setq org-mu4e-link-query-in-headers-mode nil))

;;

"Apps"

(use-package mingus :ensure t)

(use-package telega
  :ensure t
  :commands (telega)
  :custom
  (telga-use-images t)
  :defer t
  :bind (("C-c t" . telega-prefix-map)))
  ;; :hook ((telega-load-hook
  ;;         . (lambda ()
  ;;             (define-key
  ;;               global-map
  ;;               (kbd "C-c t")
  ;;               telega-prefix-map)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

"MAXIMA"

;; (add-to-list 'load-path
;;              (car (file-expand-wildcards "/usr/share/maxima/5*/emacs")))
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))

;; "Agda"

;; (load-file (let ((coding-system-for-read 'utf-8))
;;              (shell-command-to-string "agda-mode locate")))

"Octave"

;; (setq org-babel-octave-shell-command "octave-cli -q")

"MISC"

(use-package yaml-mode :ensure t)

(use-package pkgbuild-mode :ensure t)
;; (autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
;; (setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

(use-package proof-general :ensure t)

"Twitter"

(use-package twittering-mode
  :ensure t
  :custom
  (twittering-icon-mode t))

"ERC"

(require 'erc)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#archlinux" "#org-mode" "#hpc")
        ("irc.gnome.org" "#gnome-music")))
                                        ;(if (string-equal "thundr" system-name)
                                        ;    (erc :server "irc.freenode.net" :port "6667" :nick "sublime83"))

(filesets-init)
;; ((:fileset "nnc" (:tree "~/my/dir" "^ici.+\\.el$"))
;;  (:fileset "nnc" (:files "dired+.el" "c:/my/dir/buff-menu+.el"))
;;  "c:/some/other/dir/foobar.el"
;;  "c:/somewhere/else/toto.el")


;; Remove flymake warrning message
;; (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

;; Default browser
(setq browse-url-browser-function 'browse-url-generic  browse-url-generic-program "firefox")

(load "~/org/projects.el")
(setq cursor-type 'bar)

;; Trash

;; helm-bibtex, org-ref

(use-package pdf-tools
  :ensure t)

(use-package helm-bibtex
  :ensure t
  :requires helm)

(use-package org-ref
  :ensure t
  :requires (org helm-bibtex)
  :custom
  (bibtex-completion-bibliography '("~/org/bib/index.org" "~/org/bib/index.bib"))
  (bibtex-completion-library-path "~/org/bib/pdfs")
  (bibtex-completion-notes-path "~/org/bib/notes")
  (reftex-default-bibliography '("~/org/bib/index.bib"))
  (org-ref-bibliography-notes "~/org/bib/index.org")
  (org-ref-default-bibliography '("~/org/bib/index.bib"))
  (org-ref-notes-directory "~/org/bib/notes")
  (org-ref-pdf-directory "~/org/bib/pdfs/"))

;; ivy, flx

;; (use-package ivy
;;   :config
;;   (ivy-mode))

;; (use-package flx
;;   :ensure t
;;   :requires ivy
;;   :after (ivy)
;;   :config
;;   (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
;;   ;(setq ivy-initial-inputs-alist nil)
;;   )

;; window-purpose

;; (use-package window-purpose
;;   :ensure t
;;   :config
;;   (purpose-mode)
;;   (add-to-list 'purpose-user-mode-purposes '(python-mode . py))
;;   (add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))
;;   (purpose-compile-user-configuration))

;; (use-package helm-purpose
;;   :ensure t
;;   :requires (helm window-purpose)
;;   :config (helm-purpose-setup))

;; (use-package evil-tabs
;;   :config
;;   (global-evil-tabs-mode t))

;; (use-package evil-dvorak :config (global-evil-dvorak-mode))

(provide '.emacs)
;;; .emacs ends here
