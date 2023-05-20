# How to input number -series (with appointed amount) in Emacs?


- You can also invoke eval-expression (M-:) and evaluate
```elisp
(dotimes (i 4) (insert (format "%2d.\n" (1+ i))))
```
or

```elisp
(dotimes (i SEQ_LENGTH) (insert (format "%2d\n" (+ START (* i STEP)))))
```
## Using Regular Expression
1. in visual mode, select many lines
2. `<leader> <leader>` then `replace-regexp`
3. use `^`  (to alter beginning of a line)
4. replaced by `\,(1+ \#)` put a sequence of number

## Using multiple-cursors layer

This is a bit tricky, You have the option to create `multiple cursor` and
there are two back-ends. First the `'evil-mc` and `'mc`. I found that `mc`
is not powerful as the `evil-mc` (the `evil-mc` uses the `gr` keybinding).
the `mc` however has the `mc/insert-numbers`.

1. First allow the layer `multiple-curosrs` layer to be installed in
   `spacemacs`.
2. Assign the back-end for the `multiple-cursors` layer using

```elisp
 (multiple-cursors :variables multiple-cursors-backend 'mc)
```
3. Now you need first create several cursor to select how many numbers you want
   to have sequence for. The `mc` back-end is mapped with `<leader>s m` as of
   search multiple-lines. Now you have the option to create cursors using
   `<leader>s m a` to map all the highlighted values.
   - You can highlight in `visual` mode the first word occurrence then apply
     `<leader>s m a` it will create cursors at each occurrence.
   - Once you finish with all the cursors just use `M-x: mc/keyboard-quit` (M-x
     means `<leader><leader>` or Meta (Alt) + x), You can also use `C-g` to exist (apply the `mc/keyboard-quit`)
   - You can now even add number which will be incremented as well at each
     cursor using (`<leader>s m s n` or `M-x: mc/insert-numbers`)
   - To back to one cursor use `<leader>s m a` then hit `Enter`.

- Can We also add cursor on place that not match? This is done using?
  - First select multiple lines that you want to put a cursor at beginning of the line for each `visual model select multiple lines`.
  - Now, select `<leader> s m r` for multiple lines and you will have cursor at beginning of each line.
  - Then, you can back to one cursor using either `mc/keyboard-quit` or `ctrl + g` (C-g) to exit the `mc` mode.

## Can We use Multip-cursor with dired
Yes, you can, as
1. Enter the dired file manager first at the directory you want to change the
   file names.
2. Now, you can enter the edit mode for the dired window using `<leader> b w`
   (read more about dired
   [here](./docs/emacs_fundamentals/Rename_file_in_dired.md)).
3. You now apply the `mc` (multiple-cursors) changing the file name. (just
   highlight in visual mode one of the file names and if you can find other
   occurrences).

## References
- [How to input series of numbers](https://emacs.stackexchange.com/questions/5632/how-to-input-number-series-with-appointed-amount-in-emacs)
- [How to increment a series of number on the same row](https://stackoverflow.com/questions/16921013/how-to-increment-a-serie-of-number-on-the-same-row-in-a-configuration-file)
- [How to insert a number sequence in Emacs with multiple cursors?](https://stackoverflow.com/questions/29838244/how-to-insert-a-number-sequence-in-emacs-with-multiple-cursors)
- [ref-with mc/insert-numbers with prefix](https://xenodium.com/inserting-numbers-with-emacs-multiple-cursors/)
- [Emacs Multiple Cursors - mc](https://www.youtube.com/watch?v=mDDeSKRc3Zo&t=177s)
- [Evil-mc](https://github.com/gabesoft/evil-mc)
- [mc](https://github.com/magnars/multiple-cursors.el)
- [Emacs Rocks!](https://emacsrocks.com/e13.html)
