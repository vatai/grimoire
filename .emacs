;;; Package: --- Summary
;;; Commentary:
;;; Code:


(setq custom-file "~/Sync/.emacs.d/customs.el")
(load custom-file)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/"))
      package-enable-at-startup nil)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode)
(setq-default show-trailing-whitespace t)
;; (set-frame-parameter (selected-frame) 'alpha '(97 . 100))
;; (add-to-list 'default-frame-alist '(alpha . (97 . 100)))

(winner-mode)
(add-hook 'compilation-mode-hook
          (lambda ()
            (if (display-graphic-p)
                (text-scale-decrease 1))))

(package-initialize)

(require 'smtpmail)
(let ((package 'use-package))
  (unless (package-installed-p package)
    (package-install package)))
(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package diminish)   ;; if you use :diminish
(use-package bind-key)   ;; if you use any :bind variant(custom-set-variables
(use-package delight)

;; (run-at-time nil (* 5 60) 'recentf-save-list)
(add-hook 'find-file-hook #'recentf-save-list)
(add-hook 'markdown-mode-hook #'flyspell-mode)
;; (windmove-default-keybindings)

"Basic packages"

;; NEEDS FIXING - caused trouble!
;;
;; Without special settings, emacs daemon doesn't start properly.
(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))

(use-package mozc
  :custom (default-input-method "japanese-mozc"))

(setq system-time-locale "ja_JP.utf8") ;; LC_TIME should kick in
(set-language-environment "Japanese")

(with-eval-after-load 'dired
  (require 'dired-x)
  ;; Set dired-x global variables here.  For example:
  ;; (setq dired-guess-shell-gnutar "gtar")
  ;; (setq dired-x-hands-off-my-keys nil)
  )
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            ;; (dired-omit-mode 1)
            ))

"Functionality"

(use-package ag)

;; (use-package smartparens
;;   :delight
;;   :config
;;   (sp-pair "'" nil :actions :rem)
;;   ;; (show-smartparens-global-mode 1)
;;   (smartparens-global-mode 1))

(use-package hideshow
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
  (setq undo-tree-history-directory-alist '(("." . "/tmp")))
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

;; Increment and decrement numbers
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
  :delight
  :after evil
  :ensure t
  :config
  (evil-collection-init))

"Helm/Ivy"

;; (use-package helm
;;   :ensure t
;;   :delight
;;   :demand
;;   :bind (("M-x" . helm-M-x)
;;          ("C-x r b" . helm-filtered-bookmarks)
;;          ("C-x C-f" . helm-find-files)
;;          ("C-x b" . helm-mini))
;;   :config
;;   ;; (use-package helm-org :ensure t)
;;   (helm-mode 1))

(use-package swiper
  :ensure t)

(use-package counsel
  :ensure t
  :delight
  :config (counsel-mode))

(use-package ivy
  :ensure t
  :delight
  :custom
  (ivy-use-selectable-prompt t)
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  (search-default-mode #'char-fold-to-regexp)
  :config (ivy-mode)
  :bind
  ("C-s" . 'swiper )
  ("C-c C-r" . 'ivy-resume)
  ("<f6>" . 'ivy-resume)
  ("M-x" . 'counsel-M-x)
  ("C-x C-f" . 'counsel-find-file)
  ("<f1> f" . 'counsel-describe-function)
  ("<f1> v" . 'counsel-describe-variable)
  ("<f1> o" . 'counsel-describe-symbol)
  ("<f1> l" . 'counsel-find-library)
  ("<f2> i" . 'counsel-info-lookup-symbol)
  ("<f2> u" . 'counsel-unicode-char)
  ("C-c g" . 'counsel-git)
  ("C-c j" . 'counsel-git-grep)
  ("C-c k" . 'counsel-ag)
  ("C-x l" . 'counsel-locate)
  ("C-S-o" . 'counsel-rhythmbox)
  (:map minibuffer-local-map
        ("C-r" . 'counsel-minibuffer-history)))

"Development"

(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; (add-hook 'prog-mode-hook #'flymake-mode)

(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)
  :config
  (global-display-line-numbers-mode)
  )

(use-package company
  :ensure t
  :delight
  :hook (after-init . global-company-mode))

(use-package projectile
  :ensure t
  ;; :custom
  ;; (projectile-indexing-method 'native)
  :delight
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/code" "~/other-code"))
  (setq projectile-run-use-comint-mode t)
  (projectile-mode +1))

"BASH"

(use-package shfmt
  :hook
  (sh-mode . shfmt-on-save-mode))

"Helm/Ivy projectile"

;; (use-package helm-projectile
;;   :ensure t
;;   :commands helm-projectile
;;   :config (helm-projectile))

(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode))

(use-package eldoc
  :ensure t
  :delight
  :hook (emacs-lisp-mode . eldoc-mode))

(use-package which-key
  :ensure t
  :delight
  :config (which-key-mode))

(use-package flycheck-mypy)

(use-package flycheck
  :ensure t
  :delight
  ;; :custom
  ;; (flycheck-gcc-language-standard  "c++17")
  ;; (flycheck-clang-language-standard "c++17")
  :config
  ;; (flycheck-add-mode 'proselint 'latex-mode)
  (global-flycheck-mode))

(use-package eglot
  :hook ;; (prog-mode . lsp)
  (c-mode-common . eglot-ensure)
  (cuda-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (sh-mode . eglot-ensure)
  (go-mode . eglot-ensure)
  ;; (flycheck-mode . (lambda ()
  ;;                    (flycheck-add-next-checker 'eglot 'python-pylint)
  ;;                    (flycheck-add-next-checker 'eglot 'python-flake8)
  ;;                    (flycheck-add-next-checker 'python-pylint 'python-mypy)))
  :config
  (require 'project)

  (defun project-find-go-module (dir)
    (when-let ((root (locate-dominating-file dir "go.mod")))
      (cons 'go-module root)))

  (cl-defmethod project-root ((project (head go-module)))
    (cdr project))

  (add-hook 'project-find-functions #'project-find-go-module)
)

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

"Development - C/C++"

(use-package clang-format
  :hook
  (c-mode-common . clang-format-on-save-mode))

(use-package cmake-mode
  :ensure t)

;; (use-package dap-mode
;;   ;; :custom
;;   ;; (dap-auto-configure-mode t "Automatically configure dap.")
;;   ;; (dap-auto-configure-features
;;   ;;  '(sessions locals breakpoints expressions tooltip)  "Remove the button panel in the top.")
;;   :config
;;   (require 'dap-cpptools)
;;   (require 'dap-gdb-lldb)
;;   (require 'dap-python)
;;   (setq dap-python-debugger 'debugpy)
;;   ;; (dap-ui-mode 1)
;;   ;; (add-hook 'dap-stopped-hook
;;   ;;           (lambda (arg) (call-interactively #'dap-hydra)))
;;   :bind (("<f5>" . dap-debug)
;;          ("C-<f5>" . dap-continue)
;;          ("C-<f6>" . dap-next)
;;          ("C-<f7>" . dap-step-in)
;;          ("C-<f8>" . dap-step-out))
;;   )

(use-package google-c-style
  :ensure t
  :hook ((c-mode-common . google-set-c-style)
         (c-mode-common . google-make-newline-indent)))

(use-package c-eldoc
  :ensure t
  :hook (c-mode-common . c-turn-on-eldoc-mode))

;; (use-package cuda-mode :ensure t)

"Development - Java"

;; (use-package lsp-java :ensure t)

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

"Development - Go"

(use-package go-projectile)

(use-package go-mode
  :config
  ;; (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

"Development - Zig"

(use-package zig-mode)

"Development - R"

(use-package ess :ensure t)

"Development - Python"

;; (use-package blacken
;;   :ensure t
;;   :hook (python-mode . blacken-mode))

(use-package python-black
  :ensure t
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode))

(use-package py-isort
  :ensure t
  :config (add-hook 'before-save-hook #'py-isort-before-save))

(use-package sphinx-mode
  :ensure t
  :hook (python-mode . sphinx-doc-mode))

(use-package sphinx-doc
  :ensure t
  :hook (python-mode . sphinx-doc-mode))

(defun remove-py-isort-hook ()
  (interactive)
  (remove-hook 'before-save-hook #'py-isort-before-save))

(use-package cython-mode)

(use-package poetry)

"Development - Science"

;; (use-package ein :ensure t)

(use-package ob-sagemath :ensure t)

;; (use-package sage-shell-mode
;;   :ensure t
;;   ;; :config
;;   ;; Run SageMath by M-x run-sage instead of M-x sage-shell:run-sage
;;   ;; (sage-shell:define-alias)

;;   ;; Turn on eldoc-mode in Sage terminal and in Sage source files
;;   ;; (add-hook 'sage-shell-mode-hook #'eldoc-mode)
;;   ;; (add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)
;;   )

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package dockerfile-mode :ensure t)

"Latex"

(use-package auctex
  :hook
  (LaTeX-mode . flyspell-mode)
  (LaTeX-mode . prettify-symbols-mode)
  (LaTeX-mode . outline-minor-mode)
  :custom
  (prettify-symbols-unprettify-at-point t)
  )

(use-package cdlatex
  :ensure t
  :hook (LaTeX-mode . cdlatex-mode)
  :init
  (setq cdlatex-math-symbol-alist
        '((?: ("\\cdots" "\\ldots" "\\vdots")))))

"org"

;; (let (
;;       ;; (dirs (directory-files "~vatai/org"))
;;       ;; (dirs (file-expand-wildcards "~/org/*.org"))
;;       (dirs (buffer-list))
;;       )
;;   (dolist (var dirs)
;;     (let ((org-buffer-p (string-suffix-p ".org" (format "%s" var))))
;;       (if org-buffer-p
;;           (message (format "%s %s" var org-buffer-p))))))

(use-package org
  :hook ((after-init . org-agenda-list)
         (org-mode . turn-on-org-cdlatex)
         (org-mode . flyspell-mode))
  :custom
  ;; BEGIN [from custom]
  (org-image-actual-width nil)
  (org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 2 :fileskip0 t)))
  (org-agenda-files (quote ("~/org/")))
  (org-agenda-custom-commands
   '(("n" "Agenda and all TODOs" ((agenda "" nil) (alltodo "" nil)) nil)
     ("N" "Next tasks" todo "NEXT" nil)
     ("q" "Dailies (work)" tags "+work"
      ((org-agenda-files '("~/org/roam/daily"))))
     ("r" "Last two weeks" agenda ""
      ((org-agenda-span 15)
       (org-agenda-start-day "-14d")))))
  (org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (C . t)
     (R . t)
     (shell . t)
     (maxima . t)
     (sql . t)
     (dot . t)
     (latex . t)
     (octave . t)
     (python . t)
     (ditaa . t)
     (sqlite . t))))
  (org-capture-templates
   (quote
    (("p" "Protocol" entry
      (file+headline "~/org/capture.org" "Inbox")
      "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
     ("L" "Protocol Link" entry
      (file+headline "~/org/capture.org" "Inbox")
      "* %? [[%:link][%:description]] \nCaptured On: %U")
     ("r" "Remember" entry
      (file+headline "~/org/capture.org" "Remember")
      "* %T: %?\n")
     ("t" "Todo" entry
      (file+headline "~/org/capture.org" "Tasks")
      "* TODO %?\nSCHEDULED: %T\nlink: %a")
     ("m" "Meeting/appointment" entry
      (file "~/org/meetings.org")
      "* TODO %?\n  SCHEDULED: %T\n"))))
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
  (org-hide-emphasis-markers t)
  (org-journal-dir "~/org/journal/")
  (org-latex-default-packages-alist
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
  (org-latex-listings (quote minted))
  (org-latex-packages-alist (quote (("" "minted" nil) ("" "booktabs" nil))))
  (org-latex-pdf-process
   (quote
    ("latexmk -pdflatex='%latex -shell-escape -bibtex -interaction nonstopmode' -pdf -f  %f -output-directory=%o")))
  (org-preview-latex-default-process (quote dvisvgm))
  (org-use-property-inheritance (quote ("NOWEB-REF")))
  ;; END [from custom]
  (org-agenda-archives-mode nil)
  (org-agenda-skip-comment-trees nil)
  (org-agenda-skip-function nil)
  (org-agenda-span 'day)
  (org-catch-invisible-edits 'show-and-error)
  (org-enforce-todo-dependencies t)
  (org-habit-show-habits-only-for-today nil)
  (org-log-into-drawer t)
  (org-mobile-directory "~/.mobileorg")
  (org-outline-path-complete-in-steps nil)
  (org-refile-allow-creating-parent-nodes 'confirm)
  (org-refile-targets '((org-agenda-files :maxlevel . 3)))
  (org-refile-use-outline-path t)
  (org-babel-latex-preamble (lambda (_) "\\documentclass[preview]{standalone}\n"))
  ;; (org-completion-use-ido nil) ;; Doesn't work (from https://emacs.stackexchange.com/questions/14535/how-can-i-use-helm-with-org-refile)
  ;; (org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))

  :config
  (add-to-list 'org-modules 'org-habit)
  (add-to-list 'org-modules 'org-protocol)
  (add-to-list 'org-modules 'org-tempo)
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
               'org-html-add-mark-tag))  ;; end of org

(use-package org-fragtog
  :hook (org-mode . org-fragtog-mode))

(use-package ob-rust
  :ensure t)

(use-package ox-gfm
  :ensure t
  :after (org))

(use-package org-re-reveal
  :after (org)
  :custom (org-re-reveal-root "file:///home/vatai/.local/reveal.js"))

(use-package org-roam :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org/roam")
  (org-roam-completion-everywhere t)
  (org-roam-node-display-template
   (concat "${title} " (propertize "${tags}" 'face 'org-tag)))
  (org-roam-capture-templates
   '(("d" "default" plain "#+filetags: stub\n"
      :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("r" "bibliography reference" plain "#+filetags: :paper:\n\n- keywords :: %^{keywords}\n\n* %^{title}\n  :PROPERTIES:\n  :ROAM_REF: %^{citekey}\n  :URL: %^{url}\n  :AUTHOR: %^{author-or-editor}\n  :NOTER_DOCUMENT: %^{file}\n  :NOTER_PAGE:\n  :END:\n"
      :target (file+head "references/${citekey}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  ;; for dailies
;;   (org-roam-dailies-capture-templates
;;    '(("d" "default" entry "* %?" :target
;;       (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>
;; "))
;;      ("w" "week" entry "* %?" :target
;;       (file+head "" ""))))
  ;; for roam-ref protocol
  (org-roam-capture-ref-templates
   '(("r" "roam-protocol" plain "#+filetags: web stub\n\n${body}\n"
      :target (file+head "webpages/${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-ui-mode)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n I" . org-roam-node-insert-immediate)
         ("C-c n c" . org-roam-capture)
         ("C-c n b" . ivy-bibtex)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-setup)
  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                 (display-buffer-in-side-window)
                 (side . right)
                 (slot . 0)
                 (window-width . 0.33)
                 (window-parameters . ((no-other-window . t)
                                       (no-delete-other-windows . t)))))
  (defun org-roam-node-insert-immediate (arg &rest args)
    "Insert an org-roam mode without opening its buffer."
    (interactive "P")
    (let* ((args (cons arg args))
           (template (copy-sequence (car org-roam-capture-templates)))
           (target (plist-get template :target))
           (new-text (caddr target))
           (new-target (append (butlast target) (list new-text)))
           (new-template (plist-put template :target new-target))
           (org-roam-capture-templates
            (list (append template '(:immediate-finish t)))))
      (message "%s" org-roam-capture-templates)
      (apply #'org-roam-node-insert args)))
  ;; From: https://dev.to/devteam/resolving-an-unable-to-resolve-link-error-for-org-mode-in-emacs-2n1f
  ;;
  ;; I encountered the following message when attempting
  ;; to export data:
  ;;
  ;; "org-export-data: Unable to resolve link: FILE-ID"
  (defun my/force-org-rebuild-cache ()
    "Rebuild the `org-mode' and `org-roam' cache."
    (interactive)
    (org-id-update-id-locations)
    ;; Note: you may need `org-roam-db-clear-all'
    ;; followed by `org-roam-db-sync'
    (org-roam-db-clear-all)
    (org-roam-db-sync)
    (org-roam-update-org-id-locations))
  ;; If using org-roam-protocol
  (org-roam-db-autosync-mode)
  (require 'org-roam-protocol))

(use-package org-roam-bibtex :ensure t
  :delight
  :custom
  (orb-roam-ref-format 'org-ref-v3)
  (orb-preformat-keywords
   '("citekey" "title" "url" "author-or-editor" "keywords" "file"))
  (orb-process-file-keyword t)
  (orb-attached-file-extensions '("pdf"))
  :config
  (require 'org-ref)
  (org-roam-bibtex-mode))

(use-package org-roam-ui :ensure t)

(use-package djvu)

(use-package nov :ensure t)

(use-package pdf-tools :ensure t
  ;; :custom
  ;; (pdf-annot-activate-created-annotations t)
  :config
  (pdf-loader-install)
  ;; ;; Disable swiper
  ;; (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  :hook (pdf-view-mode . pdf-view-auto-slice-minor-mode))

(use-package org-noter
  :ensure t
  :after (:all org pdf-view)
  :bind (("C-c n n" . org-noter))
  :custom
  (org-noter-notes-search-path '("~/Sync/zotero-data/pdfs"))
  :config
  (require 'org-noter-pdftools))

(use-package org-pdftools
  :hook (org-load . org-pdftools-setup-link))

(use-package org-noter-pdftools
  :after org-noter
  :config
  ;; Add a function to ensure precise note is inserted
  (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
    (interactive "P")
    (org-noter--with-valid-session
     (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                   (not org-noter-insert-note-no-questions)
                                                 org-noter-insert-note-no-questions))
           (org-pdftools-use-isearch-link t)
           (org-pdftools-use-freepointer-annot t))
       (org-noter-insert-note (org-noter--get-precise-info)))))

  ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
  (defun org-noter-set-start-location (&optional arg)
    "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
    (interactive "P")
    (org-noter--with-valid-session
     (let ((inhibit-read-only t)
           (ast (org-noter--parse-root))
           (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
       (with-current-buffer (org-noter--session-notes-buffer session)
         (org-with-wide-buffer
          (goto-char (org-element-property :begin ast))
          (if arg
              (org-entry-delete nil org-noter-property-note-location)
            (org-entry-put nil org-noter-property-note-location
                           (org-noter--pretty-print-location location))))))))
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

(use-package org-pomodoro
  :ensure t
  :bind (("C-c n p" . org-pomodoro))
  :custom
  ;; "/usr/share/sounds/freedesktop/stereo/service-logout.oga")
  (org-pomodoro-finished-sound "~/Sync/sounds/uhoh.wav")
  (org-pomodoro-finished-sound-args "--volume=40000")
  ;; "/usr/share/sounds/freedesktop/stereo/service-logout.oga")
  (org-pomodoro-short-break-sound "~/Sync/sounds/uhoh.wav")
  (org-pomodoro-finished-sound-args "--volume=40000")
  ;;
  (org-pomodoro-long-break-sound "~/Sync/sounds/bell.wav")
  (org-pomodoro-long-break-sound-args "--volume=30000")
  ;;
  (org-pomodoro-audio-player "/usr/bin/paplay")
  :config
  (add-hook 'org-pomodoro-finished-hook
            (lambda ()
              (notifications-notify
               :title "Pomodoro end!"
               :body "org-pomodoro <b>finished</b>.")))
  (add-hook 'org-pomodoro-break-finished-hook
            (lambda ()
              (notifications-notify
               :title "Break end!"
               :body "Time for a new pomodoro!!!"))))

(use-package visual-fill-column :ensure t)

(use-package org-tree-slide
  :ensure t
  :requires org
  :custom
  (visual-fill-column-width 160)
  (visual-fill-column-center-text t)
  :hook ((org-tree-slide-play . (lambda ()
                                  (visual-fill-column-mode 1)
                                  (visual-line-mode 1)
                                  (setq header-line-format " ")))
         (org-tree-slide-stop . (lambda ()
                                  (visual-fill-column-mode 0)
                                  (visual-line-mode 0)
                                  (setq header-line-format nil)))
         )
  :bind (("<f8>" . org-tree-slide-mode)
         ("S-<f8>" . org-tree-slide-skip-done-toggle)
         :map org-tree-slide-mode-map
         ("<prior>" . org-tree-slide-move-previous-tree)
         ("<next>" . org-tree-slide-move-next-tree)
         ("<f11>" . org-tree-slide-content)))

(use-package org-drill :ensure t)

;; scale latex fragments
(plist-put org-format-latex-options :foreground nil)
(plist-put org-format-latex-options :background nil)
(defun update-org-latex-fragments ()
  "Hook to sync latex fragments and text scale."
  (when (derived-mode-p 'org-mode)
    ;; (org-latex-preview '(64)) ;; clear all frags
    (let ((scale (expt text-scale-mode-step text-scale-mode-amount)))
      (plist-put org-format-latex-options :scale (max 1 (* 1.3 scale))))
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

"Helm/Ivy org"

;; (use-package helm-org
;;   :after helm org
;;   :ensure t)

"Bling - Appearance"

;; Fix for themes which keep the line number the same
(custom-set-faces '(line-number ((t (:inherit default)))))

;; (load "~/.emacs.d/sanity.el")
;; (load "~/.emacs.d/elegance.el")

(use-package solarized-theme)
(use-package monokai-theme)
(use-package color-theme-sanityinc-tomorrow)
;; (use-package color-theme-sanityinc-solarized)

;; (defconst dynamic-theme-dark-theme 'sanityinc-solarized-dark)
;; (defconst dynamic-theme-light-theme 'sanityinc-solarized-light)

;; (defconst dynamic-theme-light-theme 'solarized-light)
;; (defconst dynamic-theme-dark-theme 'solarized-dark-high-contrast)

;; (defconst dynamic-theme-light-theme 'adwaita)
(defconst dynamic-theme-light-theme 'louven)
(defconst dynamic-theme-dark-theme 'modus-vivendi)

;; (defconst dynamic-theme-light-theme 'solarized-gruvbox-light)
;; (defconst dynamic-theme-dark-theme 'monokai)

(defun dynamic-theme-light-mode ()
  (interactive)
  "Switch to light  mode."
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme dynamic-theme-light-theme t))

(defun dynamic-theme-dark-mode ()
  (interactive)
  "Switch to dark mode."
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme dynamic-theme-dark-theme t))

(dynamic-theme-dark-mode)
;; (dynamic-theme-light-mode)

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; (use-package beacon
;;   :delight
;;   :custom
;;   (beacon-size 70)
;;   (beacon-color "#BB00AA")
;;   :config (beacon-mode))

(use-package all-the-icons :ensure t)

(use-package all-the-icons-dired :ensure t)

(use-package treemacs-icons-dired :ensure t)
(use-package treemacs-all-the-icons :ensure t)
(use-package all-the-icons-ivy-rich :ensure t)
(use-package all-the-icons-ivy :ensure t)
(use-package all-the-icons-completion :ensure t)

;; (use-package pretty-symbols :ensure t)

;; (require 'zone)
;; (zone-when-idle 120)
;; (use-package zone-nyan
;;   :custom
;;   (zone-programs (vconcat [zone-nyan] zone-programs)))

;; (use-package nyan-mode
;;   :ensure t
;;   :config (nyan-mode))

(use-package telephone-line
  :ensure t
  :custom
  ;; (telephone-line-primary-left-separator 'telephone-line-abs-left)
  ;; (telephone-line-primary-right-separator 'telephone-line-abs-right)
  (telephone-line-primary-left-separator 'telephone-line-nil)
  (telephone-line-primary-right-separator 'telephone-line-nil)
  (telephone-line-secondary-left-separator 'telephone-line-nil)
  (telephone-line-secondary-right-separator 'telephone-line-nil)
  (telephone-line-evil-use-short-tag t)
  ;; (telephone-line-center-rhs '((nil telephone-line-nyan-segment)))
  :config
  (telephone-line-mode 1))

;; (use-package fira-code-mode
;;   :ensure t
;;   :delight
;;   :hook prog-mode)

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
  :custom
  (magit-save-repository-buffers 'dontask)
  (git-commit-setup-hook 'git-commit-turn-on-flyspell)
  (git-commit-summary-max-length 50))

(use-package forge
  :after magit
  :custom (forge-add-default-bindings nil))

(use-package gist :ensure t)

"email"

(use-package mu4e
  :ensure nil
  ;; use mbsync/isync for mail fetching
  :bind
  (([C-f1] . mu4e))
  :custom
  (mu4e-change-filenames-when-moving t)
  (mu4e-update-interval 600)
  (mu4e-headers-date-format "%F")
  (mu4e-headers-time-format "%R")
  (user-mail-address "emil.vatai@riken.jp")
  (user-full-name "Emil VATAI")
  (smtpmail-smtp-user "emil.vatai@riken.jp")
  (message-send-mail-function 'sendmail-send-it)
  (sendmail-program "/usr/bin/msmtp")
  (mail-specify-envelope-from t)
  (message-sendmail-envelope-from 'header)
  (mail-envelope-from 'header)
  ;; (smtpmail-smtp-server "outlook.office365.com")
  ;; (smtpmail-smtp-service 587)
  ;; (smtpmail-stream-type 'starttls)
  ;; (smtp-auth 'xoauth2)
  (mu4e-get-mail-command "mbsync Riken")
  (mu4e-sent-folder "/Sent Items")
  (mu4e-drafts-folder "/Drafts")
  (mu4e-refile-folder "/Archive")
  (mu4e-trash-folder  "/Deleted Items")
  (mu4e-compose-signature
   (concat
    "Emil VATAI (PhD)\n"
    "High Performance Aritificial Intelligence Systems Research Team\n"
    "RIKEN Center for Computational Science\n"
    "\n"
    "Nihonbashi 1-chome Mitsui Building, 15th floor\n"
    "1-4-1 Nihonbashi, Chuo-ku, Tokyo 103-0027, Japan\n"
    "tel: 03-6225-2473\n"))
  :hook
  ((mu4e-compose-mode . flyspell-mode)
   (mu4e-headers-mode
    . (lambda ()
        (message "FooBar")
        (setq-local truncate-lines t)
        (message (format "tr lines is %s; buffer: %s" truncate-lines (buffer-name))))))
  )

(use-package mu4e-alert
  :ensure t
  :requires mu4e
  :hook ((after-init . mu4e-alert-enable-notifications)
         (after-init . mu4e-alert-enable-mode-line-display))
  :config
  (mu4e-alert-set-default-style 'libnotify))

(use-package mu4e-column-faces
  :after mu4e
  :config (mu4e-column-faces-mode))

(use-package mu4e-marker-icons
  :init (mu4e-marker-icons-mode 1)
  :custom
  (mu4e-marker-icons-use-unicode t)
  ;; :config
  ;; (dolist (charset '(kana han cjk-misc bopomofo gb18030))
  ;;   (set-fontset-font "fontset-default" charset "github-octicons" nil 'append)
  ;;   (set-fontset-font "fontset-default" charset "FontAwesome" nil 'append)
  ;;   (set-fontset-font "fontset-default" charset "Material Icons" nil 'append))
  )

;; (use-package org-mu4e
;;   :ensure nil
;;   :config
;;   (setq org-mu4e-link-query-in-headers-mode nil))

;;

;; "mew"

;; (use-package mew
;;   :custom
;;   (read-mail-command 'mew)
;;   (mail-user-agent 'mew-user-agent)
;;   ;; TODO
;;   (mew-mail-domain "riken.jp")
;;   ;; SMPT
;;   ;; Port: 587; Encryption method: STARTTLS
;;   (mew-smtp-server "smtp.office365.com")
;;   ;; IMAP
;;   ;; Port: 993; Encryption method: TLS
;;   (mew-mailbox-type 'imap) ;; ?
;;   (mew-oauth2-client-id "1902f6f0-4729-4d09-ab2d-614a3d23420c")
;;   (mew-proto "%")
;;   (mew-imap-user "emil.vatai") ;; 200562
;;   (mew-imap-server "outlook.office365.com")
;;   :config
;;   ;; (autoload 'mew-send "mew" nil t)
;;   ;; (setq read-mail-command 'mew)
;;   ;; (autoload 'mew-user-agent-compose "mew" nil t)
;;   ;; (if (boundp 'mail-user-agent)
;;   ;;     (setq mail-user-agent 'mew-user-agent))
;;   (if (fboundp 'define-mail-user-agent)
;;       (define-mail-user-agent
;;         'mew-user-agent
;;         'mew-user-agent-compose
;;         'mew-draft-send-message
;;         'mew-draft-kill
;;         'mew-send-hook))
;;   )

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

(use-package mastodon
  :ensure t
  :custom
  (mastodon-instance-url "https://mast.hpc.social")
  (mastodon-active-user "vatai"))

(use-package twittering-mode
  :ensure t
  :custom
  (twittering-icon-mode t))

"eshell"

(use-package eshell-autojump)
;; (add-to-list 'eshell-visual-commands "htop")

(defvar prepend-env-paths '(("PATH" "bin")
                           ("PATH" "bin64")
                           ("LD_LIBRARY_PATH" "lib")
                           ("LD_LIBRARY_PATH" "lib64")
                           ("C_INCLUDE_PATH" "include")
                           ("CPLUS_INCLUDE_PATH" "include")))

(defun prepend-env-add-path (var dir)
  (let ((oldval (getenv var)))
    ;; (message (format "var: %s\ndir: %s\noldval: %s\nexists: %s\nsuffix: %s\ncheck: %s"
    ;;                  var dir oldval exists suffix (and oldval exists)))
    (if (file-directory-p dir)
        (format "%s%s" dir (if oldval (format ":%s" oldval) ""))
      oldval)))

(defun prepend-env (dir)
  (dolist (item prepend-env-paths)
    (let ((subdir (format "%s/%s" dir (cadr item)))
          (var (car item)))
      ;; (message (format "addpath: %s" (my-set-env-add-path var subdir)))
      (setenv var (prepend-env-add-path var subdir))
      (if (string= var "PATH")
          (add-to-list 'exec-path subdir)))))

;; (prepend-env "/home/vatai/code/polyhedral-tutor/deps/opt/pluto-0.11.4")
(prepend-env "/home/vatai/code/polyhedral-tutor/deps/opt/llvm-project-10.0.0")

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
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

"MISC"

(use-package yaml-mode :ensure t)

(use-package pkgbuild-mode :ensure t)
;; (autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
;; (setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

(use-package proof-general :ensure t)

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

;; (load "~/org/projects.el")
(setq cursor-type 'bar)

;; Trash

;; helm-bibtex, org-ref

"Helm/Ivy bibtex ++"

;; (use-package helm-bibtex
;;   :ensure t
;;   :requires helm)

(use-package ivy-bibtex
  :ensure t
  :custom
  (ivy-re-builders-alist
   '((ivy-bibtex . ivy--regex-ignore-order)
     (t . ivy--regex-plus))))

(use-package org-ref-ivy :ensure nil)

(use-package org-ref
  :ensure t
  :custom
  ;; (org-ref-insert-cite-function 'org-ref-cite-insert-helm)
  (org-ref-insert-cite-function 'org-ref-cite-insert-ivy)
  ;;
  (bibtex-completion-bibliography '("~/org/bib/bibdb.bib" "~/org/bib/zotero.bib"))
  (bibtex-completion-library-path '("~/org/bib/pdfs" "~/Sync/zotero-data/pdfs/"))
  (bibtex-completion-notes-path "~/org/bib/notes")
  (bibtex-completion-pdf-field "file")
  (org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-bibtex-completion)
  (org-ref-insert-link-function 'org-ref-insert-link-hydra/body)
  (org-ref-insert-label-function 'org-ref-insert-label-link)
  (org-ref-insert-ref-function 'org-ref-insert-ref-link)
  (org-ref-cite-onclick-function
   (lambda (_) (org-ref-citation-hydra/body)))
  (bibtex-completion-pdf-open-function
   (lambda (fpath) (call-process "xdg-open" nil 0 nil fpath)))
  :bind
  (:map org-mode-map ("C-c ]" . 'org-ref-insert-link))
  (:map bibtex-mode-map ("H-b" . 'org-ref-bibtex-hydra/body))
  )

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

(use-package gptel
  :bind (("C-c m m" . gptel-menu)
         ("C-c m s" . gptel-send)))

;; (use-package org-ai
;;   :commands (org-ai-mode
;;              org-ai-global-mode)
;;   :init
;;   (add-hook 'org-mode-hook #'org-ai-mode) ; enable org-ai in org-mode
;;   :custom
;;   (org-ai-default-chat-model "gpt-4") ; if you are on the gpt-4 beta:
;;   :config
;;   (org-ai-global-mode) ; installs global keybindings on C-c M-a
;;   (org-ai-install-yasnippets)) ; if you are using yasnippet and want `ai` snippets

(use-package read-aloud
  ;; Currently using RHVoice
  ;; piper-tts (in aur) is big bug VERY nice
  :bind (("C-c r b" . read-aloud-buf)
         ("C-c r t" . read-aloud-this)
         ("C-c r s" . read-aloud-stop)))

(provide '.emacs)
;;; .emacs ends here
