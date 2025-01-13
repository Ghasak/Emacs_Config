# Navivations in Spacemacs

## Navigation Intro.

In Spacemacs, you can perform fuzzy file searching (similar to Telescope in
Neovim) using the following methods, depending on your configuration:

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Navivations in Spacemacs](#navivations-in-spacemacs)
  - [Navigation Intro.](#navigation-intro)
  - [Navigation file names - Among many files](#navigation-file-names---among-many-files)
    - [1. **Using Helm (Default in Spacemacs)**](#1-using-helm-default-in-spacemacs)
    - [2. **Using Ivy/Counsel (Optional)**](#2-using-ivycounsel-optional)
    - [3. **Using FZF (Optional)**](#3-using-fzf-optional)
    - [4. **Enable `projectile` (Optional)**](#4-enable-projectile-optional)
    - [5. **Key Summary Table**](#5-key-summary-table)
  - [Find word inside buffer - Among many files](#find-word-inside-buffer---among-many-files)
    - [1. **Using `helm-ag` (Default with Helm)**](#1-using-helm-ag-default-with-helm)
    - [2. **Using `counsel-rg` (Ivy/Counsel)**](#2-using-counsel-rg-ivycounsel)
    - [3. **Using `fzf` (Optional)**](#3-using-fzf-optional)
    - [4. **Using `grep` or `rgrep` (Built-In Emacs)**](#4-using-grep-or-rgrep-built-in-emacs)
    - [5. **Keybindings Summary**](#5-keybindings-summary)
    - [6. **External Tool Requirements**](#6-external-tool-requirements)
    - [Example Configuration for Best Results](#example-configuration-for-best-results)

<!-- markdown-toc end -->

---

## Navigation file names - Among many files
### 1. **Using Helm (Default in Spacemacs)**

Spacemacs comes with `Helm` as the default completion framework. You can use the
`helm-find-files` or `helm-projectile-find-file` commands for fuzzy file
searching.

- **Search in Current Project:**
  Press `SPC p f` (or `M-m p f` in `emacs` mode) to open the fuzzy file finder in the current project.

- **Search for Any File:**
  Press `SPC f f` (or `M-m f f` in `emacs` mode) to search for files starting from the current directory.

---

### 2. **Using Ivy/Counsel (Optional)**

If you've switched to the Ivy/Counsel framework, you can use the following:

- **Search in Current Project:**
  Press `SPC p f` (or `M-m p f` in `emacs` mode). This will use `counsel-projectile-find-file`.

- **Search for Any File:**
  Press `SPC f f` to use `counsel-find-file`.

To enable Ivy, ensure that your `.spacemacs` configuration includes:

```emacs-lisp
dotspacemacs-configuration-layers
'(
  ivy
)
```

---

### 3. **Using FZF (Optional)**

You can also integrate `fzf` for a Telescope-like experience:

- Install `fzf` on your system (via `brew install fzf` on macOS).
- Add the `fzf` layer in your `.spacemacs` file:
  ```emacs-lisp
  dotspacemacs-configuration-layers
  '(
    fzf
  )
  ```
- Use the following commands:
  - `SPC f z`: Run `fzf` in the current directory.
  - `SPC p z`: Run `fzf` within the current project.

---

### 4. **Enable `projectile` (Optional)**

If you want to enhance file finding within projects:

- Ensure `projectile` is enabled (it usually is by default in Spacemacs).
- Use `SPC p f` for fuzzy finding files in a project.

---

### 5. **Key Summary Table**

| Keybinding | Framework | Action                              |
| ---------- | --------- | ----------------------------------- |
| `SPC p f`  | Helm/Ivy  | Find file in the current project    |
| `SPC f f`  | Helm/Ivy  | Find file starting from a directory |
| `SPC f z`  | FZF       | Fuzzy find files in the directory   |
| `SPC p z`  | FZF       | Fuzzy find files in the project     |

Choose the framework you prefer (Helm, Ivy, or FZF) based on your workflow and
configuration. Let me know if you'd like help setting up any of these!

To search for a word or pattern across multiple files in **Spacemacs**, you can use the following methods depending on your configuration and preferred tools.

---

## Find word inside buffer - Among many files
### 1. **Using `helm-ag` (Default with Helm)**

The `helm-ag` package integrates with Spacemacs and provides a great interface for searching words in multiple files.

- **Search in Project:**
  Press `SPC /` (or `M-m /` in `emacs` mode). This searches for a word in the current project using `ag` (The Silver Searcher).

- **Search in a Specific Directory:**
  Press `SPC s a` and specify the directory where you want to search.

- **Live Search:**
  Press `SPC s g` to use `helm-ag` in live mode, allowing you to type the search term interactively.

---

### 2. **Using `counsel-rg` (Ivy/Counsel)**

If you have Ivy configured, you can use Ripgrep for fast word searching.

- **Search in Project:**
  Press `SPC s p` to use `counsel-projectile-rg` to search for a word in the project.

- **Search in Directory:**
  Press `SPC s r` to use `counsel-rg` and specify the directory for your search.

---

### 3. **Using `fzf` (Optional)**

If you've enabled the `fzf` layer in Spacemacs, you can search for words using FZF.

- **Search for Word:**
  Press `SPC f z` to open `fzf`, and then type the search term.

---

### 4. **Using `grep` or `rgrep` (Built-In Emacs)**

You can use the built-in `grep` or `rgrep` commands in Emacs if no external tools are configured.

- **Search with `grep`:**
  Press `SPC s g` (or `M-x grep`) and specify the grep command along with the word and file pattern.

- **Recursive Search with `rgrep`:**
  Press `M-x rgrep` to recursively search for a word in all files in the current directory and its subdirectories.

---

### 5. **Keybindings Summary**

| Keybinding | Tool            | Action                                    |
| ---------- | --------------- | ----------------------------------------- |
| `SPC /`    | Helm Ag         | Search for a word in the project          |
| `SPC s a`  | Helm Ag         | Search for a word in a directory          |
| `SPC s g`  | Helm Ag         | Live search for a word                    |
| `SPC s p`  | Counsel Ripgrep | Search for a word in the project          |
| `SPC s r`  | Counsel Ripgrep | Search for a word in a specific directory |
| `SPC f z`  | FZF             | Search for a word (if FZF is enabled)     |
| `SPC s g`  | Grep/Rgrep      | Search using built-in grep/rgrep commands |

---

### 6. **External Tool Requirements**

- **The Silver Searcher (`ag`)**: Install via `brew install ag` (on macOS).
- **Ripgrep (`rg`)**: Install via `brew install ripgrep`.
- **FZF**: Install via `brew install fzf`.

---

### Example Configuration for Best Results

- Ensure the `helm-ag`, `fzf`, or `ivy` layers are enabled in your `.spacemacs` configuration:
  ```emacs-lisp
  dotspacemacs-configuration-layers
  '(
    helm    ;; Or ivy if you prefer
    fzf
    )
  ```

Let me know if you need further help configuring or using any of these tools!
