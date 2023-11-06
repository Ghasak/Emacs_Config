# How to install Emacs 30

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

**Table of Contents**

- [How to install Emacs 30](#how-to-install-emacs-30)
  - [Reference](#reference)

<!-- markdown-toc end -->

- You will need to install the emacs form the port that support the integration
  with the icons. This comes with other features that enhance the user
  experreince, speed up the startup time and intializing the better emacs
  client-server modules.

1. Ensure you have already added the brew tab for the `emacs-plus@30`from here:

```sh
brew tap d12frosted/emacs-plus
```

2. Now, we can run the command to install the `emacs30` using:

```sh
brew install emacs-plus@30
                  --with-ctags
                  --with-dbus
                  --with-no-frame-refocus
                  --with-xwidgets
                  --with-imagemagick
                  --with-native-comp
                  --with-poll
                  --with-spacemacs-icon
```

3. You can remove the title bar, by adding the following to the `~/emacs.d/early_init.el` file

```elisp
(add-to-list 'default-frame-alist '(undecorated-round . t))
```

4. Now, we can install spacemacs

```sh
git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
```

5. Now, we can add our `.spacemacs` config file to our current root directory.

## Reference

- [homebrew-emacs-plus support](https://github.com/d12frosted/homebrew-emacs-plus?tab=readme-ov-file)
