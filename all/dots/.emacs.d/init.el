(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(powerline
    ;; Themes
    solarized-theme
    twilight-theme
    zenburn-theme
    ;; VCS
    magit
    ;; Clojure
    clojure-mode
    clojure-test-mode
    cider
    ac-nrepl
    ;; Markup
    markdown-mode
    yaml-mode
    ;; Haskell
    flymake-haskell
    flymake-hlint
    haskell-mode
    ghci-completion
    ;; Lisp
    elisp-slime-nav
    paredit
    parenface
    ;; Scala
    scala-mode2
    ;; Javascript
    flymake-jslint
    js-comint
    js2-mode
    ac-js2
    ;; Python
    flymake-python-pyflakes
    nose
    pep8
    pylint
    pymacs
    python
    ;; Misc
    ac-dabbrev
    ack
    idle-highlight-mode
    ido-ubiquitous
    popup
    rainbow-mode
    smex
    yasnippet
    zencoding-mode)
  "A list of packages to ensure are installed at launch.")

;; Install any missing packages.
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Show traces for all tramp messages.
(setq tramp-verbose 10)

;; Directory that stores my customization files.
(setq custom-dir (file-truename (concat user-emacs-directory "config")))

;; Where customization information is stored (custom-set-variables,
;; custom-set-faces etc.).
(setq custom-file (concat custom-dir "custom.el"))

;; Load my customizations.
(dolist (path (directory-files custom-dir t "\\.el$"))
  (load path))

;; Fix path issues.
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))
