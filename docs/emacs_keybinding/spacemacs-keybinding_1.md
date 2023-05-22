# spacemacs-keybindings

Ref: - [Reference](https://gist.github.com/rnwolf/e09ae9ad6d3ac759767d129d52cab1f1)

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC | < space > |
| RET | < return > |
| C   | < ctrl > |
| M   | < alt >, M stands for Meta |


## Note these .... most recently forgotten or frequently required.

| Key Binding      | Description                                                                                                                                                                                         |
|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SPC SPC          | Execute interactive function (M-x on emacs)                                                                                                                                                         |
| fd               | Alternative: press the f and d keys together.                                                                                                                                                       |
|                  | If you find yourself in a buffer where Spacemacs (SPC) or Vim keybindings don’t work use this to get back to normal state (for example in “SPC SPC customize” press fd to make SPC b b work again). |
| SPC s c          | remove highlight                                                                                                                                                                                    |
| SPC T s          | list themes                                                                                                                                                                                         |
| SPC T n          | Switch to next theme. Light/Dark.                                                                                                                                                                   |
| SPC t w          | Toggle the display of Tabs and whitespace                                                                                                                                                           |
| SPC w b          | focus mini-buffer                                                                                                                                                                                   |
| SPC z x          | font size minor mode                                                                                                                                                                                |
| SPC z f          | font zoom/unzoom with + - and 0                                                                                                                                                                     |
| SPC S c          | Spell check the last incorrect word.                                                                                                                                                                |
| SPC j w          | Avy jump to word                                                                                                                                                                                    |
| SPC a u          | Open up undo visulization tree. Session change history.                                                                                                                                             |
| SPC f f filename | create files in non-existing subfolders, like SPC f f my/sub/folder/file.txt RET                                                                                                                    |
|                  | or :e ~/dir/myfilename.org RET                                                                                                                                                                      |
| Shift + Insert   | command to paste into emacs command window. Same as Middle Click                                                                                                                                    |

## Undo visulization tree commands

| Key Binding | Description                               |
|-------------|-------------------------------------------|
|             | VIM editing Style                         |
| j and k     | to navigate through the tree up and down. |
| h and l     | to switch branches.                       |
|             |                                           |
|             | Emacs editing style:                      |
| n and p     | to navigate through the tree up and down. |
| f and b     | to switch branches.                       |
|             |                                           |
| q or C-g    | to quit and leave in current state.       |
| C-q         | to abort changes.                         |
|             | Other useful commands:                    |
| d           | Toggle diff display.                      |
| t           | Toggle display of time-stamps.            |
| s           | Toggle keyboard selection mode.           |
| , and <     | Scroll left                               |
| . and >     | Scroll right                              |

# Copy Paste from/to host clipboard when editing a document - in Vim Mode

| Key Binding | Description                                        |
|-------------|----------------------------------------------------|
| "+y         | Copy to the host clipboard                         |
| "+p         | Paste the text to editor, from the host clipboard. |
| SPC v i g   | Select the wolde buffer (for copy paste example)   |

# Spell-checking

Spell-checking uses aspell. Make sure aspell and aspell-en are installed.

| Key Binding | Description        |
|-------------|--------------------|
| SPC t S     | toggle spell-check |
| SPC S c     | correct word       |
| SPC S n     | go to next error   |


# Files manipulations key bindings

Files manipulation commands (start with f):

| Key Binding | Description                                                                          |
|-------------|--------------------------------------------------------------------------------------|
| SPC f c     | copy current file to a different location                                            |
| SPC f C d   | convert file from unix to dos encoding                                               |
| SPC f C u   | convert file from dos to unix encoding                                               |
| SPC f D     | delete a file and the associated buffer (ask for confirmation)                       |
| SPC f E     | open a file with elevated privileges (sudo edit)                                     |
| SPC f f     | open file with =helm= (or =ido=)                                                     |
| SPC f F     | try to open the file under point =helm=                                              |
| SPC f j     | jump to the current buffer file in dired                                             |
| SPC f l     | open file literally in =fundamental mode=                                            |
| SPC f L     | Locate a file (using =locate=)                                                       |
| SPC f o     | open a file using the default external program                                       |
| SPC f R     | rename the current file                                                              |
| SPC f s     | save a file                                                                          |
| SPC f S     | save all files                                                                       |
| SPC f r     | open a recent file with =helm=                                                       |
| SPC f t     | toggle file tree side bar using [[https://github.com/jaypei/emacs-neotree][NeoTree]] |
| SPC f v d   | add a directory variable                                                             |
| SPC f v f   | add a local variable to the current file                                             |
| SPC f v p   | add a local variable to the first line of the current file                           |
| SPC f y     | show current file absolute path in the minibuffer                                    |

---

# Emacs and Spacemacs files

Convenient key bindings are located under the prefix SPC f e to quickly
navigate between =Emacs= and Spacemacs specific files.

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC f e c   | open =ido= in the =contrib= folder                             |
| SPC f e d   | open the spacemacs dotfile (=/.spacemacs=)                     |
| SPC f e D   | open =ediff= buffer of =/.spacemacs= and =.spacemacs.template= |
| SPC f e f   | discover the =FAQ= using =helm=                                |
| SPC f e i   | open the all mighty =init.el=                                  |
| SPC f e R   | resync the dotfile with spacemacs                              |
| SPC f e v   | display and copy the spacemacs version                         |

---

## Comment

| Key Binding | Description        |
|-------------|--------------------|
| SPC ;       | comment operator   |
| SPC c y     | comment and yank   |
| SPC c p     | comment paragraphs |

---

## Find files

| Key Binding | Description                   |
|-------------|-------------------------------|
| SPC ff:     | find files or url             |
| SPC pf:     | find file in project          |
| SPC ph:     | search in a project with helm |
| SPC bb:     | search in buffers             |

---

## Search in files

| Key Binding | Description                                                        |
|-------------|--------------------------------------------------------------------|
|SPC ss or /: |search with evil

---

## Window

| Key Binding | Description                                                        |
|-------------|--------------------------------------------------------------------|
|SPC w =	|balance split windows|
|SPC w c	|close a window|
|SPC w c	|close a window|
|SPC w C	|delete another window using ace-delete-window|
|SPC w d	|toggle window dedication (dedicated window cannot be reused by a mode)|
|SPC w [hjkl] |move to window|
|SPC w [HJKL] |move the window|
|SPC w s or SPC w -	|horizontal split|
|SPC w S	|horizontal split and focus new window|
|SPC w u	|undo window layout (used to effectively undo a closed window)|
|SPC w U	|redo window layout|
|SPC w v or SPC w /	|vertical split|
|SPC w V	|vertical split and focus new window|
|SPC w w	|cycle and focus between windows|
|SPC w m	|maximize/minimize a window (maximize is equivalent to delete other windows)|
|SPC w M	|maximize/minimize a window, when maximized the buffer is centered|

---

## buffer

| Key Binding | Description                                                        |
|-------------|--------------------------------------------------------------------|
|SPC TAB	|switch to alternate buffer in the current window (switch back and forth)|
|SPC b b	|switch to a buffer using helm|
|SPC b d	|kill the current buffer (does not delete the visited file)|
|SPC b e	|erase the content of the buffer (ask for confirmation)|
|SPC b h	|open *spacemacs* home buffer|
|SPC b k	|kill a buffer|
|SPC b K	|kill all buffers except the current one|

---

 ## Project

 =projectile= commands start with p:

| Key Binding | Description                                           |
|-------------|-------------------------------------------------------|
| SPC p !     | run shell command in root                             |
| SPC p &     | run async shell command in root                       |
| SPC p a     | toggle between implementation and test                |
| SPC p b     | switch to project buffer                              |
| SPC p c     | compile project using =projectile=                    |
| SPC p d     | find directory                                        |
| SPC p D     | open project root in =dired=                          |
| SPC p f     | find file                                             |
| SPC p G     | regenerate the project's =etags= / =gtags=            |
| SPC p h     | find file using =helm=                                |
| SPC p I     | invalidate the projectile cache                       |
| SPC p k     | kill all project buffers                              |
| SPC p o     | run =multi-occur=                                     |
| SPC p p     | switch project                                        |
| SPC p r     | open a recent file                                    |
| SPC p R     | replace a string                                      |
| SPC p s     | see [[Searching in a project][search in project]]     |
| SPC p t     | open =NeoTree= in =projectile= root                   |
| SPC p T     | find test files                                       |
| SPC p v     | open project root in =vc-dir= or =magit=              |
| SPC p y     | find tags                                             |
| SPC /       | search in project with the best search tool available |
| SPC s a p   | run =ag=                                              |
| SPC s g p   | run =grep=                                            |
| SPC s k p   | run =ack=                                             |
| SPC s t p   | run =pt=                                              |

---

## errors

| Key Binding | Description              |
|-------------|--------------------------|
| SPC e n     | go to the next error     |
| SPC e p     | go to the previous error |

---

## Quit

| Key Binding | Description                                                              |
|-------------|--------------------------------------------------------------------------|
| SPC q q     | Quit Emacs and kill the server, prompt for changed buffers to save       |
| SPC q Q     | Quit Emacs and kill the server, lose all unsaved changes.                |
| SPC q r     | Restart both Emacs and the server, prompting to save any changed buffers |
| SPC q s     | Save the buffers, quit Emacs and kill the server                         |
| SPC q z     | Kill the current frame                                                   |

---

## GIT Commands

Git commands (start with g):

| Key Binding | Description                                         |
|-------------|-----------------------------------------------------|
| SPC g b     | open a =magit= blame                                |
| SPC g B     | quit =magit= blame                                  |
| SPC g c     | commit changes                                      |
| SPC g C     | checkout branches                                   |
| SPC g d     | show diff prompt                                    |
| SPC g D     | show diff against current head                      |
| SPC g e     | show ediff comparison                               |
| SPC g E     | show ediff against current head                     |
| SPC g f     | show fetch prompt                                   |
| SPC g F     | show pull prompt                                    |
| SPC g H c   | clear highlights                                    |
| SPC g H h   | highlight regions by age of commits                 |
| SPC g H t   | highlight regions by last updated time              |
| SPC g i     | git init a given directory                          |
| SPC g I     | open =helm-gitignore=                               |
| SPC g l     | open a =magit= log                                  |
| SPC g L     | display the log for a file                          |
| SPC g P     | show push prompt                                    |
| SPC g s     | open a =magit= status window                        |
| SPC g S     | stage current file                                  |
| SPC g m     | display the last commit message of the current line |
| SPC g t     | launch the git time machine                         |
| SPC g U     | unstage current file                                |


SPC t w 	Show whitespace
SPC : 	type tabify spaces to tabs
SPC : 	type untabify convert tabs to spaces
Getting help

Help opens up with SPC h

| Key Binding | Description               |
|-------------|---------------------------|
| SPC h m     | describe the current mode |
|             |                           |

Registers
Key Binding 	Description
|---------|------------------------------------|
| SPC r e | show evil yank and named registers |
| SPC r m | show marks register                |
| SPC r r | show helm register                 |

## NeoTree

| Key Bindings | Description                             |
|--------------|-----------------------------------------|
| SPC f t      | Open/Close NeoTree in current directory |
| SPC p t      | Open/Close NeoTree in project root      |
| ** hjkl **   | navigate                                |
| ** H **      | Up                                      |

## Jumps j

| Key Bindings | Description           |
|--------------|-----------------------|
| SPC j l      | Jump to line with avy |
| SPC j b      | Jump back             |
| SPC j w      | Avy jump word         |

## Jumps j

| Key Bindings | Description           |
|--------------|-----------------------|
| SPC j l      | Jump to line with avy |
| SPC j b      | Jump back             |
| SPC j w      | Avy jump word         |


## Searching and replacing

| Key Bindings | Description                |
|--------------|----------------------------|
| \            | Search symbol below cursor |
| SPC s a a    | Ag this file               |
| /            | Search in file             |
| SPC /        | Helm Ag search in project  |

Substitute works as in Vim

Replaces all foo with bar


:s%/foo/bar/g

Replace but ask first

:s%/foo/bar/gc

Replace all matches in project

    Search with SPC /
    Enter in edit mode C-c C-e
    Go to the occurrences and enter in iedit state with SPC s e
    Edit and then leave the iedit sate
    Exit edit mode C-c C-c

## Project

| Key Bindings | Description               |
|--------------|---------------------------|
| SPC p b      | Switch to buffer          |
| SPC p p      | Switch project            |
| SPC p f      | Find in project           |
| SPC p h      | File helm                 |
| SPC s a f    | Ag file name in directory |

## Get help

| Key Bindings | Description                                                           |
|--------------|-----------------------------------------------------------------------|
| SPC h T      | Help Tutor                                                            |
| SPC h d k    | Describe help key. If you forgot waht ; ford press this followed by ; |
| SPC ?        | Search for keybindings ENTER runs the function                        |
| SPC h d f    | Help Describe Function ENTER to describe it                           |
| SPC SPC      | Helm M-x Search for function, ENTER to run it                         |
| , or SPC m   | Major mode leader. Access to all bindings specific to major mode      |

## ORG MODE


| Key Bindings              | Description                                       |
|---------------------------|---------------------------------------------------|
| SPC ! touch new.org       | Create new blank org file                         |
| C-/                       | Undo                                              |
| C-?                       | Redo                                              |
| SPC SPC occur RET ^*+ RET | (space after +) Open navigation pane for org file |

Org Mode presentations
https://gitlab.com/oer/emacs-reveal-howto/blob/master/howto.org

Org Mode table calculations
https://orgmode.org/worg/org-tutorials/org-spreadsheet-intro.html

## Version control for org files

Assumes setup with magithub. See

http://jr0cket.co.uk/2017/02/spacemacs-using-magit-with-github.html

https://github.com/vermiculus/magithub/blob/master/magithub.org#faq

Steps for putting files under version crontrol.

| Key Bindings | Description                |
|--------------|----------------------------|
| SPC g s      | Git status                 |
| s            | Select file(s)             |
| c            | Commit                     |
| c            | New commit                 |
|              | Write in commit message    |
| , ,          | Write editor and finish.   |
|              |                            |
| ?            | Show keys                  |
| l            | Log                        |
| l            | Log Action                 |
|              |                            |
| H            | Magithub                   |
| c            | Create Repo                |
| u            | upstream  (Push to origin) |

## Editing

| Key Bindings | Description                                     |
|--------------|-------------------------------------------------|
| x            | delete char under cursor                        |
| X            | delete char before cursor                       |
| A            | add to end of line                              |
| I            | insert at the beginning of the line             |
| d d          | delete line                                     |
| D            | delete from cursor to end of line               |
| d i ‘        | delete text inside single quotes                |
| y y          | copy line                                       |
| Y            | copy from cursor to end of line                 |
| c c          | change line                                     |
| C            | change from cusror to end of line               |
| c i t        | change text inside html tag                     |
| c i ‘        | change text inside single quotes                |
| c i {        | change text inside curly brackets.              |
| c i _        | .. square brackets etc.                         |
| p            | paste after cursor                              |
| P            | paste before cursor                             |
| o            | add line below                                  |
| O            | add line above                                  |
| r            | replace character                               |
| R            | replace. (overwrite) (good for columns of text) |
| J            | join line (cursor can be anywhere on line)      |

## VIM Key Bindings

| Key Bindings | Description                               |
|--------------|-------------------------------------------|
| 0            | beginning of line                         |
| $            | end of line                               |
| 9 j          | move down 9 lines                         |
| W            | move ahead word                           |
| B            | move back word                            |
| g g          | first line                                |
| G            | last line                                 |
| C-u          | up half page                              |
| C-d          | down half page                            |
| f /          | move forward to first “/” character       |
| ;            | repeat that command again                 |
| H            | head of the screen                        |
| M            | middle of screen                          |
| L            | last of the screen                        |
| }            | move forward by paragraph or block        |
| {            | move backwards by paragraph or block      |
| *            | search for word under the cursor          |
| n            | search again forward                      |
| N            | search again backwards                    |
| #            | search backwards for word under cursor    |
| /            | search forward                            |
| ?            | search backward                           |
| %            | find matching brace, paren, etc           |
| m a          | mark a line in a file with marker a       |
| ` a          | after moving around, go back to the exact |
|              | position of marker “a”                    |
| ‘ a          | after moving, go back to line of marker a |
| : marks RET  | view all the marks                        |
| ‘ ‘          | go to the last mark you were at           |

## Tools

Create save web pge to a standalone html file for offline viewing and archiving.
https://github.com/zTrix/webpage2html

# Org with evil-org-mode

| Key Binding                                | Description                                  |     |
|--------------------------------------------|----------------------------------------------|-----|
| SPC m <dotspacemacs-major-mode-leader-key> | org-ctrl-c-ctrl-c                            |     |
| SPC m *                                    | org-ctrl-c-star                              |     |
| SPC m RET                                  | org-ctrl-c-ret i                             |     |
| SPC m -                                    | org-ctrl-c-minus                             |     |
| SPC m '                                    | org-edit-special                             |     |
| SPC m ^                                    | org-sort                                     |     |
| SPC m /                                    | org-sparse-tree                              |     |
| SPC m .                                    | org-time-stamp                               |     |
| SPC m !                                    | org-time-stamp-inactive                      |     |
| SPC m a                                    | org-agenda                                   |     |
| SPC m b                                    | org-tree-to-indirect-buffer                  |     |
| SPC m s A or , s A                         | org-archive-subtree                          |     |
| SPC m c                                    | org-capture                                  |     |
| SPC m C                                    | evil-org-recompute-clocks                    |     |
| SPC m d                                    | org-deadline                                 |     |
| SPC m D                                    | org-insert-drawer                            |     |
| SPC m e                                    | org-export-dispatch                          |     |
| SPC m f                                    | org-set-effort                               |     |
| SPC m I                                    | org-clock-in                                 |     |
| SPC m l                                    | org-open-at-point                            |     |
| SPC m n                                    | org-narrow-to-subtree                        |     |
| SPC m N                                    | widen                                        |     |
| SPC m O                                    | org-clock-out                                |     |
| SPC m P                                    | org-set-property                             |     |
| SPC m q                                    | org-clock-cancel                             |     |
| SPC m R                                    | org-refile                                   |     |
| SPC m s                                    | org-schedule                                 |     |
| SPC m T                                    | org-show-todo-tree                           |     |
| SPC m L                                    | org-shiftright                               |     |
| SPC m H                                    | org-shiftleft                                |     |
| SPC m K                                    | org-shiftup                                  |     |
| SPC m J                                    | org-shiftdown                                | mta |
| SPC m C-S-l                                | org-shiftcontrolright                        |     |
| SPC m C-S-h                                | org-shiftcontrolleft                         |     |
| SPC m C-S-j                                | org-shiftcontroldown                         |     |
| SPC m C-S-k                                | org-shiftcontrolup                           |     |
| SPC s j                                    | spacemacs/jump-in-buffer (jump to a heading) |     |


## Org Mode Tables

| Key Binding | Description                                                                |
|-------------|----------------------------------------------------------------------------|
| SPC m t a   | Align the table at point by aligning all vertical bars                     |
| SPC m t b   | Blank the current table field or active region                             |
| SPC m t c   | Convert from org-mode table to table.el and back                           |
| SPC m t d c | Delete a column from the table                                             |
| SPC m t d r | Delete the current row or horizontal line from the table                   |
| SPC m t e   | Replace the table field value at the cursor by the result of a calculation |
| SPC m t E   | Export table to a file, with configurable format                           |
| SPC m t h   | Go to the previous field in the table                                      |
| SPC m t H   | Move column to the left                                                    |
| SPC m t i c | Insert a new column into the table                                         |
| SPC m t i h | Insert a horizontal-line below the current line into the table             |
| SPC m t i H | Insert a hline and move to the row below that line                         |
| SPC m t i r | Insert a new row above the current line into the table                     |
| SPC m t I   | Import a file as a table                                                   |
| SPC m t j   | Go to the next row (same column) in the current table                      |
| SPC m t J   | Move table row down                                                        |
| SPC m t K   | Move table row up                                                          |
| SPC m t l   | Go to the next field in the current table, creating new lines as needed    |
| SPC m t L   | Move column to the right                                                   |
| SPC m t n   | Query for a size and insert a table skeleton                               |
| SPC m t N   | Use the table.el package to insert a new table                             |
| SPC m t p   | Plot the table using org-plot/gnuplot                                      |
| SPC m t r   | Recalculate the current table line by applying all stored formulas         |
| SPC m t s   | Sort table lines according to the column at point                          |
| SPC m t t f | Toggle the formula debugger in tables                                      |
| SPC m t t o | Toggle the display of Row/Column numbers in tables                         |
| SPC m t w   | Wrap several fields in a column like a paragraph                           |

## Org Mode Tree

| Key Binding | Description                                |
|-------------|--------------------------------------------|
| SPC m S l   | org-demote-subtree                         |
| SPC m S h   | org-promote-subtree                        |
| SPC m S k   | org-move-subtree-up                        |
| SPC m S j   | org-move-subtree-down                      |
| TAB         | org-cycle                                  |
| $           | org-end-of-line                            |
| ^           | org-beginning-of-line                      |
| <           | org-metaleft                               |
| >           | org-metaright                              |
| gh          | outline-up-heading                         |
| gj          | org-forward-heading-same-level             |
| gk          | org-backward-heading-same-level            |
| gl          | outline-next-visible-heading               |
| t           | org-todo                                   |
| T           | org-insert-todo-heading nil                |
| H           | org-beginning-of-line                      |
| L           | org-end-of-line                            |
| o           | always-insert-item                         |
| O           | org-open-above                             |
| M-l         | org-metaright                              |
| M-h         | org-metaleft                               |
| M-k         | org-metaup                                 |
| M-j         | org-metadown                               |
| M-L         | org-shiftmetaright                         |
| M-H         | org-shiftmetaleft                          |
| M-K         | org-shiftmetaup                            |
| M-J         | org-shiftmetadown                          |
| M-o         | org-insert-heading+org-metaright           |
| M-t         | org-insert-todo-heading nil+ org-metaright |

## Org Mode Element insertion

| Key Binding | Description                      |
|-------------|----------------------------------|
| SPC m h i   | org-insert-heading-after-current |
| SPC m h I   | org-insert-heading               |
| SPC m h s   | org-insert-subheading            |
| SPC m i f   | org-insert-footnote              |
| SPC m i l   | org-insert-link                  |

## Org Mode Links
| Key Binding | Description       |
|-------------|-------------------|
| RET         | org-open-at-point |
|             |                   |

## Org Mode Emphasis

| Key Binding | Description                |
|-------------|----------------------------|
| SPC m x b   | make region bold           |
| SPC m x c   | make region code           |
| SPC m x i   | make region italic         |
| SPC m x r   | clear region emphasis      |
| SPC m x s   | make region strike-through |
| SPC m x u   | make region underline      |
| SPC m x v   | make region verbose        |

## Org Mode Tagging

| Key Binding | Description  |
|-------------|--------------|
| SPC m :     | org-set-tags |
|             |              |

## Org Mode Navigating in calendar

| Key Binding | Description        |
|-------------|--------------------|
| M-l         | One day forward    |
| M-h         | One day backward   |
| M-j         | One week forward   |
| M-k         | One week backward  |
| M-L         | One month forward  |
| M-H         | One month backward |
| M-J         | One year forward   |
| M-K         | One year backward  |

## Org Mode Capture buffers and src blocks

org-capture-mode and org-src-mode both support the confirm and abort conventions.

| Key Binding                                | Description                            |
|--------------------------------------------|----------------------------------------|
| SPC m <dotspacemacs-major-mode-leader-key> | confirm in org-capture-mode            |
| SPC m '                                    | confirm in org-src-mode                |
| SPC m c                                    | confirm                                |
| SPC m a                                    | abort                                  |
| SPC m k                                    | abort                                  |
| SPC m r                                    | org-capture-refile in org-capture-mode |

## Org agenda Keybindings

The evilified org agenda supports the following bindings:

| Key Binding      | Description                       |
|------------------|-----------------------------------|
| M-SPC or s-M-SPC | org-agenda transient state        |
| SPC m :          | org-agenda-set-tags               |
| SPC m a          | org-agenda                        |
| SPC m d          | org-agenda-deadline               |
| SPC m f          | org-agenda-set-effort             |
| SPC m I          | org-agenda-clock-in               |
| SPC m O          | org-agenda-clock-out              |
| SPC m p          | org-pomodoro (if package is used) |
| SPC m P          | org-agenda-set-property           |
| SPC m q          | org-agenda-refile                 |
| SPC m Q          | org-agenda-clock-cancel           |
| SPC m s          | org-agenda-schedule               |
| M-j              | next item                         |
| M-k              | previous item                     |
| M-h              | earlier view                      |
| M-l              | later view                        |
| gr               | refresh                           |
| gd               | toggle grid                       |
| C-v              | change view                       |
| RET              | org-agenda-goto                   |
| M-RET            | org-agenda-show-and-scroll-up     |

## Org agenda transient state

Use M-SPC or s-M-SPC in an org agenda buffer to activate its transient state. The transient state aims to list the most useful org agenda commands and visually organize them by category. The commands associated with each binding are listed bellow.

### Entry

| Keybinding | Description  | Command                    |
|------------|--------------|----------------------------|
| ht         | set status   | org-agenda-todo            |
| hk         | kill         | org-agenda-kill            |
| hr         | refile       | org-agenda-refile          |
| hA         | archive      | org-agenda-archive-default |
| hT         | set tags     | org-agenda-set-tags        |
| hp         | set priority | org-agenda-priority        |

### Visit entry

| Keybinding | Description         | Command                       |
|------------|---------------------|-------------------------------|
| SPC        | in other window     | org-agenda-show-and-scroll-up |
| TAB        | & go to location    | org-agenda-goto               |
| RET        | & del other windows | org-agenda-switch-to          |
| o          | link                | link-hint-open-link           |

### Filter

| Keybinding | Description        | Command                           |
|------------|--------------------|-----------------------------------|
| ft         | by tag             | org-agenda-filter-by-tag          |
| fr         | refine by tag      | org-agenda-filter-by-tag-refine   |
| fc         | by category        | org-agenda-filter-by-category     |
| fh         | by top headline    | org-agenda-filter-by-top-headline |
| fx         | by regexp          | org-agenda-filter-by-regexp       |
| fd         | delete all filters | org-agenda-filter-remove-all      |

### Date

| Keybinding | Description  | Command                    |
|------------|--------------|----------------------------|
| ds         | schedule     | org-agenda-schedule        |
| dd         | set deadline | org-agenda-deadline        |
| dt         | timestamp    | org-agenda-date-prompt     |
| +          | do later     | org-agenda-do-date-later   |
| -          | do earlier   | org-agenda-do-date-earlier |

### Toggle

| Keybinding | Description  | Command                     |
|------------|--------------|-----------------------------|
| tf         | follow       | org-agenda-follow-mode      |
| tl         | log          | org-agenda-log-mode         |
| ta         | archive      | org-agenda-archives-mode    |
| tr         | clock report | org-agenda-clockreport-mode |
| td         | diaries      | org-agenda-toggle-diary     |

### View

| Keybinding | Description | Command                   |
|------------|-------------|---------------------------|
| vd         | day         | org-agenda-day-view       |
| vw         | week        | org-agenda-week-view      |
| vt         | fortnight   | org-agenda-fortnight-view |
| vm         | month       | org-agenda-month-view     |
| vy         | year        | org-agenda-year-view      |
| vn         | next span   | org-agenda-later          |
| vp         | prev span   | org-agenda-earlier        |
| vr         | reset       | org-agenda-reset-view     |

### Clock

| Keybinding | Description | Command                 |
|------------|-------------|-------------------------|
| ci         | in          | org-agenda-clock-in     |
| co         | out         | org-agenda-clock-out    |
| ck         | cancel      | org-agenda-clock-cancel |
| cj         | jump        | org-agenda-clock-goto   |

### Other

| Keybinding | Description | Command               |
|------------|-------------|-----------------------|
| gr         | reload      | org-agenda-redo       |
| .          | go to today | org-agenda-goto-today |
| gd         | go to date  | org-agenda-goto-date  |

## Pomodoro

| Key Binding | Description       |
|-------------|-------------------|
| SPC m p     | starts a pomodoro |
|             |                   |

## Org Presentation

org-present must be activated explicitly by typing: SPC SPC org-present

| Key Binding | Description    |
|-------------|----------------|
| h           | previous slide |
| l           | next slide     |
| q           | quit           |

## Org-MIME

| Key Binding | Description                                     |
|-------------|-------------------------------------------------|
| SPC m M     | in message-mode buffers convert into html email |
| SPC m m     | send current buffer as HTML email message       |

## Org-download

| Key Binding | Description     |
|-------------|-----------------|
| SPC m i s   | Take screenshot |
| SPC m i y   | Yank image url  |

## Org-projectile

| Key Binding     | Description                                             |
|-----------------|---------------------------------------------------------|
| SPC a o p       | Capture a TODO for the current project                  |
| SPC u SPC a o p | Capture a TODO for any given project (choose from list) |
| SPC p o         | Go to the TODOs for the current project                 |
