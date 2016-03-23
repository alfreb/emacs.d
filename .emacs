
;; Jump to error(setq compilation-skip-threshold 2) ;; 2 skips warnings

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

(setq OS (getenv "OS"))
(setq APP (getenv "APP"))

(defun str-make-path-target (path target)
  (concat "cd " path " && make " target " -j "))

(defun make-path-target (path target)
  (compile (str-make-path-target path target)))

(defun make-install (path)
  (compile (str-make-path-target path "install")))

(defun make-app (target)
  (interactive "MBuild-target: ")
  (make-path-target APP target))

(defun make-os (target)
  (interactive "MBuild-target ")
  (make-path-target OS target))

(defun clean-app ()
  (interactive)
  (make-path-target APP "clean"))

(defun clean-os ()
  (interactive)
  (make-path-target OS "clean"))

(defun clean ()
  (interactive)
  (compile (concat (str-make-path-target OS "clean") " && "
		   (str-make-path-target APP "clean"))))
					 

(defun make (target)
  (interactive "MBuild-target ")
  (compile (concat (str-make-path-target OS target) " && "
		   (str-make-path-target OS "install") " && "
		   (str-make-path-target APP target))))


;; Key bindings
(global-set-key (kbd "C-c RET") 'make)
(global-set-key (kbd "C-x <down>") 'next-error)
(global-set-key (kbd "C-x <up>") 'previous-error)
(global-set-key (kbd "C-c c") 'clean)