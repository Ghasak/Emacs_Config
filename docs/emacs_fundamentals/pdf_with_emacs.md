# PDF with Emacs

There are two types of `pdf` layers for `spacemacs` one is `pdf` and the other
`pdf-tools`. The layer `pdf` is the one I am using since its based on the `pdf-tools`.

## How it works

As you already open a pdf in `spacmacs` you can

### Navigate your pdf

| key              | descrition                                                                                           |
| ---------------- | ---------------------------------------------------------------------------------------------------- |
| (`j/k`)          | for go forward and go backword                                                                       |
| (shift + j/k)    | faster movement                                                                                      |
| (+/-)            | for maximize/minimize your pdf view.                                                                 |
| `<leader>` m     | This is the main key for our pdf tools                                                               |
| `<leader>` m a t | Add a text annotation to your pdf                                                                    |
| `<leader>` m a l | To list all your annotations                                                                         |
| `F`              | Inside the annotations list buffer you can use this to follow the location of your selected annotate |
| `<leader>j`      | Jump option for pdf                                                                                  |
| `<leader>t`      |                                                                                                      |
| `<leader>T`      |                                                                                                      |
| `<leader>`       |                                                                                                      |
|                  |                                                                                                      |

## How about searching

This section is for searching for a `keyword` among several `pdf` at given
direcotry.

### Searching with dired

- Inside the `dired` file manager `mark` several `pdfs` that you have
- Use `m`/`u` to mark/unmark all the pdf you need to search for a keyword
- Use `M-x: pdf-occur-dired-do-search` this will allow you to search for a given
  word among all your files.

### Searching inside pdf

- Inside `pdf` the best one I found is `<leader> m s` then `s` for `pdf-occur`
  then enter the `keyword` you want to search for.

## References

- [using Emacs 44 - An Org mode and PDF - Tools workflow](https://www.youtube.com/watch?v=LFO2UbzbZhA)
