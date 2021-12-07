;;; Package: --- Summary
;;; Commentary:
;;; Code:

(setq custom-file "~/Sync/.emacs.d/customs.el")
(load custom-file)

(package-initialize)

(require 'smtpmail)
(let ((package 'use-package))
  (unless (package-installed-p package)
    (package-install package)))
(eval-when-compile
  (require 'use-package))
(use-package diminish :ensure t)
(use-package bind-key :ensure t)
;; (require 'diminish)                ;; if you use :diminish
;; (require 'bind-key)                ;; if you use any :bind variant(custom-set-variables

;; Initial setup
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode)
(setq-default show-trailing-whitespace t)


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
(add-hook 'prog-mode-hook #'flymake-mode)

(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)
  ;; :config
  ;; (global-display-line-numbers-mode)
  )

(use-package company
  :ensure t
  :delight
  :hook (after-init . global-company-mode))

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
  (setq projectile-project-search-path '("~/code/"))
  (projectile-mode +1))

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

(use-package lsp-mode
  :ensure t
  :custom
  ;; Optimisations (see lsp-doctor)
  (gc-cons-threshold 100000000)
  (read-process-output-max (* 1024 1024))
  (lsp-completion-provider :capf)
  ;; customisations
  (lsp-idle-delay 0.500)
  :hook ;; (prog-mode . lsp)
  (c-mode-common . lsp)
  (python-mode . lsp)
  (sh-mode . lsp)
  :commands lsp
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

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

"Helm/Ivy lsp"

;; (use-package helm-lsp
;;   :ensure t
;;   :config
;;   (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
;;   )

(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

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

"Development - R"

(use-package ess :ensure t)

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

(use-package pdf-tools :ensure t
  :custom
  (pdf-annot-activate-created-annotations t)
  :config
  (pdf-tools-install)
  ;; Disable swiper
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))

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
  (org-agenda-files (quote ("~/org/")))
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
    ("latexmk -pdflatex='%latex -shell-escape -bibtex -interaction nonstopmode' -pdf -f  %f")))
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

(use-package ob-rust
  :ensure t)

(use-package ox-gfm
  :ensure t
  :after (org))

(use-package org-roam :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org/roam")
  (org-roam-node-display-template
   (concat "${title} " (propertize "${tags}" 'face 'org-tag)))
  (org-roam-capture-ref-templates
   '(("r" "roam-protocol" plain "#+filetags: web stub\n\n${body}\n"
      :target (file+head "webpages/${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  (org-roam-capture-templates
   '(("d" "default" plain "#+filetags: stub\n"
      :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("r" "bibliography reference" plain (file "~/org/templates/reference.org")
      :target (file+head "references/${citekey}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n I" . org-roam-node-insert-immediate)
         ("C-c n c" . org-roam-capture)
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
           (new-text (format "%s#+filetags: stub\n" (caddr target)))
           (new-target (append (butlast target) (list new-text)))
           (new-template (plist-put template :target new-target))
           (org-roam-capture-templates
            (list (append template '(:immediate-finish t)))))
      (message "%s" org-roam-capture-templates)
      (apply #'org-roam-node-insert args)))

  ;; If using org-roam-protocol
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

(use-package org-noter
  :ensure t
  :custom (org-noter-notes-search-path '("~/org/roam/"))
  :config (org-noter))

(use-package org-pomodoro
  :ensure t
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

"Helm/Ivy org"

;; (use-package helm-org
;;   :after helm org
;;   :ensure t)

"Bling - Appearance"

;; (load "~/.emacs.d/sanity.el")
;; (load "~/.emacs.d/elegance.el")

;; (use-package circadian :ensure t
;;   :config
;;   (setq circadian-themes '(("6:00" . standard) ("19:30" . railscast)))
;;   ;; light: blippblopp
;;   ;; dark: desert, railscast, monokai, gruvbox
;;   (circadian-setup))

(defconst dynamic-theme-light-theme 'tsdh-light)
(defconst dynamic-theme-dark-theme 'wombat)

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

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package beacon
  :ensure t
  :delight
  :custom
  (beacon-size 70)
  (beacon-color "#BB00AA")
  :config (beacon-mode))

(use-package all-the-icons :ensure t)

(use-package all-the-icons-dired :ensure t)

;; (use-package pretty-symbols :ensure t)

;; (use-package nyan-mode
;;   :ensure t
;;   :config (nyan-mode))

(use-package telephone-line
  :ensure t
  :custom
  (telephone-line-primary-left-separator 'telephone-line-abs-left)
  (telephone-line-primary-right-separator 'telephone-line-abs-right)
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

;; (use-package ligature
;;   ;; :ensure t
;;   :load-path "~/code/ligature.el"
;;   :config
;;   ;; Enable the "www" ligature in every possible major mode
;;   (ligature-set-ligatures 't '("www"))
;;   ;; Enable traditional ligature support in eww-mode, if the
;;   ;; `variable-pitch' face supports it
;;   (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
;;   ;; Enable all Cascadia Code ligatures in programming modes
;;   (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
;;                                        ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
;;                                        "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
;;                                        "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
;;                                        "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
;;                                        "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
;;                                        "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
;;                                        "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
;;                                        ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
;;                                        "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
;;                                        "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
;;                                        "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
;;                                        "\\\\" "://"))
;;   ;; Enables ligature checks globally in all buffers. You can also do it
;;   ;; per mode with `ligature-mode'.
;;   (global-ligature-mode t))

;; (load "~/Sync/.emacs.d/setup-ligatures.el")

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
  :custom
  (magit-save-repository-buffers 'dontask)
  (git-commit-setup-hook 'git-commit-turn-on-flyspell)
  (git-commit-summary-max-length 50))

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
        '("emil.vatai@riken.jp" "vatai@inf.elte.hu"))
  (let* (
         ;; Riken
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
         ;; ELTE
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
    (setq mu4e-contexts (list riken-ctx elte-ctx)))
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
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

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

(use-package org-ref-ivy)

(use-package org-ref
  :ensure t
  :custom
  ;; (org-ref-insert-cite-function 'org-ref-cite-insert-helm)
  (org-ref-insert-cite-function 'org-ref-cite-insert-ivy)
  ;;
  (bibtex-completion-bibliography "~/org/bib/bibdb.org")
  (bibtex-completion-library-path "~/org/bib/pdfs")
  (bibtex-completion-notes-path "~/org/bib/notes")
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

;; (use-package evil-dvorak :config (global-evil-dvorak-mode))

(provide '.emacs)
;;; .emacs ends here
