# yuri

a neovim configuration built from scratch. no plugin managers, no preset distributions.  

```
 ██╗   ██╗██╗   ██╗██████╗ ██╗
 ╚██╗ ██╔╝██║   ██║██╔══██╗██║
  ╚████╔╝ ██║   ██║██████╔╝██║
   ╚██╔╝  ██║   ██║██╔══██╗██║
    ██║   ╚██████╔╝██║  ██║██║
    ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝
```

---

## structure

```
~/.config/nvim/
└── lua/
    └── yuri/
        ├── dashboard.lua   — startup screen
        ├── keymaps.lua     — all keybindings
        └── ...
```

---

## dashboard


| key | action |
|-----|--------|
| `e` | open file explorer (netrw lexplore) |
| `w` | new blank buffer |
| `q` | quit |

---

## keymaps

leader key: `space`

---

## notes

- uses netrw (`lexplore`) as the file explorer, no external plugin
- lsp is configured manually, no plugin wrappers
- tabs are first-class — the workflow assumes multi-tab usage
- dashboard only triggers on a clean launch (no args, no file, no filetype)
- !! this project is very new, and there are a lot of bugs yet to be fixed. !!

---

## requirements

- neovim 0.9+
- a nerd font or compatible terminal font for the ascii logo to render correctly

---

## install

```sh
git clone https://github.com/youruser/yuri ~/.config/nvim
```

launch neovim.
