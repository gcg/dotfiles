#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MODE="${1:-auto}"
RELOAD_TMUX=false

if [[ "${2:-}" == "--reload-tmux" ]]; then
  RELOAD_TMUX=true
fi

if [[ "$MODE" == "auto" ]]; then
  if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null || true)" == "Dark" ]]; then
    MODE="dark"
  else
    MODE="light"
  fi
fi

TARGET="$SCRIPT_DIR/theme-${MODE}.yml"
if [[ ! -f "$TARGET" ]]; then
  exit 1
fi

mkdir -p "$HOME/.cache"
ln -sfn "$TARGET" "$HOME/.cache/gh-dash-theme.yml"

pane_has_gh_dash() {
  local pid="$1"
  local children c
  children="$(pgrep -P "$pid" 2>/dev/null)" || return 1
  for c in $children; do
    if ps -p "$c" -o args= 2>/dev/null | grep -q 'gh-dash'; then
      return 0
    fi
    if pgrep -P "$c" -f 'gh-dash' >/dev/null 2>&1; then
      return 0
    fi
  done
  return 1
}

if [[ "$RELOAD_TMUX" == true ]] && command -v tmux >/dev/null 2>&1; then
  while read -r pane_id pane_pid; do
    [[ -z "$pane_id" || -z "$pane_pid" ]] && continue
    if pane_has_gh_dash "$pane_pid"; then
      tmux send-keys -t "$pane_id" C-c
      (
        sleep 0.4
        tmux send-keys -t "$pane_id" 'gh dash' Enter
      ) &
    fi
  done < <(tmux list-panes -a -F '#{pane_id} #{pane_pid}' 2>/dev/null || true)
fi
