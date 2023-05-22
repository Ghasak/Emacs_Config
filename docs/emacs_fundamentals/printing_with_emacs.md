# How to Print
Usually I have found there is a command called `mac-print-frame-dailog` that
will open the `mac` dialog for selecting and exporting the document and print
it. (As for now I canot figure out the margins).

## PDF formula
I found there is a good way to print as pdf based on the following `Emacs lisp`
function

```elisp
  ;; -------------------------------------------------------------
  ;;                  emacs print to pdf in OSX
  ;; https://gist.github.com/maltefiala/1048e313111410c12d3e71d1d813cabc
  ;; -------------------------------------------------------------
  ;; Adapted following script to OSX:
  ;; https://genomeek.wordpress.com/2013/03/08/emarch-2-create-a-pdf-with-highlighted-code-source/
  (defun print-to-pdf ()
    (interactive)
    (ps-spool-buffer-with-faces)
    (switch-to-buffer "*PostScript*")
    (write-file "tmp.ps")
    (kill-buffer "tmp.ps")
    (setq cmd (concat "pstopdf tmp.ps -o " (buffer-name) ".pdf"))
    (shell-command cmd)
    (shell-command "rm tmp.ps")
    (message (concat "File printed in : "(buffer-name) ".pdf"))
    )
```
