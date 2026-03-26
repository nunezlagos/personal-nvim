#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────
# personal-nvim — install.sh
# Instala la config de Neovim en ~/.config/nvim
# ─────────────────────────────────────────────────────────────────────────────

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG="$HOME/.config/nvim"
NVIM_SOURCE="$REPO_DIR/nvim"

# ── Helpers ──────────────────────────────────────────────────────────────────
ok()   { echo "  [OK]  $*"; }
fail() { echo "  [!!]  $*" >&2; exit 1; }
warn() { echo "  [~~]  $*"; }
step() { echo; echo "[$1/$TOTAL] $2"; }

TOTAL=4

# ─────────────────────────────────────────────────────────────────────────────
echo
echo "personal-nvim — Setup"
echo "────────────────────────────────────────────────────────"

# ── Paso 1: Verificar dependencias ───────────────────────────────────────────
step 1 "Verificando dependencias"

command -v nvim >/dev/null 2>&1 || fail "Neovim no está instalado. Instalá desde https://neovim.io"
command -v git  >/dev/null 2>&1 || fail "Git no está instalado."

NVIM_VERSION=$(nvim --version | head -1 | grep -oP '\d+\.\d+' | head -1)
ok "Neovim $NVIM_VERSION detectado"
ok "Git disponible"

# ── Paso 2: Backup de config existente ───────────────────────────────────────
step 2 "Backup de config existente"

if [ -d "$NVIM_CONFIG" ]; then
  BACKUP="$HOME/.config/nvim.bak.$(date +%Y%m%d_%H%M%S)"
  cp -r "$NVIM_CONFIG" "$BACKUP"
  warn "Config existente respaldada en: $BACKUP"
else
  ok "No hay config previa — instalación limpia"
fi

# ── Paso 3: Copiar config ─────────────────────────────────────────────────────
step 3 "Copiando config a ~/.config/nvim"

mkdir -p "$NVIM_CONFIG"
cp -r "$NVIM_SOURCE"/. "$NVIM_CONFIG/"
ok "Config copiada"

# ── Paso 4: Configurar .env ───────────────────────────────────────────────────
step 4 "Configurando credenciales SSH"

if [ ! -f "$NVIM_CONFIG/.env" ]; then
  cp "$NVIM_SOURCE/.env_example" "$NVIM_CONFIG/.env"
  warn ".env creado desde template — editá ~/.config/nvim/.env con tus conexiones SSH"
  warn "Formato: connection_1_name=mi-server, connection_1_host=..., connection_1_user=..."
else
  ok ".env ya existe — no se sobreescribe"
fi

# ── Listo ─────────────────────────────────────────────────────────────────────
echo
echo "────────────────────────────────────────────────────────"
echo "  Instalación completa."
echo
echo "  Próximos pasos:"
echo "    1. Editá ~/.config/nvim/.env con tus conexiones SSH"
echo "    2. Ejecutá: nvim"
echo "    3. Lazy.nvim instalará los plugins automáticamente"
echo
