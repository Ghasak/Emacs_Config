# Install Emacs

- I use `emacs 28.2` latest updated version.
```shell
brew install emacs-plus --with-no-titlebar-and-round-corners --with-imagemagick --with-spacemacs-icon
```

- From the output of my installation below, I linked `ln -s /usr/local/opt/emacs-plus@28/Emacs.app /Applications` based
  on the installation output.

```shell
Emacs.app was installed to:
  /usr/local/opt/emacs-plus@28

To link the application to default Homebrew App location:
  ln -s /usr/local/opt/emacs-plus@28/Emacs.app /Applications

Your PATH value was injected into Emacs.app/Contents/Info.plist

Report any issues to http://github.com/d12frosted/homebrew-emacs-plus

To start d12frosted/emacs-plus/emacs-plus@28 now and restart at login:
  brew services start d12frosted/emacs-plus/emacs-plus@28
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/emacs-plus@28/bin/emacs --fg-daemon
```

2. Inside `spacemacs` Install all fonts icons using.
```elisp
M-x all-the-icons-install-fonts

```
3. Install the necessary `ispell` for `flychecker`

```shell
brew install ispell
```

- It seems the `neotree` is working while the `treemacs` is not working for me
  at the moment. I removed it from my `spacemacs` layers.

5. You can install more `lsp` severs using (here I installed the
   `dockerfile-ls`) you can also use the terminal to install the server for
   example I am using `pyright` then we use ->  `pip install pyright`

```elisp
M-x lsp-install-server dockerfile-ls
```

6. For Rust you must ensure
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
7. Install the debug adabter
-  You will need first to install the `dap-lldb-gdp-setup` within your emacs session as
```elisp
M-x: dap-lldb-gdp-setup
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

## Reference
- [emacs plugs](https://github.com/d12frosted/homebrew-emacs-plus#no-titlebar)
- [spacemacs](https://github.com/syl20bnr/spacemacs)
- [setup emacs playground on mac](https://www.aidanscannell.com/post/setting-up-an-emacs-playground-on-mac/)
