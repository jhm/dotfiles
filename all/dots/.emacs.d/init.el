(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Show traces for all tramp messages.
(setq tramp-verbose 10)

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
  "Packages to ensure are installed at launch.")

;; Directory that stores my customization files.
(setq config-dir (file-truename (concat user-emacs-directory "config/")))

;; Where machine specific customization information is stored
;; (custom-set-variables, custom-set-faces etc.).
(setq custom-file (concat config-dir "custom.el"))

(defvar configs
  `("global"
    "functions"
    "git"
    "haskell"
    "js"
    "lisp"
    "python")
  "Customization files that will be loaded at launch.")

;; Install any missing packages.
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Load my customizations.
(dolist (config configs)
  (load (concat config-dir config ".el")))

;; Fix path issues.
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))
