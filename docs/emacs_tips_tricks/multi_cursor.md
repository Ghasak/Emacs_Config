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



## Performance Tip from Emacs Rock

```elisp
C-æ mc/mark-next-like-this
```
- Find and mark the next part of the buffer matching the currently active
  region, while also keeping the current region. Get it here.

```elisp
C-x r y yank-rectangle
```
- Yank the last killed rectangle with upper left corner at point.

```elisp
H-SPC set-rectangular-region-anchor
```
- Think of this one as `set-mark` except you're marking a rectangular region. It
  is an exceedingly quick way of adding multiple cursors to multiple lines. Get
  it here.

```elisp
C-x C-q dired-toggle-read-only
```
- Edit dired buffer with Wdired, or set it read-only.

```elisp
C-Æ mc/mark-all-like-this
```
- Find and mark all parts of the buffer matching the currently active region,
  while also keeping the current region. Get it here.

```
C-x C-e eval-and-replace
```
- Evaluate the last sexp and replace it with the result. Get it here.

```
M-x kmacro-name-last-macro
```
- Assign a name to the last keyboard macro defined.
```
M-x insert-kbd-macro
```
Insert in buffer the definition of kbd macro NAME, as Lisp code.

## Reference
- [EmacsRocks](https://emacsrocks.com/e13.html)
