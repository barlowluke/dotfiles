(tool-bar-mode -1)               ; hide outdated icons
(scroll-bar-mode -1)             ; hide scrollbar
(setq inhibit-startup-message t) ; remove splash screen
(setq use-file-dialog nil)       ; ask for text confirmation instead of GUI

(global-display-line-numbers-mode 1) ; show line numbers in every buffer

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)
(setq use-package-always-defer t)

;; remove initial scratch message
(use-package emacs
  :init
  (setq initial-scratch-message nil)
  (defun display-startup-echo-area-message ()
    (message "")))

(use-package emacs
  :init
  (defalias 'yes-or-no-p 'y-or-n-p))

(use-package emacs
  :init
  (set-charset-priority 'unicode)
  (setq locale-coding-system 'utf-8
        coding-system-for-read 'utf-8
        coding-system-for-write 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix)))

(use-package emacs
  :init
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2))

(use-package evil
  :demand ; No lazy loading
  :config
  (evil-mode 1))

(use-package doom-themes
  :demand
  :config
  (load-theme 'doom-challenger-deep t))

(use-package emacs
  :init
  (defun ab/enable-line-numbers ()
    "Enable relative line numbers"
    (interactive)
    (display-line-numbers-mode)
    (setq display-line-numbers 'relative))
  (add-hook 'prog-mode-hook #'ab/enable-line-numbers))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package nerd-icons)

(setq custom-file (make-temp-file ""))

(use-package
  org
  :straight (:type built-in)
  :mode ("\\.org\\'" . org-mode)
  :bind (:map org-mode-map
        ("M-n" . outline-next-visible-heading)
        ("M-p" . outline-previous-visible-heading)
        ("M-RET" . org-meta-return)
        ("C-c l" . org-store-link)
        ("C-c a" . org-agenda)
        ("M-<" . grym/go-to-first-heading))
  :config
  ;; fontify code in code blocks
  (setq org-src-fontify-natively t)
  ;; Enable org capture
  (require 'org-capture)
  ;; Enable template expansion (<s, <q, etc.)
  (require 'org-tempo)
  ;; ignore flycheck files when looking in agenda
  (setq org-agenda-file-regexp
        "\\`[^\\(.\\|flycheck_\\)].*\\.org\\'")
  ;; log  TODO state changes into the default LOGBOOK drawer.
  (setq org-log-into-drawer t)
  ;; wrap agenda tags properly for alignment
  (setq org-agenda-tags-column
        -79)
  ;; start with follow-mode on in agenda
  (setq org-agenda-start-with-follow-mode
        t)
  ;; add counsel-mode to org speecbars
  (setq org-use-speed-commands t)

  (setq org-speed-commands
          (append
           '(("User-defined commands")
             ;;("o" . counsel-outline)
             ("o" . consult-org-heading)
             ("O" . org-open-at-point)
             ("w" . avy-org-refile-as-child)
             ("W" . org-refile)
             ("q" . bury-buffer))
           org-speed-commands))


  ;; make org-agenda-cycle shut up
  (require 'bind-key)
  (unbind-key "C-'" org-mode-map)
  (unbind-key "C-," org-mode-map)
  )
