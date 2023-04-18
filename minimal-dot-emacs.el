;; Use with emacs -q --load minimal-dot-emacs.el
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/"))
      package-enable-at-startup nil)

(package-initialize)
(let ((package 'use-package))
  (unless (package-installed-p package)
    (package-install package)))
(eval-when-compile
  (require 'use-package))


(use-package pdf-tools :ensure t
  :custom
  (pdf-annot-activate-created-annotations t)
  :config
  (pdf-loader-install)
  ;; Disable swiper
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))
(use-package org-pdftools)
;; (use-package org-noter-pdftools)
(use-package org-noter
  :ensure t
  :custom (org-noter-notes-search-path '("~/org/roam/references/"))
  :config
  (org-noter))
