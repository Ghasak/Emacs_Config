# Evil Tools

There are several Evil tools that add text manipulation features to your Vim style editing.

| Keybinding | Evil tool        | Description                                                       |
| ---------- | ---------------- | ----------------------------------------------------------------- |
| SPC s e    | iedit            | search and replace in multiple matches concurrently               |
| g r        | multiple cursors | create multiple cursors for concurrent text editing               |
| SPC n      | narrowing        | limit the view of the current buffer (range, function definition) |
| C-c C-e    | helm-ag          | project refactor by editing helm results of project searches      |

## Evail Packages

Most of these packages are already included in `spacemacs`.

| package                  | usage                                                                                                                                    |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| evil-lion                | port of lion.vim for rapid text alignment                                                                                                |
| evil-vimish-fold         | fold text in vim style                                                                                                                   |
| evil-multiedit           | multiple cursors with evil-mode using iedit                                                                                              |
| evil-textobj-tree-sitter | provides new textobjects to evil-mode, thanks to treesitter                                                                              |
| evil-surround            | port of tpope's vim-surround                                                                                                             |
| evil-commentary          | port of tpope's vim-commentary                                                                                                           |
| evil-snipe               | fast 2-char search, optionally overrides f/F and t/T to work on multiple lines                                                           |
| evil-exchange            | swap text selected with motions                                                                                                          |
| evil-owl                 | show markers and registers contents in a window, when calling a command that deals with them                                             |
| avy                      | despite not starting with evil, avy is well integrated in evil-mode. It jumps around text and works with evil commands, like evil-delete |
| evil-collection          | collection of bindings in several modes, probably the first you want to check if you haven't yet                                         |
| evil-matchit             | Press “%” to jump between matched tags (“<div>” and “</div>” in html, etc).                                                              |

## Useful Evil-owl

This package offer to show the register and all the entires.

- You need to toggle the `evil-owl-mode` first to make it works.
  - evil-owl-mode
- Press q, @, ​"​, C-r, m, ​'​, or ` to view the popup, press C-f or C-b to scroll
  it, and input a register or mark to make the popup disappear.

for the cursor,

## Alter behavior of evil

I use the following steps

1. In the `<leader><leader>` (a.k.a. M-:) mode I searched for `help-xerf-interned`
2. Then I selected `evil-want-Y-yank-to-eol`
3. a buffer will be opened and I selected `customize`
4. I turned it on and then `apply` then `save`.
5. It will generate this code at the end of your spacemacmacs.
   You can add this before `package-selected-packages` manually.

```elisp
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
```

## Reference

- [Practicalli Spacemacs](https://practical.li/spacemacs/spacemacs-basics/evil-tools/#todoexpand-on-overview-provide-video-overview)
