#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────
# personal-nvim — install.sh
# Instala el ecosistema completo: nvim, zsh, tmux, alacritty, lazygit, git
# ─────────────────────────────────────────────────────────────────────────────

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOTAL=7

# ── Helpers ──────────────────────────────────────────────────────────────────
ok()   { echo "  [OK]  $*"; }
fail() { echo "  [!!]  $*" >&2; exit 1; }
warn() { echo "  [~~]  $*"; }
skip() { echo "  [--]  $*"; }
step() { echo; echo "[$1/$TOTAL] $2"; echo "  ────────────────────────────────"; }

backup_if_exists() {
  local target="$1"
  if [ -e "$target" ]; then
    local backup="${target}.bak.$(date +%Y%m%d_%H%M%S)"
    cp -r "$target" "$backup"
    warn "Backup: $backup"
  fi
}

# ─────────────────────────────────────────────────────────────────────────────
echo
echo "  personal-nvim — Instalación del ecosistema"
echo "  ════════════════════════════════════════════════════════"
echo

# ── Paso 1: Verificar dependencias ───────────────────────────────────────────
step 1 "Verificando dependencias"

check_dep() {
  if command -v "$1" >/dev/null 2>&1; then
    ok "$1 disponible"
  else
    warn "$1 no encontrado — instalá manualmente"
  fi
}

check_dep nvim
check_dep git
check_dep zsh
check_dep tmux
check_dep alacritty
command -v curl >/dev/null 2>&1 || fail "curl es requerido para instalar dependencias"

# ── Paso 2: Neovim ────────────────────────────────────────────────────────────
step 2 "Instalando config de Neovim → ~/.config/nvim"

NVIM_CONFIG="$HOME/.config/nvim"
backup_if_exists "$NVIM_CONFIG"
mkdir -p "$NVIM_CONFIG"
cp -r "$REPO_DIR/nvim/." "$NVIM_CONFIG/"
ok "Config de Neovim copiada"

if [ ! -f "$NVIM_CONFIG/.env" ]; then
  cp "$REPO_DIR/nvim/.env_example" "$NVIM_CONFIG/.env"
  warn ".env creado — editá ~/.config/nvim/.env con tus conexiones SSH"
else
  skip ".env ya existe — no se sobreescribe"
fi

# ── Paso 3: Zsh + Powerlevel10k ──────────────────────────────────────────────
step 3 "Instalando config de Zsh → ~/.zshrc, ~/.p10k.zsh"

backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.p10k.zsh"
cp "$REPO_DIR/zsh/.zshrc"    "$HOME/.zshrc"
cp "$REPO_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
ok ".zshrc copiado"
ok ".p10k.zsh copiado"

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  warn "Oh My Zsh no encontrado — instalando..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  ok "Oh My Zsh instalado"
else
  skip "Oh My Zsh ya instalado"
fi

# Powerlevel10k
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
  warn "Powerlevel10k no encontrado — clonando..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
  ok "Powerlevel10k instalado"
else
  skip "Powerlevel10k ya instalado"
fi

# Plugins de zsh
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
install_zsh_plugin() {
  local name="$1" url="$2"
  local dir="$ZSH_CUSTOM/plugins/$name"
  if [ ! -d "$dir" ]; then
    git clone --depth=1 "$url" "$dir"
    ok "Plugin zsh: $name instalado"
  else
    skip "Plugin zsh: $name ya instalado"
  fi
}

install_zsh_plugin "zsh-autosuggestions"     "https://github.com/zsh-users/zsh-autosuggestions"
install_zsh_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"

# ── Paso 4: Tmux ─────────────────────────────────────────────────────────────
step 4 "Instalando config de Tmux → ~/.tmux.conf"

backup_if_exists "$HOME/.tmux.conf"
cp "$REPO_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
ok ".tmux.conf copiado"

# TPM (Tmux Plugin Manager)
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  warn "TPM no encontrado — clonando..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  ok "TPM instalado"
else
  skip "TPM ya instalado"
fi

# Instalar plugins
"$TPM_DIR/scripts/install_plugins.sh" >/dev/null 2>&1 \
  && ok "Plugins de tmux instalados" \
  || warn "Abrí tmux y ejecutá: prefix + I  para instalar plugins"

# ── Paso 5: Alacritty ────────────────────────────────────────────────────────
step 5 "Instalando config de Alacritty → ~/.config/alacritty"

ALACRITTY_DIR="$HOME/.config/alacritty"
backup_if_exists "$ALACRITTY_DIR"
mkdir -p "$ALACRITTY_DIR"
cp "$REPO_DIR/alacritty/alacritty.toml" "$ALACRITTY_DIR/"
cp "$REPO_DIR/alacritty/alacritty.yml"  "$ALACRITTY_DIR/"
ok "Config de Alacritty copiada"
warn "Fuente requerida: IosevkaTerm Nerd Font — https://www.nerdfonts.com/font-downloads"

# ── Paso 6: Lazygit ───────────────────────────────────────────────────────────
step 6 "Instalando config de Lazygit → ~/.config/lazygit"

LAZYGIT_DIR="$HOME/.config/lazygit"
mkdir -p "$LAZYGIT_DIR"
backup_if_exists "$LAZYGIT_DIR/config.yml"
cp "$REPO_DIR/lazygit/config.yml" "$LAZYGIT_DIR/config.yml"
ok "Config de Lazygit copiada"

# ── Paso 7: Git ───────────────────────────────────────────────────────────────
step 7 "Configurando Git → ~/.gitconfig"

if [ ! -f "$HOME/.gitconfig" ]; then
  cp "$REPO_DIR/git/.gitconfig.template" "$HOME/.gitconfig"
  warn ".gitconfig creado desde template — actualizá con:"
  warn "  git config --global user.name  'Tu Nombre'"
  warn "  git config --global user.email 'tu@email.com'"
else
  skip ".gitconfig ya existe — no se sobreescribe"
fi

# ── Listo ─────────────────────────────────────────────────────────────────────
echo
echo "  ════════════════════════════════════════════════════════"
echo "  Instalación completa."
echo
echo "  Próximos pasos:"
echo "    1. Editá ~/.config/nvim/.env  → conexiones SSH"
echo "    2. Verificá ~/.gitconfig      → nombre y email"
echo "    3. Ejecutá: nvim              → Lazy instala plugins automáticamente"
echo "    4. Abrí tmux y ejecutá: prefix + I   para instalar plugins"
echo "    5. Reiniciá el shell: source ~/.zshrc"
echo "    6. Instalá la fuente: IosevkaTerm Nerd Font"
echo
