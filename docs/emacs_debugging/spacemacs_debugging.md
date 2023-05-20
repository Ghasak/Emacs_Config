# Debugging with  Spacemacs
## Configurations
One of the features that I wished for, was to integrated the `debugging` and
make the `dap` and `lsp` layers both work. After I finished the installation by
selecting the correct `Emacs` version for my system supporting [read
here](../emacs_setup/emacs_with_mac_arm64.md).

## Adpater setup for Rust

The `dap` layer will be integrated with the `lsp` but needs specific `adapter`.
For `lldb` instead of `gdp` (to make it simple for me, lldb for mac while gdp
for linux base system). It is required to have `lldb-min` to be installed which
is the adapter predefined in `dap` layer. Here is the steps that I followed
to make it works. For LLDB you need to have `lldb-mi` in your PATH


1. Locate the `lldb-mi` in your system, I used the one already installed which
   comes with `vscode` in the following path.

```shell
~/.vscode/extensions/ms-vscode.cpptools-1.15.4-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi
```
2. Make it executable using `chmod +x /bin/lldb-mi` in the path above
3. Source it in your `zshrc` using

```shell
export PATH="$PATH:$HOME/.vscode/extensions/ms-vscode.cpptools-1.15.4-darwin-arm64/debugAdapters/lldb-mi/bin"
```
4. Now you can see in the terminal that you already have `lldb-mi` working.

```shell
╰─ lldb-mi --version
Version: GNU gdb (GDB) 7.4
(This is a MI stub on top of LLDB and not GDB)
All rights reserved.
```
## Rust debugging steps

1. Create a file called `debug_configu.el` or what ever name you like.
2. Put a template configuration for the adapter in this file (for rust see)
3. Use `M-x eval-buffer` that will register the newly created template
4. Run `run-debug`
Or more precisely, the steps are: (check [here](https://docs.doomemacs.org/v21.12/modules/tools/debugger/))
- Call dap-gdb-lldb-setup function.
- Use dap-debug-edit-template to configure debugging settings for your project.
  Available settings can be inspected here. Call eval-buffer to save your
  settings. Don’t save the file!
- Call dap-debug, select a configuration and start debugging.

- Template for working with lldb (macOS)
```elisp
(dap-register-debug-template
  "LLDB::Run"
  (list :type "lldb-mi"
        :request "launch"
        :name "LLDB::Run"
        :target nil
        :cwd nil
        ))
```

- Template for working with gdb (linux) (run on Ubuntu 22.04)

```shell
sudo apt-get install libtool-bin
sudo apt-get install libvterm-bin
```
```elisp
(dap-register-debug-template
  "cpptools::Run Configuration"
  (list :type "cppdbg"
        :request "launch"
        :name "cpptools::Run Configuration"
        :MIMode "gdb"
        ;;:program "${workspaceFolder}/ replace with your binary"
        :cwd "${workspaceFolder}"))

```

## Where can I find `lldb-mi`
1. Build it from source using the repository [here](https://github.com/lldb-tools/lldb-mi)
2. Link the one comes with `xcode` (I got this from [here](https://github.com/WebFreak001/code-debug))

```shell
ln -s /Applications/Xcode.app/Contents/Developer/usr/bin/lldb-mi /usr/local/bin/lldb-mi
```
3. From vscode natively from vscode as I used above (located at)

```shell
~/.vscode/extensions/ms-vscode.cpptools-1.14.5-darwin-arm64/debugAdapters/lldb-mi/bin/lldb-mi)
```

## It worth to try
- [configure lldb-mi with doom emacs](https://github.com/emacs-lsp/lsp-mode/issues/2928)
```shell
  (setq lsp-rust-analyzer-debug-lens-extra-dap-args
        `(:MIMode "lldb"
          :miDebuggerPath ,(f-join doom-local-dir "etc/dap-extension/vscode/cpptools/extension/debugAdapters/lldb-mi/bin/lldb-mi")
          :stopAtEntry t
          :externalConsole
          :json-false))
```

## Debugging for Python
To be written later (Now I am using python `debugpy` which works very fine!).



## References
- [eamcs-lsp/dap-mode](https://emacs-lsp.github.io/dap-mode/page/configuration/#rust)
- [lsp-rust-analyzer](https://emacs-lsp.github.io/lsp-mode/page/lsp-rust-analyzer/)
- [alpha2phi](https://alpha2phi.medium.com/emacs-lsp-and-dap-7c1786282324)
- [dap-mode-rust in linux gdp](https://gagbo.net/post/dap-mode-rust/)
- [lldb-mi](httphttps://github.com/meain/dotfiles/blob/master/emacs/.config/emacs/init.els://github.com/lldb-tools/lldb-mi)
- [python layer](https://develop.spacemacs.org/layers/+lang/python/README.html)
- [Debuging codelldb manual](https://github.com/vadimcn/codelldb/blob/master/MANUAL.md)
- [dap-codelldb](https://github.com/emacs-lsp/dap-mode/blob/master/dap-codelldb.el)
- [Emacs Debug with GDB](https://www.youtube.com/watch?v=X70OjYLUpEk&t=455s)
