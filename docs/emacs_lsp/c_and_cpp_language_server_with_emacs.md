# C/C++ Layer
For current implementation for the `c/c++` for full supporting the language.

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




## Notes by Eivind Fonn



## Reference
- [Ref-1] [C/C++ in Spacemacs - Eivind Fonn](https://www.youtube.com/watch?v=OjbkCEkboA8&t=605s)
- [Ref-2] [ccls language server GitHub - Repo](https://github.com/MaskRay/ccls)
