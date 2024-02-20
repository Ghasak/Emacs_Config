# Things to be considered 

Installing `Spaemacs` with latest build from `30.0.50` from scratch needed some
treatment which will be include here.

## How to instal Emacs 
## Configurations for Spacemacs

1. Install all-the-icons [here](https://github.com/domtronn/all-the-icons.el)

```lisp 
M-x all-the-icons-install-fonts
```
2. Install the nerd fonts as well 

```lisp
M-x nerd-icons-install-fonts
```
3. Install tab-nine binary for supporting the auto-completion.

```lisp
M-x  company-tabine-install-binary
```
4. For Language server protocols - setup tools  
- For Rust use 

```lisp
M-x rustci-cargo-install
```
5. Debugging and Debugger. 
- For debugging in C++ and Rust 
for C++ use: 
```lisp
M-x dap-cpptools-setup
```
for Rust use:

## Tools to be included 
