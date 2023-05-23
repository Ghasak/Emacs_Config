# Install Emacs

- I use `emacs 28` latest updated version.
```shell
brew install emacs-plus --with-librsvg --with-no-titlebar-and-round-corners --with-imagemagick --with-spacemacs-icon
```

- Output of my installation
- I link `ln -s /usr/local/opt/emacs-plus@28/Emacs.app /Applications` based on the installation output.

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


## Reference
- [emacs plugs](https://github.com/d12frosted/homebrew-emacs-plus#no-titlebar)
- [spacemacs](https://github.com/syl20bnr/spacemacs)
- [setup emacs playground on mac](https://www.aidanscannell.com/post/setting-up-an-emacs-playground-on-mac/)
