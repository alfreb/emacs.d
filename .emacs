
;; Load addons
(add-to-list 'load-path "~/.emacs.d/extra/")

;; Editor-config 
;; https://github.com/editorconfig/editorconfig-emacs
(require 'editorconfig)
(editorconfig-mode 1)

;; Protobuf-mode
;; http://melpa.org/packages/protobuf-mode-20150521.2011.el
;; (add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
;; (require 'protobuf-mode)

;; Column-marker
;; http://www.emacswiki.org/emacs/download/column-marker.el
(require 'column-marker)
(add-hook 'c++-mode-hook (lambda () (interactive) (column-marker-2 80)))

;; Rainbow parenthesis
;; https://raw.githubusercontent.com/jlr/rainbow-delimiters/master/rainbow-delimiters.el
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Column-numbers
(column-number-mode)

(setq INCLUDEOS_SRC (or (getenv "INCLUDEOS_SRC") "~/IncludeOS"))
(setq OS (or (getenv "OS") (concat INCLUDEOS_SRC "/src")))
(setq APP (or (getenv "APP") (concat INCLUDEOS_SRC "/examples/demo-service" )))

(defun setapp (name)
  (interactive "MApp: ") 
  ;; Verify that the app exists, otherwise error
  (setq selected-dir name)
  (when (not (file-exists-p selected-dir))
    (error (concat selected-dir " doesn't exist")))
  ;; Make it idempotent
  (progn (when (string= selected-dir APP) (error "App allready selected")) 
	 (setq APP selected-dir)
	 (shell-command (concat "~/.emacs.d/setapp.sh " name))
	 (print (concat "APP is now " selected-dir))))

(defun str-make-path-target (path target)
  (concat "cd " path " && make " target " "))

(defun make-path-target (path target)
  (compile (str-make-path-target path target)))

(defun make-install (path)
  (compile (str-make-path-target path "install")))

(defun make-app ()
  (interactive 
   (let ((string (read-string "Build App target: " nil  'my-history)))
     (make-path-target APP string))))

(defun make-os ()
  (interactive 
   (let ((string (read-string "Build OS target: " nil 'my-history)))
     (make-path-target OS string))))


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
					 

(defun make ()
  (interactive 
   (let ((target (read-string "Build OS+App target: " (car my-history) 'my-history)))
     (let ((default-directory APP))
       (compile (concat (str-make-path-target OS target) " && "
			(str-make-path-target OS "install") " && "
			(str-make-path-target APP target)))))))
   

(defun format-buffer ()
  "Format the whole buffer."
  ;;(c-set-style "stroustrup")
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  (editorconfig-apply)
  (goto-char (point-max))
  (delete-blank-lines)
  (save-buffer))

;; Key bindings
(global-set-key (kbd "C-c RET") 'make-app)
(global-set-key (kbd "C-c a") 'make)
(global-set-key (kbd "C-c o") 'make-os)
(global-set-key (kbd "C-x <down>") 'next-error)
(global-set-key (kbd "C-x <up>") 'previous-error)
(global-set-key (kbd "C-c c") 'clean)

;; Jump to error
(setq compilation-skip-threshold 2) ;; 2 skips warnings

