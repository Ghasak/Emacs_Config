
;; You will most likely need to adjust this font size for your system!
(defvar runemacs/default-font-size 150)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell nil)
;; will remove the annoying warning sound
(setq ring-bell-function 'ignore)


(set-face-attribute 'default nil
		    :font "SFMono Nerd Font"
		    :height runemacs/default-font-size)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-one t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  )

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))
;; ----------------- Helm Package ----------------------
(use-package helm
  :config
  (helm-mode 1)

  )

;; ----------------- General Package -------------------
(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")


  (rune/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")
    ;;"ff" '(counsel-find-file :which-key "find file")
    "ff" '(helm-find-files :which-key "helm find file")
    ;;"bb" '(counsel-ibuffer :which-key "find buffer")
    "bb" '(helm-mini :which-key "helm find buffer")
    "r"  '(counsel-minibuffer-history :which-key "minibuffer-history")
    "fr"  '(helm-recentf :which-key "helm recnet file")
    ;;"SPC" '(counsel-M-x :which-key "Counsel Panel")
    "fs"  '(save-buffer :which-key "Save file")
    "bs"  '(save-buffer :which-key "Save buffer")
    "SPC" '(helm-M-x    :which-key "Helm Panel")
    "ft" '(neotree-toggle    :which-key "neotree-toggle")
    )
  )

;; ----------------- Evil Package -------------------
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))



;; -------------------  Key bindings ----------------------
(define-key emacs-lisp-mode-map (kbd "C-x M-t") 'counsel-load-theme)

;; ------------------------ Helm Configurations ------------------
;; Helm selection key bindings
(with-eval-after-load 'helm
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  )
;; Set Helm prompt position to top
(setq helm-split-window-default-side 'down) ;; above
(setq helm-split-window-in-side-p t
      helm-move-to-line-cycle-in-source t)
;; Position Helm prompt at the top
;;(setq helm-display-header-line t)
;; Position Helm command line at the top
(setq helm-echo-input-in-header-line t)


;;------------- Centaur tabs ---------------------
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  )

(rune/leader-keys
       "g t"   '(centaur-tabs-backward :which-key "centaur tab backward")
       "g T"   '(centaur-tabs-forward :which-key "centaur tab forward")
  )

(define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-backward)
(define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-forward)

(setq centaur-tabs-height 32)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-set-bar 'left)
;; --------  neotree config --------------------

(use-package neotree)

;; ---------------------- Background of Emacs ----------------
(set-background-color "#2d333b") ;; This will add a background similar to Github-pages
;; --------------------------------------------------------------

;; --------------------------------------------------------------
;; ------------ all the icons --------
;; --------------------------------------------------------------
(use-package all-the-icons)
;;  ------------------ Buffers and bookmarks -------------------
(rune/leader-keys
       ;;"b b"   '(ibuffer :which-key "Ibuffer")
       "b b"   '(helm-mini :which-key "helm find buffer")
       "b c"   '(clone-indirect-buffer-other-window :which-key "Clone indirect buffer other window")
       "b k"   '(kill-current-buffer :which-key "Kill current buffer")
       "b n"   '(next-buffer :which-key "Next buffer")
       "b p"   '(previous-buffer :which-key "Previous buffer")
       "b B"   '(ibuffer-list-buffers :which-key "Ibuffer list buffers")
       "b K"   '(kill-buffer :which-key "Kill buffer")
       ;;"b h"   '(lambda () (interactive) (switch-to-buffer "*dashboard*") :which-key "home buffer")
       "b h"   '(lambda () (interactive) (dashboard-open) :which-key "home buffer")

       )

;; --------------------------------------------------------------
(use-package dashboard
  :init      ;; tweak dashboard config before loading it
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner "~/.emacs.d/banner/doom3.iconset/icon_256x256.png")  ;; use custom image as banner
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 3)
                          (projects . 3)
                          (registers . 3)))
  )
;; =========================================================================================

;; --------------------------------------------------------------
;;DELETE SELECTION MODE
;; By default in Emacs, we don’t have ability to select text, and then start typing and our new text replaces the selection.  Let’s fix that!
(delete-selection-mode t)
;;  ------------------ Dired file manager -------------------
(use-package all-the-icons-dired)
(use-package dired-open)
(use-package peep-dired)
(rune/leader-keys
       "d d"   '(dired     :which-key "Open dired file manager")
       "f d"   '(dired     :which-key "Open dired file manager")
       "d j"   '(dired-jump :which-key "Jump to current director in dired")
       "f j"   '(dired-jump :which-key "Jump to current director in dired")
       "d v"   '(dired-view-file :which-key "View file in dired")
       "d h"   '(dired-up-directory :which-key "Go up in directory tree")
       "f h"   '(dired-up-directory :which-key "Go up in directory tree")
       "d l"   '(dired-find-file :which-key "Go down in directory tree (or open if file")
       "f l"   '(dired-find-file :which-key "Go down in directory tree (or open if file")
)
(with-eval-after-load 'dired
  ;;(define-key dired-mode-map (kbd "M-p") 'peep-dired)
  (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
  (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
  (evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
  (evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file))

(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

;; Enable icons in Dired mode
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))
;; --------------------------------------------------------------
;;                  GENERAL KEYBINDING
;; --------------------------------------------------------------

(rune/leader-keys
       "c c"   '(compile :which-key "Compile")
       "c C"   '(recompile :which-key "Recompile")
       "q r" '((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :which-key "Reload emacs config")

)
;; avoid constant errors on windows about the coding system by setting the default to UTF-8
(set-default-coding-systems 'utf-8)
;; --------------------------------------------------------------
;;                  TERMINAL IN EMCAS
;; --------------------------------------------------------------
(use-package vterm)
(setq shell-file-name "/bin/zsh"
      vterm-max-scrollback 5000)

;; --------------------------------------------------------------
;;                  SPLIT AND WINDOW CCONTROLS
;; --------------------------------------------------------------
(winner-mode 1)
(rune/leader-keys
       ;; Window splits
       "w c"   '(evil-window-delete :which-key "Close window")
       "w n"   '(evil-window-new :which-key "New window")
       "w s"   '(evil-window-split :which-key "Horizontal split window")
       "w v"   '(evil-window-vsplit :which-key "Vertical split window")
       ;; Window motions
       "w h"   '(evil-window-left :which-key "Window left")
       "w j"   '(evil-window-down :which-key "Window down")
       "w k"   '(evil-window-up :which-key "Window up")
       "w l"   '(evil-window-right :which-key "Window right")
       "w w"   '(evil-window-next :which-key "Goto next window")
       ;; winner mode
       "w <left>"  '(winner-undo :which-key "Winner undo")
       "w <right>" '(winner-redo :which-key "Winner redo"))

;; ------------------- Evill Key bindings ----------------------
;; Notice it will alter the keybinding above of windows
;; ------------------- Navigation among opened buffered --------
;; Window navigation key bindings
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
;; --------------------------------------------------------------


;; --------------------------------------------------------------
;;                      SCROLLING
;; --------------------------------------------------------------
;;(setq scroll-conservatively 101) ;; value greater than 100 gets rid of half page jumping
(setq scroll-conservatively 140) ;; value greater than 100 gets rid of half page jumping
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; how many lines at a time
(setq mouse-wheel-progressive-speed t) ;; accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; --------------------------------------------------------------

;; --------------------------------------------------------------
;;                Keep .emacs.d clean
;; --------------------------------------------------------------

;; Change the user-emacs-directory to keep unwanted things out of ~/.emacs.d
(setq user-emacs-directory (expand-file-name "~/.cache/emacs/")
      url-history-file (expand-file-name "url/history" user-emacs-directory))

;; Use no-littering to automatically set common paths to the new user-emacs-directory
(use-package no-littering)

;; Keep customization settings in a temporary file (thanks Ambrevar!)
(setq custom-file
      (if (boundp 'server-socket-dir)
          (expand-file-name "custom.el" server-socket-dir)
        (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))
(load custom-file t)

;; --------------------------------------------------------------
;; --        r emacs configurations for emacsclient
;; --------------------------------------------------------------


(if (daemonp)
    (message "Loading in the daemon!")
    (message "Loading in regular Emacs!"))

(defun efs/set-font-faces ()
  (message "Setting faces!")
  (set-face-attribute 'default nil :font "SFMono Nerd Font" :height runemacs/default-font-size)

  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil :font "SFMono Nerd Font" :height runemacs/default-font-size)

  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil :font "SFMono Nerd Font" :height runemacs/default-font-size :weight 'regular))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                ;; (setq doom-modeline-icon t)
                (with-selected-frame frame
                  (efs/set-font-faces))))
    (efs/set-font-faces))

(setq doom-modeline-icon t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; --------------------------------------------------------------
;; --------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(zuul all-the-icons-dired neotree neo-tree centaur-tabs hydra evil-collection which-key use-package rainbow-delimiters ivy-rich helpful general evil doom-themes doom-modeline counsel command-log-mode all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-comment-face ((t (:foreground "#768390"))))
 '(font-lock-function-name-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-keyword-face ((t (:foreground "#f47067"))))
 '(font-lock-string-face ((t (:foreground "#96d0ff"))))
 '(font-lock-variable-name-face ((t (:foreground "#adbac7"))))
 '(lsp-ui-sideline-symbol-info ((t (:extend t :background "#21242b" :foreground "#C585B3"))))
 '(markdown-pre-face ((t (:foreground "#f69d50"))))
 '(markdown-url-face ((t (:foreground "#96d0ff" :weight bold))))
 )
