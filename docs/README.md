# Fundamentals for Emacs
Emacs List of important requsted features

- [x] Org Mode and
- [x] Org Mode Configurations
- [x] PDF Note Taker with OrgMode
- [x] dap config for emacs (JavaScript, Swift, lua, R ..etc.)
- [x] lisp langauge and lisp plugins dev.
- [ ] magit
- [ ] latex
- [ ] yasnippets!


## Projects to be considered
The followign ideas that I wish to impelement in my current workflow
- [x] Close my `buffer` using `<leader> q` to match my `nvim` enviroment.
- [x] pdf note-taker assembly all notes from several pdfs and collect them all together.
  - Read about Larson-code
- [x] build your `Emacs` from scratch to support both `image vectors` based on `Emacs with extra options`.
  - Check my noets about the setup
- [x] Write documentation about `build` and `dap` by specifying the location of the `dap`.
- [x] Write documentation about exporting `Platypus` applications such as `zathura` and `neovide`.


## Tools for investigation

1. `layz-helm/describe-variable` (to show the meaning of given variables)
2. `yas/describe-tables` (to show all loaded snippets)
3. `describe-key` then press the key you want, you will be prompted with the key-binding mapping.
4. `describe-syntx` after you highlight a portion of sentence, this will be helpful
5. `describe-variable` will tell you everything you need about a given variable loaded (e.g. `company-backends`)
6. `describe-function` similarly can show you the meaning of given function.


| key             | command                                                   | describtion                                      |
|-----------------|-----------------------------------------------------------|--------------------------------------------------|
| `<leader> q r`  | `(spacemacs/restart-emacs-resume-layouts &optional ARGS)` | Function to restart Emacs                        |
| `<leader>f e R` | `(dotspacemacs/sync-configuration-layers &optional ARG)`  | Reload configurations without restrat your emacs |
