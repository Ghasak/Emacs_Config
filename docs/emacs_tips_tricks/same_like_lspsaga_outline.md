# Similar to lsp_saga outline

In **Spacemacs**, the equivalent of Neovim's `:Lspsaga outline` (which
provides a real-time document symbol tree) **does exist**, but is achieved
differently using **LSP + imenu + Helm/Ivy**.

---

## ✅ TL;DR: Spacemacs Equivalent of `:Lspsaga outline`

| Lspsaga (Neovim)                  | Spacemacs Equivalent                                         |
| --------------------------------- | ------------------------------------------------------------ |
| `:Lspsaga outline`                | `SPC m s o` (or `M-m m s o`) using `lsp-ui-imenu` or `imenu` |
| `:Telescope lsp_document_symbols` | `SPC s i` (with `helm-imenu` or `counsel-imenu`)             |

---

## 🔧 How to Use It in Spacemacs

### ✅ 1. **Built-in: `lsp-ui-imenu` Outline**

If you're using `lsp` and `lsp-ui`, simply run:

```
SPC m s o
```

This executes:

```elisp
lsp-ui-imenu
```

✅ It opens a **real-time outline view** in a vertical split — like Lspsaga’s outline.

You can also bind it globally if you like:

```elisp
(define-key global-map (kbd "C-c l o") 'lsp-ui-imenu)
```

---

### ✅ 2. **Alternative: Use `imenu` via Helm/Ivy**

If you’re not using `lsp-ui`, you can still get an outline via:

#### ▶ Helm:

```
SPC s i
```

Runs `helm-imenu` and shows all symbols in the current buffer.

#### ▶ Ivy:

```
SPC /
```

Then type a function/class name (if `imenu` is configured to index them).

---

## 🔧 Optional Enhancements

### Enable `lsp-ui` in `.spacemacs`:

Make sure the following is in your `dotspacemacs-configuration-layers`:

```elisp
(lsp :variables
     lsp-ui-doc-enable t
     lsp-ui-imenu-enable t
     lsp-ui-sideline-enable t)
```

---

## 🧩 Bonus: Persistent Outline Side Panel

For a more **persistent outline window**, you can also use `imenu-list`:

```elisp
(use-package imenu-list
  :bind (("C-' i" . imenu-list-smart-toggle))
  :config
  (setq imenu-list-focus-after-activation t
        imenu-list-auto-resize t))
```

Then open it with:

```
C-' i
```

---

## ✅ Summary

| Action                | Key in Spacemacs | Description                       |
| --------------------- | ---------------- | --------------------------------- |
| Outline with LSP      | `SPC m s o`      | `lsp-ui-imenu` live outline       |
| Helm-based outline    | `SPC s i`        | `helm-imenu`                      |
| Ivy-based outline     | `SPC /`          | Search via indexed imenu          |
| Persistent side panel | `imenu-list`     | Optional plugin with sidebar view |

---

Would you like me to configure `imenu-list` or auto-open `lsp-ui-imenu` in your Spacemacs setup on LSP attach?
