# Eval and Replace

I start to use `Emacs` after seeing this feature which can `eval` a buffer `written in elisp` and get you the answer,
this will be very much handy when you want to execute a `file.el` file or any where at any buffer. Here, How I have
test it out.

## Insights

1. Create a buffer called `playground.el` or what ever.
2. put inside the following function (will be mapped later for emacs-lisp integration with keybinding)

```elisp
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
```

3. Then run `M-x: eval-region` so you can load it to your emacs the function `eval-and-replace`
4. Now, it is loaded, let use it for given test, it will work only if inside a `emacs-lisp` file, so lets make one

```shell
touch testing_elisp.el
```

5. Inside that file put

(+ 3 4 )
(+ 4 4 )
(+ 5 4 )

- Put the cursor at the end of each expression and use `M-x: eval-and-replace`, you will see that you get the result
  from this lisp expression.

6. You can also apply your macro for a region using `apply-macro-to-region-lines`. You need to highlight first the lines
   to apply your macro on them.

- Notice, the `kdb-macro` or `kmacro` is for keyboard macros which is different from a `elisp macro`.
- You can see your `kdb-macro` using `kmacro-view-macro`.

## Eval and Repalce

Since the article is so important, I decided to put here,

- Eval and Replace

Sometimes people tend to overlook how well Emacs and Emacs Lisp are integrated.
Basically there is no limit to the places where you can evaluate a bit of Emacs
Lisp and reap the associated benefits. From time to time I find myself editing
something and thinking - “Hey, it’d be really great of I could just insert the
result of some Emacs Lisp expression at point!” (my thoughts are pretty crazy,
right?). Here’s a contrived example - I might have to enter somewhere the result
of `1984 / 16`. I can calculate that manually or I can fire up `M-x calc` and
get the result, or I can play extra smart and devise the following command
(which I did not actually devise - I’m pretty sure I saw it in someone else’s
config a while back):

```elisp

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
```

- Let’s bind that to C-c e:

```elisp
(global-set-key (kbd "C-c e") 'eval-and-replace)
```

Now in the buffer I’m currently editing I can type (/ 1984 16) and press C-c e
afterwards getting the result 124 replace the original expression. Pretty neat!
I’ll leave it up to you to think of more creative applications of the command.
This command is available in `crux` as `crux-eval-and-replace`. This command is
also available in prelude via the `crux` package.

## Evaluate More Insights

I found a nice way to insert a `eval` results in `elisp` using the following
example.

- Put the cursor at the end of each item and run `M-x: eval-region`

```elisp
(+ 5 7)
(message "hello world")
(format-time-string "%D %-I:%M %p")
(insert (concat "the time is "(format-time-string "%D %-I:%M %p")))
```

## Spacemacs Eval and Replace

Later, I found already a build-in `eval-and-replace` integrated with spacemacs,
it called `(emr-el-eval-and-replace)`, which do exactly the function above.

## References

I got this function from,

- [Reference](https://github.com/larsen/emacs-configuration/blob/master/lisp/larsen-functions.el)
  which is based on the following article
- [Eval and Replace in Emacs](https://emacsredux.com/blog/2013/06/21/eval-and-replace/)
- [crux](https://github.com/bbatsov/crux)
- [My post](https://emacs.stackexchange.com/questions/47892/how-to-replace-the-expression-with-evaluation-result-using-elisp-interpreter/77335#77335)
- [EmacsRocks](https://emacsrocks.com/e13.html)
