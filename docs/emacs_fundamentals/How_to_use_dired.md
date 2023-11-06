# How to use Emacs Dired
The following documentation will teach us all what we need to know about `emacs
dired`. In can `dired` extensions are not working, put this in your
configuration file.

```elisp
require `dired-x
```
<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [How to use Emacs Dired](#how-to-use-emacs-dired)
    - [File Operations](#file-operations)
        - [Marking files](#marking-files)
        - [Create a new directory](#create-a-new-directory)
        - [Sorting directories & files](#sorting-directories--files)
        - [Copying and Renaming files](#copying-and-renaming-files)
            - [Nice tricks](#nice-tricks)
        - [Creating and extracting archives](#creating-and-extracting-archives)
        - [Other common operations](#other-common-operations)
        - [Delete files/directories](#delete-filesdirectories)
        - [Edit file name in dired - Part I](#edit-file-name-in-dired---part-i)
        - [Rename multiple files - Part II](#rename-multiple-files---part-ii)
    - [Single Dired Buffer](#single-dired-buffer)
    - [File Icons](#file-icons)
    - [Open external files](#open-external-files)
    - [Hide/show dotfiles](#hideshow-dotfiles)
    - [Reference](#reference)

<!-- markdown-toc end -->




## File Operations
These are my frequently usage for my workflow with `dired` on file operations.

### Marking files


| keybinding | Description                                                                            |
|------------|----------------------------------------------------------------------------------------|
| Type u     | to Unmark a file or all files of an inserted subdirectory.                             |
| Type DEL   | to back up one line and unmark or unflag.                                              |
| Type x     | to delete (eXpunge) the files flagged ‘D’.                                             |
| Type RET   | to Find the current line’s file (or dired it in another buffer, if it is a directory). |
| Type o     | to find file or Dired directory in Other window.                                       |
| Type i     | to Insert a subdirectory in this buffer.                                               |
| Type R     | to Rename a file or move the marked files to another directory.                        |
| Type C     | to Copy files.                                                                         |
| Type s     | to toggle Sorting by name/date or change the ‘ls’ switches.                            |
| Type g     | to read all currently expanded directories again.                                      |

- The ones that I used frequently.

| Keybinding | Description                                                                |
|------------|----------------------------------------------------------------------------|
| `m/u`      | mark and unmark selected directories/files                                 |
| `U`        | unmark all files in buffer                                                 |
| `*t/t`     | Inverts makred files in buffer                                             |
| `* %`      | Mark files in buffer using regular expression                              |
| `*`        | Lots of other auto-marking functions                                       |
| `k/K`      | `Kill` marked items (refresh buffer with g/g r to get them back)           |
| `m`        | Many operations can be done on a single file if there are no active marks! |
| `+`        | Create a new directory                                                     |

- `K` will not delete directories or files, it will just remove them from the
  view in the buffer.
- Select then `shift-k`  Searching manual,

### Create a new directory
- To create a new directory, you can
1. In the `dired` mode use the `+` sign to add a new directory or use
   (M-x:`dired-create-directory`)
2. You will be prompted to select the directory name.

### Sorting directories & files
I use `describe mode` or `m<F1>` to then search for `dired` to know all the
keybindings.
- The best way in `spacemacs` is to use `s` which will open a buffer for
  tarnsient sorting options (`o`, `d` ..etc. ) sorting based on size, time, last
  time opened.

### Copying and Renaming files

| Keybinding | Command                     | description                                                     |
|------------|-----------------------------|-----------------------------------------------------------------|
| `C`        | `dired-do-copy`             | Copy makred files (or if no files are marked, the current file) |
|            |                             | Copying single and multiple files                               |
| `c`        | `dired-do-compress`         | Compress a file/directory                                       |
| `U`        | `dired-unmark-all-marks`    | Unmark all files in buffer                                      |
| `R`        | `dired-do-rename`           | Rename based on regular expression: `^test, old-\&`             |
|            |                             | Some can be used for moving file                                |
| `+`        | `dired-create-directory`    | Create a new directory                                          |
| `I`        | `dired-maybe-insert-subdir` | while you are on a dir, check to see what inside                |
|            |                             |                                                                 |

- In the `dired-do-copy` for multiple files, the destination directory must be created a head.
- In the `C` (`copying`) once you use the `C` a buffer will be opened to ask you
  to the new name for the file you have copied (should not be same name of
  course).
- You can apply `m/u` to mark several files and it will ask you to which
  directory you want to copy the marked files.
- `ctrl-alt-j` will allow you to write a name for a file without getting the
  auto-compilation in the way (`ivy-immediate-done` the one responsible on this)
- `dired-dwim-target` this is a command for `do what i mean` to get the target default (read more in help dired-dwim-target)

#### Nice tricks
- Copy/rename between two buffers
1. Evaluate an expression that will default the second buffer directory
   automatically `Eval: (setq dired-dwim-target t)`
2. Open a buffer in `dired` for the origin - and copy/move(C/R) files that you wish to operate on them to the destination.
3. Open another buffer in `dired` for the destination (shift + enter) so they will be side-by-side.
4. You will see the other buffer is selected directly as a default.

- Open dired with maybe
1. While you are in `dired` mode, and your cursor on a given directory
2. Use the command `M-x: dired-maybe-insert-subdir`
3. You can open several dired in view using `I` which is maapped to `dired-maybe-insert-subdir`

### Creating and extracting archives

| key                          | command | description                                            |
|------------------------------|---------|--------------------------------------------------------|
| `Z`                          |         | Compress or uncompress a file or folder to (`.tar.gz`) |
| `c`                          |         | Compress selection to a specific file                  |
| `dired-compress-files-alist` |         | Bind comparessin commands to file exxtension           |


### Other common operations
| key | command            | description                         |
|-----|--------------------|-------------------------------------|
| `T` | `dired-do-touch`   | Touch (change timestamp)            |
| `M` | `dired-do-chmod`   | Cahnge file mode                    |
| `O` | `dired-do-chown`   | Hange file owner                    |
| `G` |                    | Change file group                   |
| `S` | `dired-do-symlink` | Create a symbolic link to this file |
| `L` |                    | Load an Emacs Lisp file into Emacs  |

### Delete files/directories

- Select the files/directories using `m/u` for mark and unmark them.
- Then you can hit `d` for delete
- I use `x` to confirm my deletions (be careful with this command, be sure what
  you are doing)
- `delete-by-moving-to-trash` - Move to trash instead of deleting permanently.
- If you want to delete files to trash there is a command called
  `delete-by-moving-to-trash` (find it using `help-xref-interned`), set it to
  `true` as `(setq delete-by-moving-to-trash t)` in your configuration file to
  send files to trash, instead of delete them permanently.

### Edit file name in dired - Part I
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
4. Finish editing (`wdired-finish-edit`): `C-x` then `C-s` or `C-c` and `C-c**

**Note**
- `C`   -> `Ctrl`
- `M`   -> `Meta/alt`
- `SPC` -> `<leadre>/Space`
- `RET` -> `return`

### Rename multiple files - Part II
This can easily be done using dired:
1. Enter a dired view of your directory
2. Switch to writable dired mode (wdired-change-to-wdired-mode): C-xC-q
3. Edit the file names listing as if it were a normal buffer (for example using
   a keyboard macro or a rectangular selection or query-replace). Here is a
   regexp-based solution: `C-M-%\(VAR.\)_\(..\)RET\2_\1RET`
4. Finish editing (wdired-finish-edit): C-xC-s or C-c


## Single Dired Buffer

## File Icons
- All these are in the configuration file.
## Open external files
- All these are in the configuration file.
## Hide/show dotfiles

```elisp
(use-package dired-hide-dotfiles
    :hook (dired-mode . dired-hide-dotfiles-mode)
    :config
        (evil-collection-define-key 'normal 'dired-mode-map
            "H" 'dired-hide-dotfiles-mode
        )
)
```

## Adding dired-hacks
The following plugin will add more features for the `dired` original library.





## Reference
- [Emacs Dired rename many files](https://stackoverflow.com/questions/15881776/emacs-dired-rename-many-files)
- [dired-rename-multiple files](https://pragmaticemacs.wordpress.com/2015/05/26/dired-rename-multiple-files/)
- [Emacs From Scratch - #10](https://www.youtube.com/watch?v=PMWwM8QJAtU&t=576s)
