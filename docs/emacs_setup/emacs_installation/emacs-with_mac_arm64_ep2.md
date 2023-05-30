# How to install Emacs on Mac
 <!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [How to install Emacs on Mac](#how-to-install-emacs-on-mac)
    - [Configurations](#configurations)
        - [Requirements for full installation](#requirements-for-full-installation)
            - [Generic](#generic)
            - [LSP](#lsp)
            - [Dap](#dap)
    - [Other ways to install Emacs](#other-ways-to-install-emacs)
        - [Using railwaycat/emacsmacport/ tab](#using-railwaycatemacsmacport-tab)
            - [[working, but very slow] Using emacs-mac-spacemacs-icon (application based)](#working-but-very-slow-using-emacs-mac-spacemacs-icon-application-based)
        - [[Not used anymore] Build with Emacs emacs-mac (terminal based tty)](#not-used-anymore-build-with-emacs-emacs-mac-terminal-based-tty)
    - [Build From Source](#build-from-source)
    - [References](#references)

<!-- markdown-toc end -->

## Configurations
The current Configurations that I am working on are based on the pre-built
`Emacs` version from [here](https://github.com/d12frosted/homebrew-emacs-plus#no-titlebar).

1. Remove the previous `Emacs` installed on your system
- I have removed the full functioning version called `emacs-port`
- Stopping the `emacs-server` using `pgrep -u "$USER" -x Emacs`
- Checking nothing running in background using `pgrep -u "$USER" -x Emacs`.
- Now the version is already being removed. here, the information about the old version.
- Removing the `emacs` is done using `brew list | grep emacs` to know the name of my current version
- The running version is called `emacs-mac-spacemacs-icon`, so we can use `brew remove emacs-mac-spacemacs-icon`.

```shell
GNU Emacs 28.2
Copyright (C) 2022 Free Software Foundation, Inc.
GNU Emacs comes with ABSOLUTELY NO WARRANTY.
You may redistribute copies of GNU Emacs
under the terms of the GNU General Public License.
For more information about these matters, see the file named COPYING.
```
- Now lets install the `Emacs`. based on the
  [here](https://github.com/d12frosted/homebrew-emacs-plus#no-titlebar). We can
  install this version using. The new cask from homebrew is called
  `Emacs-plus` and there are several version `30, 29, 28 ..etc.`.

- Lets use the following
    - `--with-no-titlebar-and-round-corners` this option will make the `Emacs` app very modern.
    - `--with-imagemagick` this is for python integration. (so no need pip install imagemagick) later.
    - `--with-spacemacs-icon` this will allow to have `spacemacs` icon for the `Emacs` app when you build.
    - `--wit-xwedigets` enables support for X11, which is the underlying windowing
      system. This option allows Emacs to create graphical windows and interact
      with X-based graphical interfaces.
    - `--with-x11` I think its for Unix-like operating systems to provide a graphical user interface (GUI)

```shell
brew install emacs-plus --with-no-titlebar-and-round-corners --with-imagemagick --with-spacemacs-icon --with-xwidgets
```

- We get the ouput,
```shell
Emacs.app was installed to:
  /opt/homebrew/opt/emacs-plus@28
To link the application to default Homebrew App location:
  ln -s /opt/homebrew/opt/emacs-plus@28/Emacs.app /Applications
Your PATH value was injected into Emacs.app/Contents/Info.plist
Report any issues to http://github.com/d12frosted/homebrew-emacs-plus
To start d12frosted/emacs-plus/emacs-plus@28 now and restart at login:
  brew services start d12frosted/emacs-plus/emacs-plus@28
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/emacs-plus@28/bin/emacs --fg-daemon
```
- Lets add the `simlink` to our `/Applications/` directory

```shell
ln -s /opt/homebrew/opt/emacs-plus@28/Emacs.app /Applications
```

- I found a problem that the `treemacs` is not supported (there are no icons
  when I built). but, Later I discovered, If you just fire the `treemacs` first
  time, the buffer will also open a `M-x` session, just hit enter, then all the
  `icons` will be loaded.

- Now, we have fully functional `Emacs` but it is not considered as an app,
  which I found this method much faster.

### Requirements for full installation
#### Generic
- You will need to install `inside your Emacs`  the
  `all-the-icons-install-fonts` will install all the icons on your machine.
  (used for treemacs, dired ..etc.)

1. Inside `spacemacs` Install all fonts icons using.
```elisp
M-x all-the-icons-install-fonts

```
2. Install the necessary `ispell` for `flychecker`

```shell
brew install ispell
```

- **Note** In case your `pdf` layer is not working, just `rm -rf
  ~/.emacs/elpa/28.2/develp/org-9.6.6` then re-launch `Emacs` again (see
  [here](https://github.com/syl20bnr/spacemacs/issues/15869) and
  [here](https://github.com/syl20bnr/spacemacs/issues/15896))

#### LSP
- You will need to install specific servers to some buffers, using
  `lsp-install-server` (e.g. `docker-ls`, `yaml`) these all will be configured
  and covered in their corresponding layer.

3. You can install more `lsp` severs using (here I installed the
   `dockerfile-ls`) you can also use the terminal to install the server for
   example I am using `pyright` then we use ->  `pip install pyright`

```elisp
M-x lsp-install-server dockerfile-ls
# will be installed at
# /opt/homebrew/bin/npm -g --prefix /Users/gmbp/.emacs.d/.cache/lsp/npm/dockerfile-language-server-nodejs install dockerfile-language-server-nodejs
```

4. For Rust you must ensure
```shell
rustup component add rust-analyzer
# Check the components using
rustup component list
```
- My current installation consists
```shell
╰─ rust-analyzer --version
rust-analyzer 1.69.0 (84c898d6 2023-04-16)

```

#### Dap

7. Install the debug adabter
-  You will need first to install the `dap-lldb-gdp-setup` within your emacs session as
```elisp
M-x: dap-gdp-lldb-setup
```
- Then, once you set a `break point` you will also run `:dap-debug` but you will see that `lldb-mi` wants to spwan but
it will not know where is the locaiton on your system.

- I attach the location to my `.zshrc` using, the extensions belongs to `vscode` and it also used for `c/c++, swift,
  objective-c`. Now, we have.

```shell
#####################################################################
#       Debugger for (dap-mode/dap layer) spacemacs
#####################################################################
export PATH="$PATH:$HOME/.vscode/extensions/ms-vscode.cpptools-1.14.5-darwin-x64/debugAdapters/lldb-mi/bin/"

```
You restart your terminal so you apply the changes or (`exec zsh`)
I got the location and the executiable of `lldb-mi` at

```shell
 ~/.vscode/extensions/ms-vscode.cpptools-1.14.5-darwin-x64/debugAdapters/lldb-mi/bin
```
You must allow the `lldb-mi` to be executable by going to this directory and ensure

```shell
chmod +x ~/.vscode/extensions/ms-vscode.cpptools-1.14.5-darwin-x64/debugAdapters/lldb-mi/bin/lldb-mi
```
otherwise it wont works.

---

## Other ways to install Emacs
### Using railwaycat/emacsmacport/ tab
There are basically two options, comes with the tab railwaycat/emacsmacport, these are:

#### [working, but very slow] Using emacs-mac-spacemacs-icon (application based)
The installation stesp are mentioned at [here](./emacs_with_mac_arm64.md), basically Using
It will give us a `GUI` but loading and unloading this `GUI` app is slower compared to the methd above.

```brew
brew install --cask emacs-mac-spacemacs-icon
```

### [Not used anymore] Build with Emacs emacs-mac (terminal based tty)
- The --cask option allows you to install macOS applications or graphical user
  interface (GUI) applications. On the other hand, not specifying --cask
  installs command-line tools or non-GUI packages.
- Therefore, if you don't use `--cask` means the emacs will live in terminal
  emulator, hene, not able to specify different fonts, visualization with `svg`
  icons ..etc.

```shell
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-no-title-bars --with-spacemacs-icon
```


- Output form installing

```shell
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Removing: /Users/gmbp/Library/Caches/Homebrew/emacs-mac--patch--5a13e83e79ce9c4a970ff0273e9a3a07403cc07f7333a0022b91c191200155a1.diff... (2.2KB)
Removing: /Users/gmbp/Library/Caches/Homebrew/emacs-mac--patch--8319fd9568037c170f5990f608fb5bd82cd27346d1d605a83ac47d5a82da6066.patch... (2.8KB)
==> Caveats
==> emacs-mac
This is YAMAMOTO Mitsuharu's "Mac port" addition to
GNU Emacs 28. This provides a native GUI support for Mac OS X
10.10 - 12. After installing, see README-mac and NEWS-mac
in /opt/homebrew/opt/emacs-mac for the port details.

Emacs.app was installed to:
  /opt/homebrew/opt/emacs-mac

To link the application to default App location and CLI scripts, please checkout:
  https://github.com/railwaycat/homebrew-emacsmacport/blob/master/docs/emacs-start-helpers.md

If you are using Doom Emacs, be sure to run doom sync:
  ~/.emacs.d/bin/doom sync

For an Emacs.app CLI starter, see:
  https://gist.github.com/4043945

Emacs mac port also available on MacPorts with name "emacs-mac-app" and "emacs-mac-app-devel", but they are not maintained by the maintainer of this formula.
```
- I also linked using
```shell
╭─ gmbp   GMacBookPro on ~   
├─ﮧ INSERT 
╰─ ln -s  /opt/homebrew/opt/emacs-mac /Applications/
```
## Build From Source
I will not mention this one here, hopeful to be investigated later in the
future. Check [here](https://github.com/jimeh/build-emacs-for-macos), or check [Here](https://emacs.stackexchange.com/questions/37240/how-install-emacs-26-or-whatever-latest-ver-on-mac)

```bash
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

TAG="26"
git clone --depth 1 --branch emacs-${TAG} git://git.savannah.gnu.org/emacs.git
cd emacs
make clean
./autogen.sh
./configure --without-compress-install --with-json --with-dbus --with-librsvg --with-imagemagick --with-mailutils
```

## References
- [How to install Emacs Guide for macOS](https://sourabhbajaj.com/mac-setup/Emacs/)
