# macOS with Emacs
## System properties
I am running `Emacs` on `macOS M1`

```shell
sw_vers
ProductName:          macOS
ProductVersion:       13.3.1
ProductVersionExtra:  (a)
unname -m
arm64
sysctl hw.memsize
hw.memsize: 6871947673
```

## Apple M1 Max
There are several `emacs` versions available for `macOS` that will not all of
them compatible with our current machine. It seems If you use the following
builds, you will not get the `debugging` from `dap` layer in `spacemacs`
(a.k.a. `dap-mode`) to work. These installation `Emacs` app are

- If you use `emacsformacosx.com`
- If you use `brew install cask emacs` (installs from emacsformacosx.com)
- If you use `XEmacs`

Read more about this
[here](https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org).
Later, It turns that if you install `Emacs` with one of these solutions and
calling the `lsp` with `dap` layers, your `spacemacs` will not work,
furthermore, your `lsp` will not work as you intended (e.g., `rust` will not
use `rust-analayzer`, or `python` will not use `pyright`). Then I found that
the reason is the `svg` icons in these builds is not supported.

- I use `emacsport` version (pre-built), This what works for me. I found this
  from the following
  [link](https://github.com/railwaycat/homebrew-emacsmacport). It offers good
  integration with macOS, native emojis and better childframe support.. t
  offers good integration with macOS, native emojis and better childframe
  support. The solution here is posted in the following `Reddit link` [How do I
  enable SVG support for Emacs on OS X
  (Homebrew)?](https://www.reddit.com/r/emacs/comments/33zur0/how_do_i_enable_svg_support_for_emacs_on_os_x/)

```shell
brew install --cask emacs-mac-spacemacs-icon
```
- Support macOS versions:

| system        | version   |
| --------      | --------- |
| Intel         | Mac       |
| Monterey      | (macOS12) |
| Big Sur       | (macOS11) |
| Ventura       | (macOS13) |
| Apple Silicon | Mac       |
| Monterey      | (macOS12) |
| Ventura       | (macOS13)

- [didn't work for me] Alternatively, you can `build` for your system using either
  `emacs-mac` version which is based on the note
  [here](https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org)
  using

```shell
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules
ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications/Emacs.app
# The above link is not corrct you should map it to /opt/homebrew/bin/emacs
```
- [didn't work for me] Or, we can use the following command to build aslo, I
  found it in `Reddit`
  [here](https://www.reddit.com/r/emacs/comments/z2kq1d/help_a_newbie_out/)

```shell
brew install emacs-mac --with-librsvg --with-emacs-sexy-icon --with-natural-title-bar --with-starter --with-mac-metal --with-imagemagick --with-native-comp
```

- Now, the current build will affect your `macOS` binding by changing the keys
  `meta/alt` for the `command` key, so you cannot use `copy-paste` anymore.
  Fortunately, `spacemacs` has a layer called `osx` just call in and you will
  be able to get the mapping correctly. See below

```lisp
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     osx  ;; This will allow the correct mapping for the command + v (paste)

      )

```

- My current setup for `Emacs` has
```shell
╭─ gmbp   GMacBookPro on ~/.config/emacs_config/.spacemacs.storepoint   
├─ﮧ INSERT  1h13m|main !6 ?6
╰─ brew info emacs                                                                                                                                                                                                                                                       祥:3.411s  [   May 17, 2023 -  9:06:30 PM ]
Warning: Treating emacs as a formula. For the cask, use homebrew/cask/emacs
==> emacs: stable 28.2 (bottled), HEAD
GNU Emacs text editor
https://www.gnu.org/software/emacs/
Not installed
From: https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/emacs.rb
License: GPL-3.0-or-later
==> Dependencies
Build: pkg-config ✔
Required: gnutls ✔, jansson ✔
==> Options
--HEAD
	Install HEAD version
==> Caveats
To restart emacs after an upgrade:
  brew services restart emacs
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/emacs/bin/emacs --fg-daemon
==> Analytics
install: 339 (30 days), 4,470 (90 days), 280,360 (365 days)
install-on-request: 220 (30 days), 3,220 (90 days), 176,131 (365 days)
build-error: 0 (30 days)
╭─ gmbp   GMacBookPro on ~/.config/emacs_config/.spacemacs.storepoint   
├─ﮧ INSERT  1h14m|main !6 ?6
╰─ emacs --version                                                                                                                                                                                                                                                       祥:1.681s  [   May 17, 2023 -  9:06:42 PM ]
GNU Emacs 28.2
Copyright (C) 2022 Free Software Foundation, Inc.
GNU Emacs comes with ABSOLUTELY NO WARRANTY.
You may redistribute copies of GNU Emacs
under the terms of the GNU General Public License.
For more information about these matters, see the file named COPYING.
```


