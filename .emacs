;; Key bindings
(global-set-key (kbd "C-c RET") 'compile)
(global-set-key (kbd "C-x <down>") 'next-error)
(global-set-key (kbd "C-x <up>") 'previous-error)

;; Jump to error                                                                                                                  
(setq compilation-skip-threshold 1) ;; 2 skips warnings            

(add-to-list 'load-path "~/.emacs.d/extra/")
(require 'protobuf-mode)
(require 'editorconfig)
(editorconfig-mode 1)

(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
