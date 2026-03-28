# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$PATH:/home/nunezlagos/.local/bin"
export PATH=$HOME/go/bin:$PATH

alias aider="~/aider-venv/bin/aider --editor nvim"

# ── Selector de proyecto para agentes IA ─────────────────────────────────────
_ai_project_picker() {
  local cmd="$1"; shift

  local proyectos=()
  if [[ -d "$HOME/Proyectos" ]]; then
    for d in "$HOME"/Proyectos/*/; do
      [[ -d "$d" ]] && proyectos+=("$d")
    done
  fi

  echo ""
  echo "  ┌─────────────────────────────────────────┐"
  echo "  │   $cmd — Seleccioná un proyecto          │"
  echo "  └─────────────────────────────────────────┘"
  echo ""

  local show_current=false
  if [[ "$PWD" != "$HOME" && "$PWD" != "$HOME/" ]]; then
    show_current=true
    echo "   0) $(basename $PWD)  \e[2m(directorio actual)\e[0m"
  fi

  local i=1
  for p in "${proyectos[@]}"; do
    echo "   $i) $(basename $p)"
    (( i++ ))
  done

  echo ""
  echo -n "  Elegí [0-$((i-1))] o Enter para cancelar: "
  read -r choice

  [[ -z "$choice" ]] && echo "  Cancelado." && return 1

  if [[ "$choice" == "0" && "$show_current" == true ]]; then
    echo "  → Abriendo en $PWD"
    command "$cmd" "$@"
    return
  fi

  if ! [[ "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice >= i )); then
    echo "  [!!] Opción inválida."
    return 1
  fi

  local target="${proyectos[$choice]}"
  echo "  → $(basename $target)"
  cd "$target" && command "$cmd" "$@"
}

opencode() { _ai_project_picker opencode "$@" }
claude()   { _ai_project_picker claude   "$@" }

# VPN
alias vpn-off="sudo pkill openconnect"

# Starship prompt
eval "$(starship init zsh)"
