# C/C++ Layer
For current implementation for the `c/c++` for full supporting the language.
<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [C/C++ Layer](#cc-layer)
    - [BackEnd Support](#backend-support)
    - [Path to LSP Sever executable](#path-to-lsp-sever-executable)
    - [Adding dependencies to clangd](#adding-dependencies-to-clangd)
    - [Necessary Tools](#necessary-tools)
        - [clang-format](#clang-format)
    - [Notes by Eivind Fonn](#notes-by-eivind-fonn)
        - [1.1 Tell Emacs How to Compile](#11-tell-emacs-how-to-compile)
    - [Reference](#reference)

<!-- markdown-toc end -->

## BackEnd Support
There are two `backend` supports for `c-c++` in `spacemacs`. These are
1. `clang` which is the default - if you use the `lsp` layer.
2. `ccls` which is based on the `cquery** is for C/C++/Objective-C language
   server` (check`Ref-2`).

**Note** It seems that the `ccls` is more powerful that `clang` but we will use
the `clang` as its supported by default through the `llvm`.

## Path to LSP Sever executable
`LSP` expects to find the `LSP` server executable in your `PATH`. If you want to
specify the location of an executable then you need to set teh appropriate
varaible as:

| server  | Variable name                 |
|---------|-------------------------------|
| `clang` | `lsp-client-clang-executable` |
| `ccls`  | `ccls-executable`             |

## Adding dependencies to clangd
The `clangd` actually is the `lsp` server that used by the `nvim` and `emacs`
there are two types of `clangd` one comes with `Apple` and one is installed
using `Mason` in `nvim`. `Emacs` uses the default shipped with `Apple` compared
to the `nvim` ones. In summary clangd is a language server that is commonly used
with nvim and emacs for C++ development. There are two versions of clangd: one
that comes pre-installed with macOS (Apple's version), and another version that
can be installed using the Mason package manager specifically for nvim setups.
- When using clangd with emacs, it typically relies on the default version that
  is shipped with macOS. On the other hand, nvim users can choose to install and
  use the clangd version provided by Mason, which offers additional features and
  improvements.

- In summary, both nvim and emacs can utilize clangd as a language server for
  C++ development, but the versions used may differ. nvim users have the option
  to install the clangd version provided by Mason, while emacs generally uses
  the default clangd version shipped with macOS.
- You have to add a file called `.clangd` that will allow to add the
  `dependencies` (e.g. SDL2) I will install using

1. Create a file called `generate_clangd_config` for the developement

```bash
#!/usr/bin/env bash

INCLUDE_PATH="${HOME}/Desktop/devCode/cppDev/CPP_APIs/dependencies/include"
CLANGD_CONFIG=".clangd"

# Check if .clangd file exists
if [ -e "$CLANGD_CONFIG" ]; then
    # If .clangd file already exists, update the include path
    sed -i "s|-I.*|-I${INCLUDE_PATH}|" "$CLANGD_CONFIG"
else
    # If .clangd file doesn't exist, create it with the include path
    echo "CompileFlags:" > "$CLANGD_CONFIG"
    echo "  Add:" >> "$CLANGD_CONFIG"
    echo "    - -I${INCLUDE_PATH}" >> "$CLANGD_CONFIG"
fi
```
## Necessary Tools
### clang-format
I have used `clang-format` to keep on formatting my buffer on save. Simply

```sh
brew install clang-format
```
## Notes by Eivind Fonn
### 1.1 Tell Emacs How to Compile
- We will set our `Spacemacs` to infor `helm` how to find our `make` and build
  our project (assume you already configured using cmake first).
1. You will create a file in the `root` directory called `.dir-locals.el` with
   the following snippet (assume we want to run the make in our build/debug
   directory)

```elisp
((c++-mode (helm-make-build-dir . "build/debug/")))
```
2. The command for `helm` to find the make is `<space>cc` which if you define
   correctly it will load all the `make` file commands at the specified
   directory (e.g. debug or release).
3. Put in your `.spacemacs` the command in your `(defun dotspacemacs/user-config
   ()`.

```elisp
;; will look for a file .dir-local-l and load the variable you put, and it will tell the make how to build your C++ project.
(put 'helm-make-build-dir 'safe-local-variable 'stringp)
```
4. Reboot your `clangd` by exiting the buffer and you should have now
   `helm-make-build-dir` set to the run the `make` file of the `./build/debug`
   directory in your given project (read more
   [Ref-1].



## Reference
- [Ref-1] [C/C++ in Spacemacs - Eivind Fonn](https://www.youtube.com/watch?v=OjbkCEkboA8&t=605s)
- [Ref-2] [ccls language server GitHub - Repo](https://github.com/MaskRay/ccls)
