# Yasnippets!
## Enable yasnippets
You need to put the following in your `.spacemacs`

```elisp
(yas-global-mode 1)
(add-hook 'yas-minor-mode-hook (lambda ()
                             yas-activate-extra-mode 'fundamental-mode))
```
The following directories are added by default:

~/.emacs.d/elpa/yasnippet-xxxxx/snippets
~/.emacs.d/layers/auto-completion/snippets
~/.emacs.d/private/snippets (conditional to the value of auto-completion-private-snippets-directory)
~/.spacemacs.d/snippets (conditional to the existence of ~/.spacemacs.d directory)


## References
- [Ref-1](https://develop.spacemacs.org/layers/+completion/auto-completion/README.html)
