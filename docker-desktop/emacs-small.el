;; This is Ward's .emacs file.
;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(normal-erase-is-backspace-mode 1)

;; set compilation scroll output
(setq compilation-scroll-output t)

;; Set Font
(set-face-attribute 'default nil :height 130)

;; Set fill-column to 80 chars, tab width to 4
(setq-default fill-column 80)
(setq-default default-tab-width 4)
(setq-default indent-tabs-mode nil)

;; Delete trailing Whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Add cmake listfile names to the mode list.
(setq auto-mode-alist
        (append
	    '(("CMakeLists\\.txt\\'" . cmake-mode))
	       '(("\\.cmake\\'" . cmake-mode))
	          auto-mode-alist))


;;(autoload 'cmake-mode "~/.emacs.d/cmake-mode.el" t)
;; You can have multiple entries here, which is useful
;; since we want to use this configuration file on multiple
;; machines which may have cmake installed in different places.
(autoload 'cmake-mode "/usr/local/share/cmake/editors/emacs/cmake-mode.el" t)
;;(autoload 'cmake-mode "/usr/local/share/cmake-2.8/editors/emacs/cmake-mode.el" t)
;;(autoload 'cmake-mode "/Users/wfisher/local/share/cmake-3.0/editors/emacs/cmake-mode.el" t)
;;(autoload 'cmake-mode "/usr/local/share/cmake-3.0/editors/emacs/cmake-mode.el" t)
