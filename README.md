# yuri

a neovim configuration built from scratch. no plugin managers, no preset distributions.  
named after the character. backronym: **Yet Unother Refined Interface**.

```
 ██╗   ██╗██╗   ██╗██████╗ ██╗
 ╚██╗ ██╔╝██║   ██║██╔══██╗██║
  ╚████╔╝ ██║   ██║██████╔╝██║
   ╚██╔╝  ██║   ██║██╔══██╗██║
    ██║   ╚██████╔╝██║  ██║██║
    ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝
```

---

## what it is

custom neovim setup written entirely in lua. every piece is written by hand — file explorer, lsp configuration, tab management, keybindings, dashboard. nothing is scaffolded from an existing config or starter template.

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

opens automatically when neovim is launched with no arguments. displays the logo, subtitle, and three keybinds. buffer is non-modifiable, no line numbers, no sign column.

| key | action |
|-----|--------|
| `e` | open file explorer (netrw lexplore) |
| `w` | new blank buffer |
| `q` | quit |

---

## keymaps

leader key: `space`

### files & editor

| keymap | action |
|--------|--------|
| `<leader>e` | toggle file explorer |
| `<leader>w` | write file |
| `<leader>q` | quit all |
| `<leader>nh` | clear search highlight |
| `<leader>bd` | delete buffer |

### tabs

| keymap | action |
|--------|--------|
| `<Tab>` | next tab |
| `<S-Tab>` | previous tab |
| `<leader>tn` | new tab |
| `<leader>tx` | close tab |
| `<leader>to` | close other tabs |
| `<leader>te` | new tab with explorer |
| `<leader>tt` | new tab with terminal |
| `<leader>1–5` | jump to tab by index |
| `<leader>tmp` | move tab right |
| `<leader>tmn` | move tab left |

### splits

| keymap | action |
|--------|--------|
| `<C-h>` | focus left split |
| `<C-l>` | focus right split |
| `<C-k>` | focus upper split |
| `<C-j>` | focus lower split |

### editing

| keymap | action |
|--------|--------|
| `<leader>a` | select all |
| `<leader>y` | yank to system clipboard (normal & visual) |
| `J` | join line, cursor stays in place |
| `<C-d>` / `<C-u>` | half-page scroll, centered |
| `n` / `N` | next/prev search result, centered |
| `<` / `>` | indent in visual mode, keep selection |
| `<A-j>` / `<A-k>` | move selected lines down/up |
| `<leader>rw` | search & replace word under cursor |

---

## highlights

custom highlight groups defined under `YuriDash*`, set on `ColorScheme` so they persist across theme switches.

| group | color | usage |
|-------|-------|-------|
| `YuriDashHeader` | `#e8aeff` bold | ascii logo |
| `YuriDashSub` | `#bae1ff` | subtitle line |
| `YuriDashKey` | `#ffb3ba` bold | keybind keys on dashboard |
| `YuriDashText` | `#baffc9` bold | keybind labels on dashboard |

---

## notes

- uses netrw (`lexplore`) as the file explorer, no external plugin
- lsp is configured manually, no plugin wrappers
- tabs are first-class — the workflow assumes multi-tab usage
- dashboard only triggers on a clean launch (no args, no file, no filetype)

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
