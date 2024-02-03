# Debugging with Spacemacs

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Debugging with Spacemacs](#debugging-with-spacemacs)
    - [Configurations](#configurations)
        - [Important Pre-installation](#important-pre-installation)
    - [Adpater setup for Rust](#adpater-setup-for-rust)
    - [Rust debugging steps](#rust-debugging-steps)
    - [Where can I find `lldb-mi`](#where-can-i-find-lldb-mi)
    - [Using Cpptools](#using-cpptools)
        - [vscode-cpptools](#vscode-cpptools)
            - [TEMPLATE -1-](#template--1-)
            - [TEMPLATE -2- WORKING](#template--2--working)
            - [TEMPLATE -3- WORKING](#template--3--working)
            - [TEMPLATE -4-](#template--4-)
        - [Comment by reddit users](#comment-by-reddit-users)
    - [Debugging for Python](#debugging-for-python)
    - [References](#references)

<!-- markdown-toc end -->

## Configurations

### Important Pre-installation

1. For Rust, I use "dap-gdb-lldb-setup" to install lldb for debugging Rust or C/C++
   projects.
2. For C/C++, you can also use "dap-cpptools-setup" to install the
   necessary debugger adapter.
3. For any adapter it is better to define it as a simylink at /usr/local/bin/

```sh
ln -s  /Users/gmbp/.vscode/extensions/
       ms-vscode.cpptools-1.17.5-darwin-arm64/
       debugAdapters/lldb-mi/bin/lldb-mi /usr/local/bin/
```

```sh

which lldb-mi
lldb-mi is /usr/local/bin/lldb-mi
lldb-mi is /usr/local/bin/lldb-mi
lldb-mi is /Users/gmbp/.vscode/extensions
           /ms-vscode.cpptools-1.17.5-darwin-arm64
           /debugAdapters/lldb-mi/bin/lldb-mi
```

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

## Using Cpptools

- [configure lldb-mi with doom emacs](https://github.com/emacs-lsp/lsp-mode/issues/2928)

```lisp
  (setq lsp-rust-analyzer-debug-lens-extra-dap-args
        `(:MIMode "lldb"
          :miDebuggerPath ,(f-join doom-local-dir "etc/dap-extension/vscode/cpptools/extension/debugAdapters/lldb-mi/bin/lldb-mi")
          :stopAtEntry t
          :externalConsole
          :json-false))
```

- Later on, I was able to successfully utilize it by running the command
  `dap-debug-edit-template` first. However, before doing so, you will notice that
  I am using the **lldb-mi** extension from the `cpptools` package installed via
  `mason` from: `~/.local/share/nvim/mason/packages/cpptools/extension`. Any
  `lldb-mi` should work fine for debugging in `spacemacs`.

### vscode-cpptools

Installation, You only need to run dap-cpptools-setup to setup automatically and
then you are good start debugging.

- Clone and follow the instructions to compile lldb-vscode from
  <https://github.com/llvm/llvm-project/tree/main/lldb/tools/lldb-vscode>
- Put in your emacs configuration.

  ```elisp
  (require 'dap-cpptools)
  ```

1. Press 'leader leader' and then 'dap-cpptools-setup' to enable C/C++
   debugging support. Use `lldb-`
2. Use 'dap-debug-edit-template' to add the adapter, followed by evaluating the
   buffer and writing it to the register with 'dap-evaluate'.
3. Choose one of the following templates as you have already installed the dap
   adapter:

- Usage `dap-debug-edit-template` and select template `cpptools` prefixed configuration.

4. 'dap-debug' can be accessed by pressing ' leader ddd'.
5. Use ' leader leader' then 'dap-hydra' for convenient debugging and
   navigation.

6. You can use `dap-ui-repl` and print directly the varaibles for their values.

#### TEMPLATE -1-
```lisp
;; Eval Buffer with `M-x eval-buffer' to register the newly created template.

(dap-register-debug-template
  "cpptools::Run Configuration-GHASAKII"
  (list :type "cppdbg"
        :request "launch"
        :name "cpptools::Run Configuration"
        :miDebuggerPath "/Users/gmbp/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/lldb-mi/bin/lldb-mi"
        :MIMode "gdb"
        :program "${workspaceFolder}/build/debug/main"  ;; Refere to your binary here
        :cwd "${workspaceFolder}"))
```

#### TEMPLATE -2- WORKING
- You can also make the directory relative, using:

```lisp
(dap-register-debug-template
 "cpptools::Run Configuration-GHASAKII"
 (list :type "cppdbg"
       :request "launch"
       :name "cpptools::Run Configuration"
       :miDebuggerPath (expand-file-name ".local/share/nvim/mason/packages/cpptools/extension/debugAdapters/lldb-mi/bin/lldb-mi" "~")
       :MIMode "gdb"
       :program "${workspaceFolder}/build/debug/main"  ;; Refer to your binary here
       :cwd "${workspaceFolder}"))
```

#### TEMPLATE -3- WORKING
- I also built the `llvm` project from scratch and I also built the `lldb-mi` based on the `llvm` built and I refer to the same adapter using

```lisp
(dap-register-debug-template
 "cpptools::Run Configuration-GHASAKNEW"
 (list :type "cppdbg"
       :request "launch"
       :name "cpptools::Run Configuration"
       :miDebuggerPath (expand-file-name "buildspace/lldb-mi/build/src/lldb-mi" "~")
       :MIMode "gdb"
       :program "${workspaceFolder}/build/debug/${fileBasenameNoExtension}"  ;; Refer to your binary here
       :cwd "${workspaceFolder}"))
```

#### TEMPLATE -4-
- I also found that we can pass the
  `${workspaceFolder}/build/debug/${fileBasenameNoExtension}`, which will give
  is exactly the `main`, without specifying the binary name, this is super handy
  feature, and configure your adpater more efficiently.

```json
{
  "configurations": [
    {
      "type": "lldb-vscode",
      "request": "launch",
      "name": "C++ LLDB json default",
      "program": "${workspaceFolder}/debug/${fileBasenameNoExtension}",
      "cwd": "${workspaceFolder}",
      "args": []
    }
  ]
}
```

### Comment by reddit users

I was also struggling with this recently and I think the main difficulty for me
was that there are different debug programs that require different
configurations. It took also way longer than it should have to figure out how to
tell the debugger which file to debug and how to pass command-line arguments.
Here is my setup. First the relevant part from .emacs.d/init.el. Second, the
file .emacs.d/default-launch.json. As you can see from the config, I use
lldb-vscode, which is installed under /usr/bin/lldb-vscode.

```elisp

(use-package dap-mode
  :defer
  :custom
  (dap-auto-configure-mode t                           "Automatically configure dap.")
  (dap-auto-configure-features
   '(sessions locals breakpoints expressions tooltip)  "Remove the button panel in the top.")
  :config
  ;;; dap for c++
  (require 'dap-lldb)

  ;;; set the debugger executable (c++)
  (setq dap-lldb-debug-program '("/usr/bin/lldb-vscode"))

  ;;; ask user for executable to debug if not specified explicitly (c++)
  (setq dap-lldb-debugged-program-function (lambda () (read-file-name "Select file to debug.")))

  ;;; default debug template for (c++)
  (dap-register-debug-template
   "C++ LLDB dap"
   (list :type "lldb-vscode"
         :cwd nil
         :args nil
         :request "launch"
         :program nil))

  (defun dap-debug-create-or-edit-json-template ()
    "Edit the C++ debugging configuration or create + edit if none exists yet."
    (interactive)
    (let ((filename (concat (lsp-workspace-root) "/launch.json"))
	  (default "~/.emacs.d/default-launch.json"))
      (unless (file-exists-p filename)
	(copy-file default filename))
      (find-file-existing filename))))

{
    "configurations": [
	{
	    "type": "lldb-vscode",
	    "request": "launch",
	    "name": "C++ LLDB json default",
	    "program": "${workspaceFolder}/debug/${fileBasenameNoExtension}",
	    "cwd": "${workspaceFolder}",
	    "args": [],
	}
    ]
}

```

- Or, we can also use the following (check for further information [here](https://code.visualstudio.com/api/extension-guides/debugger-extension))

```json
"program": {
        "type": "string",
        "description": "Absolute path to a text file.",
        "default": "${workspaceFolder}/${command:AskForProgramName}"
         },
```

- Here, is another launch.json for vscode

```json
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "name": "clang++ - Build and debug active file",
      "type": "cppdbg",
      "request": "launch",
      "program": "${fileDirname}/${fileBasenameNoExtension}",
      "args": [],
      "stopAtEntry": false,
      "cwd": "${workspaceFolder}",
      "environment": [],
      "externalConsole": false,
      "MIMode": "lldb",
      "setupCommands": [
        {
          "description": "Enable pretty-printing for gdb",
          "text": "-enable-pretty-printing",
          "ignoreFailures": true
        }
      ],
      "preLaunchTask": "C/C++: clang++ build active file",
      "miDebuggerPath": "/usr/bin/lldb"
    }
  ]
}
```

- With this I have two ways to debug stuff. The first has no overhead and just
  asks me for the executable to debug. The second is based on a config file for
  the current project that also lets me specify command line arguments.

- The workflow for option 1 is as follows:
  - I run dab-debug and choose "C++ LLDB dap". It then asks me for a file, where
    I select the executable I want to debug. That's it; the debugger starts
    (make sure to set a breakpoint before, otherwise the debugger might finish
    before you notice).
- The workflow for option 2 is as follows:
  - Within my project, I call dap-debug-create-or-edit-json-template, which
    copies my default launch.json to the project root and opens it, so I can edit it
    (or it just opens it, if it already exists). Then, when running dap-debug, I can
    choose the configuration specified in launch.json (the name of my default
    configuration is "C++ LLDB json default"). In the default configuration, it
    starts to debug the program depending on the file of the current buffer. So lets
    say my buffer is program.cpp, then the debugger will debug the executable
    {workspace root}/debug/program. Also, I can add command line arguments to the
    call by adding them to the "args" field. Hope this helps.

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
- [dap-mode configurations](https://emacs-lsp.github.io/dap-mode/page/configuration/)
- [vscode-cpptools](https://emacs-lsp.github.io/dap-mode/page/configuration/#vscode-cpptools)
- [emacs-lsp](https://emacs-lsp.github.io/dap-mode/page/configuration/)
- [debuggin wiht ldb](https://www.hiroakit.com/archives/1966)
- [lldb-debugging-with-cpp-linux](https://stackoverflow.com/questions/63978029/setup-lldb-debugging-with-cpp-extension-in-vscode-linux)
