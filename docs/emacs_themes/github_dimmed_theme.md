# How to instal Github Theme

1. You must include the package called `autothemer`, using the
   `dotspacemacs-additional-packages`.
2. Now, you download the theme from
   [here](https://github.com/ladroid/github-emacs-theme/tree/main?tab=readme-ov-file#),
   place it as in location `~/.emacs.d/private/themes/github-dark-dimmed-theme.el`
   or use:

```sh
mkdir -p ~/.emacs.d/themes
curl -L \
  https://raw.githubusercontent.com/ladroid/github-emacs-theme/main/github-dark-dimmed-theme.el \
  -o ~/.emacs.d/themes/github-dark-dimmed-theme.el
```

3. You insure to put in `user-config` the following

```sh

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'github-dark-dimmed t)

```

4. Check if its loaded using

```sh
(message "Active theme: %s" (car custom-enabled-themes))
```
