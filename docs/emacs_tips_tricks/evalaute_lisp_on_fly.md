# Evaluate Lisp on fly

You can **test and debug any Emacs Lisp code interactively** in Spacemacs using a few different methods.

Here’s a simple, effective workflow to **verify `SDKROOT` and test native-comp toolchain config** directly inside Spacemacs:

---

## ✅ A. Open the Emacs Lisp REPL (`ielm`)

1. Press:

   ```
   SPC : ielm
   ```

   This opens an interactive Emacs Lisp shell.

2. In the prompt, try:

   ```elisp
   (getenv "SDKROOT")
   ```

   ✅ Expected: it should print:

   ```
   "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
   ```

---

## ✅ B. Quick Eval Any Code Block in `.spacemacs` or Buffers

While editing `.spacemacs` or any `.el` file:

1. Place your cursor **at the end of a line or expression**.
2. Press:

   ```
   , e e     ; (comma, then 'e', then 'e') — this evaluates the expression at point
   ```

   or use:

   ```
   SPC m e e
   ```

### 🔍 Example test snippet:

```elisp
(message "SDKROOT is: %s" (getenv "SDKROOT"))
```

You’ll see the result in the minibuffer:

```
SDKROOT is: /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk
```

---

## ✅ C. Manually Set and Test Variables

Paste and evaluate the following block inside `ielm` or any `.el` buffer using `, e e`:

```elisp
(setenv "SDKROOT" "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk")
(setenv "PATH" (concat "/Library/Developer/CommandLineTools/usr/bin:" (getenv "PATH")))
(setq native-comp-driver-options
      (list (concat "-isysroot " (getenv "SDKROOT"))))

(list
 (getenv "SDKROOT")
 (getenv "PATH")
 native-comp-driver-options)
```

✅ It should return a list like:

```elisp
("/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
 "/Library/Developer/CommandLineTools/usr/bin:/usr/local/bin:..."
 ("-isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"))
```

---

## ✅ D. Test Compilation Manually (optional)

To check if Emacs can **actually use `as` or `ld`**, test calling them:

```elisp
(shell-command "as --version")
(shell-command "ld -v")
```

If these fail in Emacs but succeed in Terminal, it confirms an **environment mismatch** between your shell and Emacs GUI.

---

## ✅ Summary

| Action                   | Keybinding in Spacemacs          |
| ------------------------ | -------------------------------- |
| Open Emacs Lisp REPL     | `SPC : ielm`                     |
| Eval expression at point | `, e e` or `SPC m e e`           |
| Show env var value       | `(getenv "SDKROOT")`             |
| Set env var              | `(setenv "SDKROOT" "...")`       |
| Check native-comp config | `native-comp-driver-options`     |
| Shell command test       | `(shell-command "as --version")` |

---

Would you like me to prepare a ready-to-paste block for your `.spacemacs` `user-config` section to persist these changes?
