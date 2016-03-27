;; Show traces for all tramp messages.
(setq tramp-verbose 10)

(setq config-dir (file-truename (concat user-emacs-directory "config/")))
;;(add-to-list 'load-path config-dir)

;; Where machine specific customization information is stored
;; (custom-set-variables, custom-set-faces etc.).
(setq custom-file (concat config-dir "custom.el"))

(org-babel-load-file (concat config-dir "core.org"))
