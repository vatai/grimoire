;; Use with emacs -q --load minimal-dot-emacs.el
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/"))
      package-enable-at-startup nil)

(let ((package 'use-package))
  (unless (package-installed-p package)
    (package-install package)))
(eval-when-compile
  (require 'use-package))
