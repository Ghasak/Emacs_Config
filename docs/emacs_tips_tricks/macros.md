# Macros In Emacs

## Vanilla Emacs

The following macro can be used along with applying `function` (e.g. `eval-and-replace`).

| Task             | keybinding        | command | Description                                      |
| ---------------- | ----------------- | ------- | ------------------------------------------------ |
| record a macro   | `<F3>` or `C-x (` |         | This will open a macro for you                   |
| stop a macro     | `<F3>` or `C-x )` |         | This will close the macros                       |
| Applying a macro | `<F4>` or `C-x e` |         | Apply once, then hit (`e`) to repeat the command |

## Spacemacs Emacs

## NOTES ON MACROS

A keyboard macro is a command defined by an Emacs user to stand for sequence of keys. Keyboard macros differ from
ordinary Emacs commands in that they are written in the Emacs command language rather than Lisp.

- Note: _The keyboard macro prefix: C-x C-k_

### The most important commands when it comes to macros

- ~F3~ Starts a macro recording
- ~F4~ Ends the definition of macro
- ~F4~ Runs the macro on a second invocation.

Note these two roles of the F4 command: ~(kmacro-end-or-call-macro)~

_Note: The word "def" appears in red in the mode line when a macro is being defined/recorded._

To append more commands to an existing macro definition:
~C-u F3~ Re-execute last keyboard macro, then append keys to its definition.
~C-u C-u F3~ Append keys to the last keyboard macro without re-executing it.

To repeat a macro on each line in a region use: ~C-x C-k r (apply-macro-to-region-lines)~

The author of Emacs is Richard Stallman
The author of Emacs is Richard Stallman
The author of Emacs is Richard Stallman
The author of Emacs is Richard Stallman
The author of Emacs is Richard Stallman

_This command obviates the need to make moving to a new line and to the beginning of that line a part of a macro._

~C-x C-k d~ re-triggers a display, i.e. refreshes the screen (useful with long macros)

Macros understand and record _minibuffer_ commands and can work across buffers.

For example:

=F3 C-a C-k C-x b foo RET C-y C-x b RET F4=

The macro explained:

C-a Goes to beginning of the line
C-k Kills line
C-x b foo RET Creates a buffer 'foo'
C-y Yanks the line
C-x b RET Returns to the previous buffer
F4 Ends the Macro

Note: Some keyboard commands do not work as usual when recording a macro and mouse events are unreliable.

All macros are recorded in the _keyboard macro ring_. One can cycle the macros in this ring and execute them:

https://www.gnu.org/software/emacs/manual/html_node/emacs/Keyboard-Macro-Ring.htm

### The Macro Counter

The macro counter in Emacs keeps track of the number of times a keyboard macro has been executed AND can insert this
count into the buffer during each execution, incrementing with each iteration.
Example: one can use a macro to create an ordered list.

#+begin_example
C-x C-k C-c - To set the keyboard macro counter (kmacro-set-counter)
F3 F3 . C-j F4
#+end_example

1.
2.
3.
4.
5.
6.
7.
8.
9.
10.

_Note the second invocation of f3_

### Executing Macros with Variations

To allow variations in your macro run the command ~C-x q~ at the point where you want the variable to occur. During
macro definition, C-x q does nothing, but when you run the macro later, C-x q asks you interactively whether you wish to
continue.

The possible responses to the query are:

SPC (or y): Continue executing the keyboard macro.
DEL (or n): Skip the remainder of this repetition of the macro and start the next repetition.
RET (or q): Cancel the current repetition and all further repetitions.
C-r: Enter a recursive editing level where you can do some editing that is not part of the macro. After you finish, you exit the recursive edit with C-M-c, Emacs will ask you again whether to continue with the macro.

#+begin_example
Hello, Raoul!
Hello, World!
#+end_example

C-x C-k n gives a command name to the most recently defined keyboard macro (kmacro-name-last-macro). This lasts for the session only.
C-x C-k b binds the most recently defined keyboard macro to a key sequence (kmacro-bind-to-key). This lasts for the session only.

_TIP_ A good way of binding is to use the macro prefix and the numbers 1-9:

C-x C-k b 1

Then run C-x C-k 1

Then run C-x z

_Insert Macro into the buffer_

M-x insert-kbd-macro inserts in the buffer a keyboard macro’s definition, as Lisp code.

#+begin_example
(defalias 'test
(kmacro "H e l l o , SPC C-x q w o r l d ! C-j"))
#+end_example

_How to use a macro across sessions as its own command_

- first use ~insert-kbd-macro~ as above, and then,
- Bind using global set key as in: ~(global-set-key (kbd "C-c u") 'test)~

## Save your kbd-macro

1. Create a file called `macro-snippets.el` to store all your macro snippets.

- I will save in a file that I can load anytime or using `eval-region or eval-buffer` for the `macro-snippets.el` file

2. Evaluate the snippets in that file by running `eval-buffer` for example.
3. Create your Macro `F3` start recording, `F4` end recording then `F4` for repeating.
4. You must name the macro using `M-x: insert-kbd-macro` give it a name such as `gh1`
5. Now you can use it by call `gh1` directly in your `M-x` buffer.
6. Now, `Emacs` will insert the `macro` as a `emacs-lisp` such as

```elisp
(fset 'gh1
      (kmacro-lambda-form [?A ?  escape ?  ?  ?e ?v ?a ?l ?- ?a ?n ?d tab return ?0 ?j] 0 "%d"))
(global-set-key (kbd "C-x C-k 1") 'gh1)
```

7. Map it using `C-x C-k 1` you can see this mapping also in your `C-x C-k` `which-key` window.
8. Now, you can call it anytime you need using `C-x C-k 1` and dont forget you can use `C-x z` for repeating.

- Here, you can load this to the buffer, then test it,

```elisp
;; Function for Evaluate your buffer on run
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
;; First kmacro for testing purposes and keep it persistent.
(fset 'gh1
      (kmacro-lambda-form [?A ?  escape ?  ?  ?e ?v ?a ?l ?- ?a ?n ?d tab return ?0 ?j] 0 "%d"))
;; Call it using the key-binding
(global-set-key (kbd "C-x C-k 1") 'gh1)

;;-----------------------------------------------------------------------
```

- There is another trick to mention is that if you run your macro first time, and call it using `C-x e` then you can
  also use the command `M-x: apply-macro-to-region-lines`. After you highlight all the lines that you wish to apply your
  `kmacro` to.

## References

- [Emacs Macros: All you really need to know](https://www.youtube.com/watch?v=_WLauBkO5rI)
