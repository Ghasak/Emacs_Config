# Emacs_Config

Emacs Config file for my daily workflow -

## Changelog

Changes made to this guide:

- `2023-08-28`: Added .spacemacs and early_init.el for my current Intel Machine Base, Using `Emacs29`.
- `2023-10-02`: Fixed the problem of void treemacs--setup-icon-background-colors
- `2023-09-23`: Added the yanking and region highlights
- `2023-06-22`: Added explinations about the `c/c++` language using the `c-c++` layer.
- `2023-06-02`: Added support for the `org-mode` and inlay for `rust` from the `lsp-mode`.
- `2023-05-22`: Added docs sub directory with all give configurations.
- `2023-05-10`: Starting the `Emacs` config file based on `Spacemacs`.

## To do

- [x] An org-mode workflow for application processing
- [x] Org Mode and
- [x] Org Mode Configurations
- [x] PDF Note Taker with OrgMode
- [x] dap config for emacs (JavaScript, Swift, lua, R ..etc.)
- [x] lisp langauge and lisp plugins dev.
- [x] magit
- [x] latex
- [x] Control Obsidian
- [x] shell scripting support

## Quickstart

Current `spacemacs` configurations supports

- `lsp & dap` language server protocol and debugging ability for:
  - python
  - rust

### Installing

```shell
git clone https://github.com/Ghasak/emacs_config
emacs -q --load ~/.spacemancs
```

### Fixed Problem

1. void-function treemacs--setup-icon-background-colors

- Track the solution here: [Helm-icons-Issues](https://github.com/yyoncho/helm-icons/issues/23)
