;; Dependencies
(require 'haskell-mode)
(require 'haskell-simple-indent)
(require 'haskell-interactive-mode)
(require 'haskell-font-lock)

;; Basics
(custom-set-variables
 '(haskell-indent-spaces 4)
 '(haskell-indent-offset 4)
 '(haskell-interactive-mode-eval-pretty nil)
 '(haskell-interactive-mode-include-file-name nil)
 '(haskell-process-type 'ghci)
 '(haskell-process-args-ghci '())
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-use-presentation-mode t)
 '(haskell-program-name "/usr/bin/ghci")
 '(inferior-haskell-find-project-root nil))

;; Hooks
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-cabal-mode-hook 'haskell-cabal-mode)

;; Keybinds
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map [f11] 'haskell-process-cabal-build)

(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-cabal-mode-map [f11] 'haskell-process-cabal-build)
(define-key haskell-cabal-mode-map [f12] 'haskell-process-cabal-build-and-restart)

(define-key haskell-interactive-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-interactive-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-interactive-mode-map [f11] 'haskell-process-cabal-build)
(define-key haskell-interactive-mode-map [f12] 'haskell-process-cabal-build-and-restart)
