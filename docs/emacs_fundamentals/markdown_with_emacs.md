# Markdown with Emacs

The following configurations is given for the `Emacs` `spacemacs` to export to makrdown as well (not setted by default)
<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Markdown with Emacs](#markdown-with-emacs)
    - [Steps](#steps)
    - [1. Make sure you have the markdown layer installed](#1-make-sure-you-have-the-markdown-layer-installed)
    - [2. Add the md export backend into Spacemacs](#2-add-the-md-export-backend-into-spacemacs)
    - [3. Verify the exportation](#3-verify-the-exportation)

<!-- markdown-toc end -->

## Steps

Org-mode is one of the coolest features in Emacs and this case Spacemacs. It can
be used to write documentation, personal notes, and also schedule your events in
an awesome agenda.

In my case, I use Org files to write and export tutorials from one single file
to three platforms, which are Medium,Dev.to, and my blog, using Spacemacs as my
main editor.

To be able to export to a Markdown from an Org file, you need to do the following:

## 1. Make sure you have the markdown layer installed
Having the markdown layer installed will give you a better experience when editing markdown files.

## 2. Add the md export backend into Spacemacs
You need to add the md value into the export backends variable. The easiest way
for me to do this is the following:

Inside Spacemacs type:
```elisp
M-x customize-option
```
and then type `org-export-backends`.

It will bring a customization buffer in which you can move with the arrow keys,
and select the md checkbox to enable it, and then press Enter in the Appy and
save button.

Modifying export backends

## 3. Verify the exportation
After applying and saving the new export backend, you can do a new export doing the following:

With an org file buffer open, type:

, e e
Exporting menu

This will open the export menu, and now we will see the new markdown option
available. If you want to create a markdown file from your org file, inside the
previous menu type:

m m
and this will create a new markdown file from your org file.

Conclusions
From now on, whenever you want to export an org file to a markdown file, you will only need to follow step 3.

If you find this useful, please consider giving it a like.
Happy hacking!

https://dev.to/roeeyn/export-from-org-to-markdown-in-spacemacs-1dab
