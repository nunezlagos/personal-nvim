# personal-nvim

Mi configuración personal de Neovim. Basada en [LazyVim](https://lazyvim.org) con plugins y herramientas propias.

## Instalar

```bash
git clone https://github.com/nunezlagos/personal-nvim.git ~/personal-nvim
cd ~/personal-nvim
./install.sh
```

Al abrir Neovim por primera vez, Lazy.nvim instala todos los plugins automáticamente.

## Stack

| Componente | Descripción |
|-----------|-------------|
| [LazyVim](https://lazyvim.org) | Base con defaults sensatos |
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

## Dashboard

El dashboard de inicio (`<leader>dh`) incluye:

- **p** — Proyectos en `~/Proyectos`
- **t** — Conexiones SSH (desde `.env`)
- **d** — Centro Docker (compose, exec, ps)
- **f** — Buscar archivos (Telescope)
- **c** — Lazy (plugin manager)
- **q** — Salir

## SSH Manager

El dashboard gestiona conexiones SSH sin exponer credenciales. Las conexiones se configuran en `~/.config/nvim/.env` (no trackeado en git).

```bash
# ~/.config/nvim/.env
connection_1_name=mi-server
connection_1_host=192.168.1.100
connection_1_user=admin
connection_1_key=~/.ssh/id_rsa
```

Ver `.env_example` para más opciones (puerto, password, variables de entorno remotas).

## Keymaps principales

| Keymap | Acción |
|--------|--------|
| `<leader>tt` | Menu SSH |
| `<leader>td` | Centro Docker |
| `<leader>t.` | Terminal debug |
| `<leader>t,` | Terminal flotante |
| `<leader>sm` | SSHFS montar |
| `<leader>su` | SSHFS desmontar |
| `<C-Left/Right>` | Navegar buffers |
| `<leader>bd` | Cerrar buffer (pregunta si hay cambios) |
| `<leader>w` | Guardar |
| `<leader>sh/sv` | Split horizontal/vertical |

## Estructura

```
nvim/
├── init.lua                  # Entry point
├── colors/dark-custom.lua    # Colorscheme propio
├── lua/
│   ├── config/
│   │   ├── lazy.lua          # Plugin manager setup
│   │   ├── options.lua       # Opciones globales
│   │   ├── keymaps.lua       # Keymaps personalizados
│   │   ├── autocmds.lua      # Autocomandos
│   │   └── theme.lua         # Theme config
│   └── plugins/
│       ├── dashboard.lua     # Dashboard + SSH + Docker + Proyectos
│       ├── colorscheme.lua   # Colorscheme override
│       ├── telescope.lua     # Fuzzy finder config
│       ├── lsp.lua           # LSP servers
│       ├── treesitter.lua    # Syntax config
│       ├── lazygit.lua       # Git TUI
│       ├── diffview.lua      # Diff viewer
│       └── autosave.lua      # Auto-save config
├── .env_example              # Template de conexiones SSH
└── lazy-lock.json            # Lock file de plugins
```
