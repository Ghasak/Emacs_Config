# Shell Commands

If you want to run something quickly that trigger another window in `emacs` you
can use the `shell-command` faster

## Python Project
- [x] First rust the `<leader> shift + !` to open the shell-command-line.

```elisp
cd .. && python -m src.main
```

- Or, for your give project, you can use the `projectile` using `<leader> p c`
  then we can specify the command to pass such as:

```sh
python -m src.main
```
