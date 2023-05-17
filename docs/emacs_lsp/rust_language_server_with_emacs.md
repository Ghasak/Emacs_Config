# Rust-Analyzer Configurations for Emacs

## Problem withh rust-analyzer
I have faced a problem with `rust-analyzer` it shows that it is not working. The
reason is that `rust-analyzer` was not working and not installed on my machine.
You can install it using either.

1. Homebrew

```shell
brew install rust-analyzer
# Current I have
#╭─ gmbp   GMacBookPro on ~/Desktop/emacs_testing/docs   
#├─ﮧ INSERT  19487d12h59m|master ?5
#╰─ rust-analyzer --version
#rust-analyzer 0.0.0 (833d5301d 2023-05-07)
```
2. Export the already existed `stable` version comes with `cargo` located at `~/.cargo/bin/`

3. You can download the `rust-analyzer` binary from here

- [Rust-Analyzer](https://github.com/rust-lang/rust-analyzer/releases)

Currently I have the following installed on my `spacemacs`.

```shell
Workspaces:
Loaded 12 packages across 1 workspace.
Workspace root folders: [AbsPath("/Users/gmbp/Desktop/emacs_testing/rust")]
Vfs memory usage: 22998339

Analysis:
21mb of files
499 trees, 128 preserved
7537 trees, 512 preserved (macros)
0b of library index symbols (0)
0b of module index symbols (0)
0b in total

Debug info:
42010 attribute query entries, 180524 total attributes (4mb for storing entries)
8036 ast id maps

File info:
Crate: emacs_testing(11)
Dependencies: core=Idx::<CrateData>(0), alloc=Idx::<CrateData>(1), test=Idx::<CrateData>(8), std=Idx::<CrateData>(9), proc_macro=Idx::<CrateData>(10)
```


## Can we add inlay
