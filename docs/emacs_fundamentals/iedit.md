# IEDIT Mode
In ``spacemacs` there is a mode called `iedit` for changing multiple instance
(keyword) in a given buffer easily.

1. You must stop at the instance (keyword) that appears many times in your text
   and you want to change.
2. Use `<leader> s e` to enter to the `iedit` model or use (`<leader><leaader>`
   then `iedit-mode`)
3. Now you can use the `buffer` as any other buffer, lets hits `i` for insert
   mode, and start changing the words in documents.
4. You can select Tab for each instance that you want to skip in your selection.
   (navigate using n/N) (This is useful if you want to modify most but not all
   matches.)
5. Once you finish you can use `Esc` to get out of the mode.

## More details about iedit mode
In Spacemacs once you are in iedit state you can:

- Press `F` to limit the scope to the current function
- Press `L` to limit the scope to the current line
- Press `J` to increase the scope (starting from the current line) one line below
- Press `K` to increase the scope one line above
- Navigate between the occurrences with n and N and press TAB to remove an occurrence.


## Can I do same in Vim (Evil) Mode
Yes, which we can use in the `command-line` :`%s/old_instance/new_instance/cig`
the `cig` will allow you to change instance and skip the one you don't need.

## References
- About `iedit` mode
  - [Reference_1](https://emacs.stackexchange.com/questions/13466/how-to-replace-words-in-a-region-using-iedit)
  - [Reference_2](https://www.youtube.com/watch?v=SaOyV0d9WBc&list=WL&index=8)
