# Edit file name in dired
In `idred` file manager, I use the original emacs method for edit file names using the following

1. While you are in the `dired` mode. with all the files that you want to
   change.
2. Enter to the dired writing mode, using:
- Vanilla Emacs: `C-x` then `C-q` (as Ctrl + x then Ctrl + q) will activate the
  `wdired-change-to-wdired-mode`
- Spacemacs method: Edit the buffer using `<leader> b w` as for `buffer` ->
  `write` to activate` `wdired-change-to-wdired-mode`

3. Edit the file names listing as if it were a normal buffer (you still can use
   the Evil mode)
4. Finish editiing (`wdired-finish-edit`): `C-x` then `C-s` or `C-c` and `C-c**

**Note**
- `C`   -> `Ctrl`
- `M`   -> `Meta/alt`
- `SPC` -> `<leadre>/Space`
- `RET` -> `return`

## Original note
This can easily be done using dired:
1. Enter a dired view of your directory
2. Switch to writable dired mode (wdired-change-to-wdired-mode): C-xC-q
3. Edit the file names listing as if it were a normal buffer (for example using
   a keyboard macro or a rectangular selection or query-replace). Here is a
   regexp-based solution: `C-M-%\(VAR.\)_\(..\)RET\2_\1RET`
4. Finish editing (wdired-finish-edit): C-xC-s or C-c


## Reference
- [Emacs Dired rename many files](https://stackoverflow.com/questions/15881776/emacs-dired-rename-many-files)
- [dired-rename-multiple files](https://pragmaticemacs.wordpress.com/2015/05/26/dired-rename-multiple-files/)
