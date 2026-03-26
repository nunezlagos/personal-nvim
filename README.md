# personal-nvim

Mi ecosistema de desarrollo completo: Neovim + terminal + shell + multiplexor.

## Instalación rápida

```bash
git clone https://github.com/nunezlagos/personal-nvim.git ~/personal-nvim
cd ~/personal-nvim
./install.sh
```

El script instala y configura todo en orden. Hace backup automático de lo que ya existe.

---

## Componentes

### Neovim

Base [LazyVim](https://lazyvim.org) con plugins y herramientas propias.

| Plugin | Descripción |
|--------|-------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder — dropdown theme |
| [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP (pyright) |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard personalizado |
| [ToggleTerm](https://github.com/akinsho/toggleterm.nvim) | Terminales flotantes/horizontales |
| [Lazygit](https://github.com/kdheepak/lazygit.nvim) | Git TUI integrado |
| [DiffView](https://github.com/sindrets/diffview.nvim) | Diff de archivos/commits |
| [auto-save](https://github.com/okuuva/auto-save.nvim) | Guardado automático |
| Colorscheme propio | `dark-custom` — tema oscuro minimalista |

**Dashboard** (`<leader>dh`): Proyectos, SSH, Docker, Archivos, Lazy, Salir.

**SSH Manager**: Lee conexiones de `~/.config/nvim/.env` (no en git). Ver `.env_example`.

---

### Terminal — Alacritty

- Tema oscuro `#1e1e1e` con paleta personalizada
- Fuente: **IosevkaTerm Nerd Font** (tamaño por defecto)
- Abre directamente en tmux: `tmux a || tmux`
- Ctrl+C / Ctrl+V habilitados
- Scrollback: 10.000 líneas

**Instalar fuente:**
```bash
# Arch/Manjaro
yay -S ttf-iosevka-nerd

# O descargar desde:
# https://www.nerdfonts.com/font-downloads → IosevkaTerm
```

---

### Shell — Zsh + Oh My Zsh + Powerlevel10k

- Tema: **Powerlevel10k** (instant prompt habilitado)
- Plugins: `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`
- PATH configurado para: npm global, go, local bins

---

### Multiplexor — Tmux

Keymaps principales (prefix = `Ctrl+a`):

| Keymap | Acción |
|--------|--------|
| `Alt+n` | Nuevo tab |
| `Alt+h / Alt+←` | Tab anterior |
| `Alt+l / Alt+→` | Tab siguiente |
| `Alt+k` | Cerrar tab |
| `Alt+r` | Renombrar tab |
| `Alt+Shift+q` | Cerrar sesión |
| `prefix + I` | Instalar plugins (tpm) |
| `prefix + Ctrl+s` | Guardar sesión (resurrect) |
| `prefix + Ctrl+r` | Restaurar sesión (resurrect) |

**Plugins** (via [tpm](https://github.com/tmux-plugins/tpm)):
- `tmux-sensible` — defaults razonables
- `tmux-resurrect` — persistir sesiones
- `tmux-yank` — copiar al clipboard del sistema
- `tmux-kanagawa` — tema visual
- `tmux-which-key` — which-key para tmux
- `nvim-tmux-navigation` — navegación nvim ↔ tmux

---

### Git

Config en `git/.gitconfig`. Se instala en `~/.gitconfig` con backup automático.

---

### Lazygit

Config en `lazygit/config.yml`. Integrado en Neovim via `<leader>gg`.

---

## Estructura

```
personal-nvim/
├── alacritty/
│   ├── alacritty.toml         # Config moderna (activa)
│   └── alacritty.yml          # Config legacy
├── git/
│   └── .gitconfig             # Config de git
├── lazygit/
│   └── config.yml             # Config de lazygit
├── nvim/                      # Config completa de Neovim
│   ├── colors/dark-custom.lua # Colorscheme propio
│   ├── init.lua
│   ├── lua/
│   │   ├── config/            # options, keymaps, autocmds, theme
│   │   └── plugins/           # dashboard, lsp, telescope, treesitter...
│   ├── .env_example           # Template de conexiones SSH
│   └── lazy-lock.json
├── tmux/
│   ├── .tmux.conf             # Config de tmux
│   └── plugins.txt            # Lista de plugins (referencia)
├── zsh/
│   ├── .zshrc                 # Config de zsh + oh-my-zsh
│   └── .p10k.zsh              # Config de powerlevel10k
├── install.sh                 # Instalador del ecosistema completo
└── README.md
```

## Keymaps de Neovim — referencia rápida

| Keymap | Acción |
|--------|--------|
| `<leader>dh` | Dashboard |
| `<leader>tt` | Menu SSH |
| `<leader>td` | Centro Docker |
| `<leader>t.` | Terminal debug (horizontal) |
| `<leader>t,` | Terminal flotante |
| `<leader>sm` | SSHFS montar |
| `<leader>su` | SSHFS desmontar |
| `<C-Left/Right>` | Navegar buffers |
| `<leader>bd` | Cerrar buffer (pide guardar si hay cambios) |
| `<leader>w` | Guardar |
| `<leader>sh / sv` | Split horizontal / vertical |
| `<leader>gg` | Lazygit |
| `<leader>h/j/k/l` | Navegar ventanas |
