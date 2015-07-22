;; Basics
(set-language-environment "UTF-8")
(show-paren-mode 1)
(global-hl-line-mode)
(setenv "PAGER" "cat")

(custom-set-variables
 '(auto-save-file-name-transforms
   `((".*" ,(expand-file-name "~/.emacs.d/backups") t)))
 '(backup-directory-alist
    `((".*" . ,(expand-file-name "~/.emacs.d/backups"))))
 '(inhibit-startup-screen t)
 '(inhibit-startup-echo-area-message t)
 '(save-place-file "~/.emacs.d/places")
 '(sentence-end-double-space nil)
 '(show-paren-mode t))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

; Hide menubar, toolbar and scrollbar.
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Defaults
(set-default 'tab-width 4)
(set-default 'c-basic-offset 4)
(set-default 'scroll-step 1)
(set-default 'indicate-empty-lines nil)
(set-default 'indent-tabs-mode nil)
(set-default 'imenu-auto-rescan t)

;; Hooks
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'auto-tail-revert-mode 'tail-mode)

;; Unique buffer names
(require 'uniquify)

;; Auto completion and yasnippet
(require 'auto-complete-config)
(ac-config-default)
(yas-global-mode 1)

;; Speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil
      sr-speedbar-skip-other-window-p t)

; Disable linum for speedbar.
(add-hook 'speedbar-mode-hook '(lambda () (linum-mode 0)))

;; Powerline
(require 'powerline)
(powerline-vim-theme)

;; Theme
(load-theme 'twilight)

;; Ido
(ido-mode t)
(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;; Add syntax highlighting for code blocks in org-mode
(setq org-src-fontify-natively t)

;; Smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; Keybinds
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-c c m") 'comment-or-uncomment-region)

; Use regex searches
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

; Jump to definition
(global-set-key (kbd "C-x C-i") 'imenu)

; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)

; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)
; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

(global-set-key (kbd "C-c g") 'magit-status)

; Help should search more than just commands.
(global-set-key (kbd "C-h a") 'apropos)
