# How I installed Emacs 31

To install Emacs 31 on your macOS M1 using the Homebrew formula `emacs-plus@31`
from the repository you mentioned, with the best options for an optimal setup,
you can use the following command:

```sh
brew install emacs-plus@31 --with-ctags --with-dbus --with-debug --with-mailutils --with-xwidgets --with-imagemagick --with-native-comp
```

Here's a breakdown of the selected options:
- `--with-ctags`: Keeps the `ctags` executable provided by Emacs.
- `--with-dbus`: Enables D-Bus support.
- `--with-debug`: Includes debug symbols and debugger-friendly optimizations.
- `--with-mailutils`: Adds support for `mailutils`.
- `--with-xwidgets`: Enables `xwidgets` support.
- `--with-imagemagick`: Adds support for `imagemagick`.
- `--with-native-comp`: Enables native compilation (via `gccemacs`).

This setup provides a well-rounded Emacs installation with support for various
utilities, debugging, and enhanced features.


## More details
Here are the flags I skipped and the reasons why:

1. **`--with-no-frame-refocus`**: This disables frame re-focus, meaning closing
   one frame does not refocus another one. It is generally useful if you want
   Emacs to change its focus behavior, but it's not essential for most users.

2. **`--with-x11`**: Enables X11 support. Since you are on macOS, X11 support is
   typically unnecessary unless you are working with specific X11 applications
   or prefer using Emacs in an X11 environment.

3. **`--without-cocoa`**: Builds a non-Cocoa version of Emacs (terminal only).
   Given that you are on macOS, the Cocoa version provides a more integrated and
   feature-rich GUI experience. The non-Cocoa version is more suited for
   terminal-only usage, which limits the GUI capabilities.

4. **`--with-poll`**: Uses `poll()` instead of `select()` to enable more file
   descriptors. This is a specific performance-related option that might not be
   necessary unless you are experiencing issues with the number of file
   descriptors in use.

Including these flags is unnecessary for a typical setup aimed at providing a
balanced mix of functionality and performance tailored to macOS. If you have
specific needs for any of the omitted flags, you can include them based on your
usage requirements.

## Can I imporve the Emacs performance?

Emacs traditionally runs in a single-threaded mode for most of its operations.
However, there are some developments and configurations that can help leverage
multiple cores to some extent, especially with native compilation and
asynchronous tasks.

Here are a few steps and options to optimize Emacs for better performance on
multi-core systems:

1. **Enable Native Compilation**: The native compilation feature, introduced
   with Emacs 28, can significantly improve performance by compiling Emacs Lisp
   code to native code. This feature can take advantage of multiple cores during
   the compilation process.

2. **Use Asynchronous Operations**: Emacs can perform certain operations
   asynchronously, which can help in making it more responsive. For example,
   `async` package allows running Emacs Lisp functions asynchronously.

3. **Garbage Collection Optimization**: Adjusting the garbage collection
   settings can help improve performance. A common optimization is to increase
   the threshold before garbage collection is triggered.

To enable native compilation and make the most out of your multi-core processor,
you can include the `--with-native-comp` flag in your installation command, as
it is already considered.

Additionally, you can add the following settings to your Emacs configuration
file (`.emacs` or `init.el`) to further optimize performance:

```elisp
;; Enable native compilation if available
(setq comp-deferred-compilation t)

;; Increase garbage collection threshold for better performance
(setq gc-cons-threshold 100000000)

;; Use async package for asynchronous operations
(use-package async
  :ensure t
  :config
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1))

;; Optimize file watching (useful if you are working with many files)
(setq auto-revert-use-notify nil
      auto-revert-interval 3)

;; Additional native compilation settings (if available)
(when (featurep 'native-compile)
  (setq native-comp-deferred-compilation t
        native-comp-async-report-warnings-errors nil))

;; Adjust maximum number of bytes of a cons cell before a GC is triggered
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Restore default values after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 800000
                  gc-cons-percentage 0.1)))
```

### Full Installation Command:
To summarize, here is the full installation command incorporating all the
suggested options:

```sh
brew install emacs-plus@31 --with-ctags --with-dbus --with-debug --with-mailutils --with-xwidgets --with-imagemagick --with-native-comp
```

### Additional Configuration:
Add the provided configuration settings to your Emacs configuration file to
optimize performance further.

By following these steps, you can make Emacs leverage multiple cores more
effectively and improve its overall performance.



## How to increase the speed of Emacs

You can increase the cursor speed in Spacemacs when using `evil-mode` by
adjusting the key repeat rate and configuring Spacemacs settings for a more
responsive experience.

### Adjusting Key Repeat Rate

On macOS, you can adjust the key repeat rate system-wide, which will affect how
quickly the cursor moves when you hold down a movement key in `evil-mode`. You
can do this via the Terminal:

```sh
# Set a fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
# Set a short delay until key repeat starts
defaults write NSGlobalDomain InitialKeyRepeat -int 10
```

After running these commands, you may need to log out and back in, or restart
your Mac, for the changes to take effect.

### Spacemacs Configuration

To ensure a smooth experience in Spacemacs and `evil-mode`, you can also adjust
some Spacemacs-specific settings.

#### Update `dotspacemacs/user-config`

Add the following to your Spacemacs configuration file (`.spacemacs`) in the
`dotspacemacs/user-config` section:

```elisp
(defun dotspacemacs/user-config ()
  ;; Increase the evil-mode cursor speed
  (setq evil-move-cursor-back nil)
  (setq evil-move-beyond-eol t)
  (setq evil-want-C-u-scroll t)

  ;; Other custom configurations
  ;; ...
)
```

#### Additional Settings for `evil-mode`

You can tweak more `evil-mode` settings to enhance the cursor movement responsiveness:

```elisp
(defun dotspacemacs/user-config ()
  ;; Enable smooth scrolling
  (setq scroll-margin 5
        scroll-conservatively 10000
        scroll-preserve-screen-position 1
        auto-window-vscroll nil)

  ;; Make cursor movement more responsive
  (setq redisplay-dont-pause t)

  ;; Set a higher debounce time for faster feedback
  (setq jit-lock-defer-time 0)

  ;; Speed up cursor movement in visual state
  (setq evil-visual-state-cursor 'box)

  ;; Faster cursor movements in insert state
  (setq evil-insert-state-cursor 'bar)

  ;; Increase the evil-mode cursor speed
  (setq evil-move-cursor-back nil)
  (setq evil-move-beyond-eol t)
  (setq evil-want-C-u-scroll t)

  ;; Other custom configurations
  ;; ...
)
```

### Full Configuration Example

Here is an example of the full configuration with the recommended settings:

```elisp
(defun dotspacemacs/user-config ()
  ;; Enable smooth scrolling
  (setq scroll-margin 5
        scroll-conservatively 10000
        scroll-preserve-screen-position 1
        auto-window-vscroll nil)

  ;; Make cursor movement more responsive
  (setq redisplay-dont-pause t)

  ;; Set a higher debounce time for faster feedback
  (setq jit-lock-defer-time 0)

  ;; Speed up cursor movement in visual state
  (setq evil-visual-state-cursor 'box)

  ;; Faster cursor movements in insert state
  (setq evil-insert-state-cursor 'bar)

  ;; Increase the evil-mode cursor speed
  (setq evil-move-cursor-back nil)
  (setq evil-move-beyond-eol t)
  (setq evil-want-C-u-scroll t)

  ;; Your existing configurations
  (setq dotspacemacs-gc-cons '(100000000 0.1))
  ;; Other custom configurations
)
```

By making these adjustments, you should experience a noticeable improvement in
cursor speed and overall responsiveness when using `evil-mode` in Spacemacs.
