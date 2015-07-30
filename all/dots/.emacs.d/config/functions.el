;; Some convenience functions.

(defun google-region ()
  "Google the selected region."
  (interactive)
  (browse-url (concat "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
                      (buffer-substring (region-beginning) (region-end)))))

(defun insert-date ()
  "Insert a timestamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(defun lorem-ipsum ()
  "Insert a lorem ipsum paragraph at point."
  (interactive)
  (insert
   (concat "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed "
           "do eiusmod tempor incididunt ut labore et dolore magna aliqua."
           " Ut enim ad minim veniam, quis nostrud exercitation ullamco "
           "laboris nisi ut aliquip ex ea commodo consequat. Duis aute "
           "irure dolor in reprehenderit in voluptate velit esse cillum "
           "dolore eu fugiat nulla pariatur. Excepteur sint occaecat "
           "cupidatat non proident, sunt in culpa qui officia deserunt "
           "mollit anim id est laborum.")))

(defun view-url ()
  "Open a new buffer containing the contents of a URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
         (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    (cond
     ((search-forward "<?xml" nil t) (xml-mode))
     ((search-forward "<html" nil t) (html-mode)))))

(defun enable-linum ()
  (interactive)
  (require 'linum)
  (global-linum-mode t)
  (set-fringe-mode 0)
  (setq linum-format "%3d "))

(defun disable-linum ()
  (interactive)
  (global-linum-mode -1)
  (linum-mode -1))

(defun my-zenburn ()
  "Load a customized version of zenburn."
  (interactive)
  (load-theme 'zenburn t)
  (set-fringe-style '(8 . 0))
  (set-background-color "#222")
  (set-face-background 'fringe "#1a1a1a")

  (set-face-attribute 'mode-line nil
    :foreground "999999" :background "#000000" :box nil)

  (set-face-attribute 'mode-line-inactive nil
    :foreground "#444444" :background "#1a1a1a" :box nil))

(defun my-default-theme ()
 "Slightly modifies the default theme."
 (interactive)
 (set-background-color "#fafafa")
 (set-face-background 'fringe "#f2f2f2")

 (set-fringe-style '(8 . 0))

 (set-face-attribute 'mode-line nil
    :foreground "#ccc" :background "#000000" :box nil)

  (set-face-attribute 'mode-line-inactive nil
    :foreground "#333" :background "#f2f2f2" :box nil))
