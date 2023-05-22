;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     ;;lsp
     ;;rust
     (rust :variables
           rust-backend 'lsp  ;; <- Original it was racer, but not used anymore in favor of Rust-analyzer (a.k.a. lsp)
           rust-format-on-save t
           rust-format-show-buffer nil)
     (python :variables
             ;;python-backend 'anaconda ;; <- doesnt workThere are two options: 'ananconda and (default) 'lsp (python-lsp-server package)
             python-formatter 'yapf
             python-format-on-save t
             python-lsp-server 'pylsp ;; 'pylsp (default), 'mspyls (Microsoft python language server), 'pyright (Microsoft pyright language server)
             )
     (lsp :variables
           lsp-rust-server 'rust-analyzer
           )
     (dap :variables
           dap-python-debugger 'debugpy
           dap-auto-configure-mode t)

     emacs-lisp
     (tabs :variables
           tabs-highlight-current-tab 'left
           centaur-tabs-style "wave"
           )
     (search-engine :variables
                    browse-url-browser-function 'browse-url-generic
                    engine/browser-function 'browse-url-generic
                    browse-url-generic-program "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
                    ;;browse-url-generic-program "Google Chrome"
                    )
    ;; (go :variables
    ;;     go-backend 'lsp
    ;;     go-tab-width 4
    ;;     go-format-before-save t)
     (evil-snipe :variables
                 evil-snipe-enable-alternate-f-and-t-behaviors t) ;; <- similar to vim-efl package for f/t evil enhancement.
     (colors :variables colors-colorize-identifiers 'all)
     git
     helm
     markdown
     emacs-lisp
     (multiple-cursors
      :variables
      multiple-cursors-backend  'mc;; other mode  'evil-mc (not support number)
      mc/cmds-to-run-once '(upcase-region)
      )
     osx  ;; This will allow the correct mapping for the command + v (paste)
     org
     ;;(pdf-tools) ;; default (not working)
     pdf
     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)
      (spell-checking :variables
                      spell-checking-enable-by-default nil
                      )
      syntax-checking
      version-control
      (treemacs :variables treemacs-use-all-the-icons-theme t);; Using svg icons
     ;;(xclipboard :variables xclipboard-enable-cliphist t)
     ;;neotree ;; <- Uses nerd icons
     (bm) ;; <- BM provides visible, buffer local, bookmarks adn the ability to jump forward and backward to the next bookmarks
      )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      (company-tabnine ;; for using tab-nine AI auto-assistance
                                        :ensure t
                                        :config
                                        (add-to-list 'company-backends #'company-tabnine))
                                      ;; (evil-matchit
                                      ;;   :ensure t
                                      ;;   :config
                                      ;;   (global-evil-matchit-mode 1) ;; evil-matchit for (% instances)
                                      ;;  )
                                      ;; (evil-owl
                                      ;;   :config
                                      ;;   (setq evil-owl-max-string-length 500)
                                      ;;   (add-to-list 'display-buffer-alist
                                      ;;                '("*evil-owl*"
                                      ;;                  (display-buffer-in-side-window)
                                      ;;                  (side . bottom)
                                      ;;                  (window-height . 0.3)))
                                      ;;   )
                                      ;; ------ Installing beacon -------
                                      (beacon)
                                      (minimap) ;; toggle using minimap-mode
                                      ;;(all-the-icons-dired)
                                      (all-the-icons-completion)
                                      (treemacs-icons-dired)
                                      (treemacs-all-the-icons)
                                      (treemacs-tab-bar)
                                      ;;(treemacs-nerd-icons)
                                      ;;(treemacs-perspective)
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   ;;dotspacemacs-startup-banner 'official
   ;;dotspacemacs-startup-banner 'official
   ;;dotspacemacs-startup-banner (concat dotspacemacs-directory "banner/Emacs-Logo.svg") ;;dotspacemacs-directory "banners/practicalli-logo.svg" banner/Emacs-Logo.svg
   ;;dotspacemacs-startup-banner "/Users/gmbp/.emacs.d/banner/Emacs-Logo.svg"
   dotspacemacs-startup-banner (concat user-emacs-directory "banner/pngegg.png")

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7)
                                )

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;;cyberpunk
                         ;;material
                         ;;darkokai
                         ;;doom-one-gh
                         doom-one
                         nord
                         doom-dracula
                         ;;spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("VictorMono Nerd Font Mono";;"Iosevka"
                               :size 15.0
                               :weight regular
                               :width narrow
                               :powerline-scale 1.0
                               ;; :powerline-offset 1.3
                               )

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 2

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup `trailing

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs t

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; -------------------------------------------------------------
  ;;                     General Setting
  ;; -------------------------------------------------------------
  (setq ns-use-native-fullscreen nil)        ;; will remove the close-button bar
  (setq neo-theme 'icons)                    ;; This will show icons in neotree, instead the class icons layout
  (setq all-the-icons-scale-factor 1.0)      ;; This will control the icon size in neotree
  (setq scroll-margin 5) ; set the scroll margin to 5 lines
  ;;(setq ns-auto-hide-menu-bar t)
  ;;(add-to-list 'default-frame-alist '(undecorated . t)) ;; This will remove the close button-bar
  (set-background-color "#2d333b") ;; This will add a background similar to Github-pages
  ;; Increase the speed of mouse and cursor while scrolling
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 50) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil)
  ;; Allow the spell checking for comment only
  ;; flyspell the basics
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  ;; Auto-completion
  (setq company-idle-delay 1)
  ;; make deft support more note types
  (setq deft-extensions '("md" "txt" "org"))
  (setq deft-default-extension "org")
  ;; by default deft searches for notes only in the root directory, this changes this
  (setq deft-recursive t)
  ;;Disable Annoying Audio Notifications
  ;;(https://emacsredux.com/blog/2016/02/14/disable-annoying-audio-notifications/)
  (setq ring-bell-function 'ignore)
  ;; Disable automatic screen adjustment during scrolling
  ;; vim like scroll behaviour
  ;;(setq scroll-conservatively 100)
  (setq scroll-conservatively 101)
  (setq scroll-step 1)
  (setq scroll-margin 3)
  ;; Increase the fringe width
  (setq-default fringe-mode 'left-only)
  (setq-default left-fringe-width 25)
  (setq-default right-fringe-width 0)

  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  ;; -------------------------------------------------------------
  ;;                     Tabnine Config
  ;; -------------------------------------------------------------
  ;; Trigger completion immediately.
  (setq company-idle-delay 0)
  ;; Number the candidates (use M-1, M-2 etc to select completions).
  (setq company-show-numbers t)

  ;; -------------------------------------------------------------
  ;;                     matchit (%) Config
  ;; -------------------------------------------------------------
  (global-evil-matchit-mode 1)
  ;; -------------------------------------------------------------
  ;;                     Beacon Mode
  ;; -------------------------------------------------------------
  (beacon-mode 1)
  ;; -------------------------------------------------------------
  ;;                     Ranger Mode
  ;; -------------------------------------------------------------
  (setq ranger-show-dotfiles t)
  (setq ranger-parent-depth 0)
  ;; -------------------------------------------------------------
  ;;                     Tab Bar Customized
  ;; -------------------------------------------------------------
  ;; https://github.com/ema2159/centaur-tabs
  (setq centaur-tabs-style "wave")
  (setq centaur-tabs-height 32)
  ;;(setq centaur-tabs-close-button "X")
  ;;(setq centaur-tabs-cycle-scope 'tabs)
  (setq centaur-tabs-label-fixed-length 8)
  ;; ------------------- Evill Key bindings ----------------------
  ;; Notice it will alter the keybinding above of windows
  ;; to cycle between buffers use 'ace-select-window
  ;; ------------------- Navigation among opened buffered --------
  ;; Window navigation key bindings
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)


  ;; bidi aware movement keys for evil
  (define-key evil-normal-state-map "h" 'left-char)
  (define-key evil-normal-state-map "l" 'right-char)
  (define-key evil-normal-state-map [left] 'left-char)
  (define-key evil-normal-state-map [right] 'right-char)
  (define-key evil-visual-state-map "h" 'left-char)
  (define-key evil-visual-state-map "l" 'right-char)
  (define-key evil-visual-state-map [left] 'left-char)
  (define-key evil-visual-state-map [right] 'right-char)

  ;; Make movement keys work like they should
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

  ;; -------------------------------------------------------------
  ;;                   PDF evil-model support
  ;; This will remove the yellow frame around the opened pdf
  ;; -------------------------------------------------------------
 (add-hook 'pdf-view-mode-hook
           (lambda ()
             (set (make-local-variable
                   'evil-evilified-state-cursor)
                  (list nil))))
  ;; -------------------------------------------------------------
  ;;                    Projectile Manager
  ;;          This formula similar how (general) works
  ;; -------------------------------------------------------------
  (spacemacs/set-leader-keys
    "p s" 'projectile-save-project-buffers
    "p /" 'projectile-grep
   )
  ;; -------------------------------------------------------------
  ;;                     dired file manager Customized
  ;; -------------------------------------------------------------

  (with-eval-after-load 'dired
    ;;(define-key dired-mode-map (kbd "M-p") 'peep-dired)
    (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
    (evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
    (evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file))
  ;;(add-hook 'dired-mode-hook 'all-the-icons-dired-mode) ;;<- give us the nerd icons (you need all-the-icons-dired)
  (add-hook 'dired-mode-hook 'treemacs-icons-dired-mode)  ;;<- give us the svg icons (you need treemacs-icons-dired)
  ;; With dired-open plugin, you can launch external programs for certain extensions
  ;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
  (setq delete-by-moving-to-trash t) ;; will allow to send deleted files to the trash, instead permanently delete them.
  (setq dired-open-extensions '(("pdf" . "/opt/homebrew/bin/zathura")
                                ("mp4" . "mpv")))




  ;; -------------------------------------------------------------
  ;;                  emacs print to pdf in OSX
  ;; https://gist.github.com/maltefiala/1048e313111410c12d3e71d1d813cabc
  ;; -------------------------------------------------------------
  ;; Adapted following script to OSX:
  ;; https://genomeek.wordpress.com/2013/03/08/emarch-2-create-a-pdf-with-highlighted-code-source/
  (defun print-to-pdf ()
    (interactive)
    (ps-spool-buffer-with-faces)
    (switch-to-buffer "*PostScript*")
    (write-file "tmp.ps")
    (kill-buffer "tmp.ps")
    (setq cmd (concat "pstopdf tmp.ps -o " (buffer-name) ".pdf"))
    (shell-command cmd)
    (shell-command "rm tmp.ps")
    (message (concat "File printed in : "(buffer-name) ".pdf"))
    )
  ;; -------------------------------------------------------------
  ;;                    Dap (debugger) path
  ;; -------------------------------------------------------------
  ;;(setq dap-gdb-lldb-path "/usr/bin/lldb")
   ;; (with-eval-after-load 'lsp-rust
   ;;   (setq dap-gdb-lldb-path "/Users/gmbp/.vscode/extensions/ms-vscode.cpptools-1.14.5-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi")
   ;;   (require 'dap-lldb)        ;; I don't need this for now as I use lldb-mi
   ;;   (require 'dap-cpptools)    ;; for linux you will need this also
   ;;                              ;;sudo apt-get install libtool-bin
   ;;                              ;;sudo apt-get install libvterm-bin
   ;; )

  ;; -------------------------------------------------------------
  ;;                   Toggle vterm (Space + \)
  ;; -------------------------------------------------------------

  (defun my-toggle-vterm-vertical-split ()
    "Toggle the Vterm window by opening or closing it."
    (interactive)
    (let ((vterm-buffer (get-buffer "*vterm*")))
      (if (and vterm-buffer (get-buffer-window vterm-buffer))
          (delete-window (get-buffer-window vterm-buffer))
        (progn
          (split-window-right)
          (other-window 1)
          ;;(vterm "/bin/zsh")))))
          (vterm)))))

    (spacemacs/set-leader-keys "\\" 'my-toggle-vterm-vertical-split)

  ;; -------------------------------------------------------------
  ;;                   Customized Variables
  ;; -------------------------------------------------------------
  (custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(evil-want-Y-yank-to-eol t)
  '(minimap-window-location 'right)
  '(package-selected-packages
    '(treemacs-icons-dired all-the-icons-ibuffer yasnippet-snippets yapfify xterm-color ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package unfill undo-tree toml-mode toc-org terminal-here term-cursor symon symbol-overlay string-inflection string-edit-at-point sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc smeargle shell-pop rust-mode ron-mode reveal-in-osx-finder restart-emacs request rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort popwin poetry pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer osx-trash osx-dictionary osx-clipboard orgit-forge org-superstar org-rich-yank org-projectile org-present org-pomodoro org-mime org-download org-contrib org-cliplink open-junk-file nose nord-theme neotree nameless mwim multi-vterm multi-term multi-line mmm-mode markdown-toc macrostep lsp-ui lsp-python-ms lsp-pyright lsp-origami lorem-ipsum live-py-mode link-hint launchctl inspector info+ indent-guide importmagic hybrid-mode hungry-delete htmlize holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-git-grep helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates git-timemachine git-modes git-messenger git-link git-gutter-fringe gh-md fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode doom-themes dired-quick-sort diminish devdocs dap-mode cython-mode company-tabnine company-anaconda column-enforce-mode code-cells clean-aindent-mode centered-cursor-mode centaur-tabs cargo browse-at-remote blacken beacon auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile all-the-icons-dired all-the-icons-completion aggressive-indent ace-link ace-jump-helm-line ac-ispell)))


  ;; -------------------------------------------------------------
  ;;                     Color-theme Customized
  ;; -------------------------------------------------------------
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ;;'(hl-line ((t (:background "#335578" :weight bold)))) ;; color the line of your current cursor
   '(line-number ((t (:foreground "#565c69" :weight bold)))) ;; Highlight only the number
   '(font-lock-builtin-face ((t (:foreground "#dcbdfb"))))
   '(font-lock-comment-face ((t (:foreground "#768390"))))
   '(font-lock-function-name-face ((t (:foreground "#dcbdfb"))))
   '(font-lock-keyword-face ((t (:foreground "#f47067"))))
   '(font-lock-string-face ((t (:foreground "#96d0ff"))))
   '(font-lock-variable-name-face ((t (:foreground "#adbac7"))))
   ;; This will highlight the text of -> lsp-ui-sideline-toggle-symbols-info
   '(lsp-ui-sideline-symbol-info ((t (:extend t :background "#21242b" :foreground "#C585B3"))))
   '(markdown-pre-face ((t (:foreground "#f69d50"))))
   ;;'(markdown-url-face ((t (:foreground "#96d0ff" :weight bold)))))
   '(markdown-url-face ((t (:foreground "#96d0ff")))))


)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(minimap-window-location 'right)
 '(package-selected-packages
   '(treemacs-icons-dired all-the-icons-ibuffer yasnippet-snippets yapfify xterm-color ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package unfill undo-tree toml-mode toc-org terminal-here term-cursor symon symbol-overlay string-inflection string-edit-at-point sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc smeargle shell-pop rust-mode ron-mode reveal-in-osx-finder restart-emacs request rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort popwin poetry pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer osx-trash osx-dictionary osx-clipboard orgit-forge org-superstar org-rich-yank org-projectile org-present org-pomodoro org-mime org-download org-contrib org-cliplink open-junk-file nose nord-theme neotree nameless mwim multi-vterm multi-term multi-line mmm-mode markdown-toc macrostep lsp-ui lsp-python-ms lsp-pyright lsp-origami lorem-ipsum live-py-mode link-hint launchctl inspector info+ indent-guide importmagic hybrid-mode hungry-delete htmlize holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-git-grep helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates git-timemachine git-modes git-messenger git-link git-gutter-fringe gh-md fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode doom-themes dired-quick-sort diminish devdocs dap-mode cython-mode company-tabnine company-anaconda column-enforce-mode code-cells clean-aindent-mode centered-cursor-mode centaur-tabs cargo browse-at-remote blacken beacon auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile all-the-icons-dired all-the-icons-completion aggressive-indent ace-link ace-jump-helm-line ac-ispell))
 ;;'(pdf-view-midnight-colors '("#bac1ce" . "#2d333b"))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-directory ((t (:foreground "#51afef" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-comment-face ((t (:foreground "#768390"))))
 '(font-lock-function-name-face ((t (:foreground "#dcbdfb"))))
 '(font-lock-keyword-face ((t (:foreground "#f47067"))))
 '(font-lock-string-face ((t (:foreground "#96d0ff"))))
 '(font-lock-variable-name-face ((t (:foreground "#adbac7"))))
 '(line-number ((t (:foreground "#565c69" :weight bold))))
 '(lsp-ui-sideline-symbol-info ((t (:extend t :background "#21242b" :foreground "#C585B3"))))
 '(markdown-header-face ((t (:inherit bold :foreground "#f89ec4" :height 1.3))))
 '(markdown-header-face-1 ((t (:inherit bold :foreground "#f89ec4" :height 1.3))))
 '(markdown-header-face-2 ((t (:inherit bold :foreground "#c3b1ec" :height 1.2))))
 '(markdown-header-face-3 ((t (:inherit bold :foreground "#a3d4e5" :height 1.1))))
 '(markdown-header-face-4 ((t (:inherit bold :foreground "#ef5552" :height 1.1))))
 '(markdown-header-face-5 ((t (:inherit bold :foreground "#4051b5" :height 1.1))))
 '(markdown-pre-face ((t (:foreground "#b2c9ab" :weight bold))))
 '(markdown-url-face ((t (:foreground "#96d0ff")))))
)
