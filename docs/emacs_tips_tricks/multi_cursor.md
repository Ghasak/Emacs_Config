# Multi Cursor in Emacs

There two multi-cursor engine running behind the scenes of the layer
`multiple-cursors`: "mc" and "evil-mc." The former, "mc," represents the
"multi-cursor" layer, while the latter, "evil-mc," stands for the "multi-cursor
in evil model".

## Running the Mutlicursor `MC`

I to use the `mc` engine rather than the `evil-mc` because it offers a numbering
feature that I could not find in `evil-mc`. Let's examine its capabilities.

1. We can select here the similar instance in number of ways,

- `mc/edit-lines`    : Go to visual model first, then select a region, and you will insert a cursor infront of each line in the selected block.
- `mc/mark-all-dwim` : This is most effective way to select simiarl instance of a given word (you can also use visual mode to select compound words)
- `mc/mark-pop`      : If you want to remove the selection on a given instance.
- `mc/mmlte--up`     :
- `mc/mmlte--down`   :
- `mc/mmlte--left`   :
- `mc/mmlte--right`  :
- `mc/sort-regions`  :


- The one I use always is, `mark-all-dwim` makr all in (do what I mean).
- `ESC`: is after selecting the similar instances to set your cursor on these occurences.
- `C-g` is to quite the mulicursor mode
