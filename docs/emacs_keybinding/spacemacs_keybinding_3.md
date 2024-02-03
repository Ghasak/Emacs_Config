#+SETUPFILE: theme-readtheorg.setup
#+AUTHOR: Fernando Briano
#+TITLE: Spacemacs Notes

* Keyboard shortcuts

** Emacs shortcuts
~M~ stands for ~Meta key~ (generally Alt), and ~C~ stands for the Ctrl key.
| Keys        | Description                                                    |
|-------------+----------------------------------------------------------------|
| ~M-g g~     | Go to line                                                     |
| ~M-^~       | Join lines                                                     |
| ~C->~       | Multi line cursor add next line                                |
| ~C-<~       | Multi line cursor add previous line                            |
| ~M =~       | Show information about lines, words and characters in a region |
| ~C-x s~     | save-some-buffers: Save open buffers                           |
| ~C-u C-x s~ | Save all open buffers without asking                           |
| ~C-]~       | In Helm buffer - see complete filename                         |

** Spacemacs shortcuts

Spacemacs uses a leader key to bind almost all its key bindings. In Vim mode,
the leader key is set on ~SPC~ (the space bar, hence the name spacemacs). In
Emacs style the leader is available on ~M-m~. So shortcuts with ~SPC~ can be
executed with ~M-m~ in Emacs mode.

| Keys          | Description                                                                                                            |
|---------------+------------------------------------------------------------------------------------------------------------------------|
| ~f y y~       | Show and copy current file path                                                                                        |
| ~f y Y~       | Projectile copy file path                                                                                              |
| ~f r~         | Recent files                                                                                                           |
| ~x y~         | Copy selection to clipboard (even in terminal, thanks to the ~xclipboard~ layer)                                       |
| ~x p~         | Paste clipboard contents at cursor position (same ☝️)                                                                 |
| ~x a char~    | Align to char, e.g.: ~:~                                                                                               |
| ~tab~         | Toggle last buffer                                                                                                     |
| ~s s~         | "swoop" (search in file with menu for navigating)                                                                      |
| ~m g g~       | Go to definition (mode -> g g )                                                                                        |
| ~C-x b~       | Kill buffers in Helm Buffer - ~C-x b~ shows helm buffer, select buffers to kill with ~Ctrl-SPC~, kill them with ~M-D~. |
| ~f D~         | delete a file and associated buffer                                                                                    |
| ~f R~         | Rename current file                                                                                                    |
| ~f b~         | Open bookmarks                                                                                                         |
| ~0~           | Open treemacs in the current directory                                                                                 |
| ~f t~         | Hide/show existing treemacs, create one for current directory if no buffer exists                                      |
| ~z x~         | - / + change font size                                                                                                 |
| ~f b~         | Open bookmarks (write name and enter to save current buffer as bookmark)                                               |
| ~C-c C-e h o~ | In org-mode, export to html and open html file in browser                                                              |
| ~; ;~         | Toggle comment/uncomment line                                                                                          |
| ~; i p~       | Comment whole paragraph, or any other movement) to toggle line (or region) comment / uncomment.                        |
| ~c y~         | Comments a line and makes a copy right below it.                                                                       |

*** GUI Toggles

| Keys    | Description                                               |
|---------+-----------------------------------------------------------|
| ~t~     | The main "toggles" key, see sub-toggles with meta key - t |
| ~t h i~ | Highlight indentation                                     |
| ~t h c~ | Highlight indentation for current column                  |
| ~t 8~   | Highlight characters for long lines                       |
| ~t w~   | Whitespace mode!                                          |
| ~t a~   | autocompletion                                            |
| ~t s~   | syntax checking                                           |

** Projectile
| Key combination | Description                           |
|-----------------+---------------------------------------|
| ~p p~           | Open project                          |
| ~p P~           | Switch to project                     |
| ~p I~           | Invalidate cache                      |
| ~s a p~         | Find pattern (in project)             |
| ~s a d~         | Search in directory                   |
| ~s a P~         | Find thing under cursor  (in project) |
| ~p f~           | Find file (in project)                |
| ~p R~           | Replace in project                    |
| ~p b~           | Buffer list (for project files)       |
| ~p r~           | Open recent file                      |

** Magit
| Key combination       | Description                                                              |
|-----------------------+--------------------------------------------------------------------------|
| ~C-x g~ or ~SPC g s~  | *magit status*                                                           |
| ~g~ (while in status) | refresh git status                                                       |
| ~N~ and ~P~           | move around next and previous                                            |
| ~TAB~                 | expands/collapses code folds                                             |
| ~s~                   | stage                                                                    |
| ~u~                   | unstage                                                                  |
| ~k~                   | discard region                                                           |
| ~Ctrl - SPC~          | select region to stage/unstage. Works for lines of code and files        |
| ~c~                   | commit panel with lots of options, ~c~ again takes you to commit message |
| ~C-c C-k~             | while writing a commit message discards commit message                   |
| ~f a~                 | fetch all (~f~ takes you to fetching panel)                              |
| ~b c~                 | checkout branch (~b~ for branch panel)                                   |
| ~F~                   | *pull* popup                                                             |
| ~X~                   | *reset*                                                                  |
| ~P~                   | Push                                                                     |
| ~r e~                 | rebase "elsewhere" (~r~ for rebase panel)                                |
| ~r i~                 | rebase interactive                                                       |
|-----------------------+--------------------------------------------------------------------------|
| Rebase interactive    |                                                                          |
|-----------------------+--------------------------------------------------------------------------|
| ~M-n~ and ~M-p~       | Move commits up/down                                                     |
| ~k~                   | Remove commit                                                            |
|                       |                                                                          |
** Flycheck
| Key binding | Description                                                  |
|-------------+--------------------------------------------------------------|
| ~e c~       | clear errors                                                 |
| ~e h~       | describe flycheck checker                                    |
| ~e l~       | display a list of all the errors                             |
| ~e L~       | display a list of all the errors and focus the errors buffer |
| ~e e~       | explain the error at point                                   |
| ~e s~       | set flycheck checker                                         |
| ~e S~       | set flycheck checker executable                              |
| ~e v~       | verify flycheck setup                                        |
| ~t s~       | toggle flycheck                                              |

** Alchemist
~C-c a~ is the prefix for Alchemist shortcuts. So start with ~C-c a~ and then:

| Key combination | Description                                  |
|-----------------+----------------------------------------------|
| ~m c~           | mix compile                                  |
| ~a x~           | mix                                          |
| ~a c b~         | compile this buffer                          |
| ~a c f~         | compile a file                               |
| ~a m r~         | mix run (a file in the context of a project) |

*** Testing
| Key combination | Description                       |
|-----------------+-----------------------------------|
| ~a p s~         | toggle file and its test file     |
| ~a p o~         | same as ↑ but in different window |
| ~a p t~         | run tests for current file        |
| ~a t~           | mix test                          |
| ~a r~           | rerun last test                   |
| ~a m t b~       | run tests on current buffer       |
| ~a m t~         | run tests under cursor            |

** Ruby
| Keys        | Description             |
|-------------+-------------------------|
| ~M-RET x h~ | Toggle Ruby hash syntax |

* Functions

"Open with", open file in buffer with external app.
Source: http://emacsredux.com/blog/2013/03/27/open-file-in-external-program/

```elisp
(defun open-with (arg)
  "Open visited file in default external program.

With a prefix ARG always prompt for command to use."
  (interactive "P")
  (when buffer-file-name
    (shell-command (concat
                    (cond
                     ((and (not arg) (eq system-type 'darwin)) "open")
                     ((and (not arg) (member system-type '(gnu gnu/linux gnu/kfreebsd))) "xdg-open")
                     (t (read-shell-command "Open current file with: ")))
                    " "
                    (shell-quote-argument buffer-file-name)))))
(global-set-key (kbd "C-c o") 'open-with)
```


* Org Mode
Write "<s" and press Tab to start a source code block.

- /italicised text/
- *bold text*
- _underlines_
- =literal text=
- ~code~
- +strikethrough+
* Emacs functions
~describe-variable~ - See the value of a variable

~describe-mode~ - See all enabled minor modes
* Modes Stuff
*Golden ratio* - Automatic resizing of Emacs windows to the golden ratio
