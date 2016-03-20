;; Key bindings
(global-set-key (kbd "C-c RET") 'compile)
(global-set-key (kbd "C-x <down>") 'next-error)
(global-set-key (kbd "C-x <up>") 'previous-error)

;; Jump to error
(setq compilation-skip-threshold 2) ;; 2 skips warnings

;; Load addons
(add-to-list 'load-path "~/.emacs.d/extra/")

;; Editor-config 
;; https://github.com/editorconfig/editorconfig-emacs
(require 'editorconfig)
(editorconfig-mode 1)

;; Protobuf-mode
;; http://melpa.org/packages/protobuf-mode-20150521.2011.el
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
(require 'protobuf-mode)

;; Column-marker
;; http://www.emacswiki.org/emacs/download/column-marker.el
(require 'column-marker)
(add-hook 'c++-mode-hook (lambda () (interactive) (column-marker-2 80)))

;; Rainbow parenthesis
;; https://raw.githubusercontent.com/jlr/rainbow-delimiters/master/rainbow-delimiters.el
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(setq src (getenv "src"))
(setq app (getenv "app"))

(custom-set-variables
 '(compile-command (concat "cd " src "; make -j && make install && cd " app " && make")))
