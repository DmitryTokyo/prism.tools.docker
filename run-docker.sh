#!/usr/bin/env bash
set -euo pipefail

DEFAULT_PORT=8080
SERVICE_NAME="prism-tools-docker"

is_port_in_use() {
  local port="$1"

  if command -v lsof >/dev/null 2>&1; then
    lsof -iTCP:"$port" -sTCP:LISTEN >/dev/null 2>&1
    return $?
  fi

  if command -v ss >/dev/null 2>&1; then
    ss -ltn "( sport = :$port )" | tail -n +2 | grep -q .
    return $?
  fi

  return 1
}

if ! command -v docker >/dev/null 2>&1; then
  echo "Error: docker is not installed or not available in PATH."
  exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
  echo "Error: docker compose is not available."
  exit 1
fi

RUNNING_CONTAINER_ID="$(docker compose ps --status running -q "${SERVICE_NAME}" 2>/dev/null || true)"
CURRENT_PORT=""

if [[ -n "$RUNNING_CONTAINER_ID" ]]; then
  CURRENT_PORT="$(docker inspect -f '{{(index (index .NetworkSettings.Ports "80/tcp") 0).HostPort}}' "$RUNNING_CONTAINER_ID" 2>/dev/null || true)"
fi

is_valid_port() {
  local port="$1"

  if ! [[ "$port" =~ ^[0-9]+$ ]]; then
    return 1
  fi

  if (( port < 1 || port > 65535 )); then
    return 1
  fi

  return 0
}

prompt_for_port() {
  local selected_port

  while true; do
    read -r -p "Which host port should be used? [${DEFAULT_PORT}]: " selected_port
    selected_port="${selected_port:-$DEFAULT_PORT}"

    if ! is_valid_port "$selected_port"; then
      echo "Port must be a number in range 1..65535."
      continue
    fi

    if is_port_in_use "$selected_port"; then
      echo "Port ${selected_port} is already in use. Please choose another port."
      continue
    fi

    HOST_PORT="$selected_port"
    break
  done
}

if [[ -n "$CURRENT_PORT" ]] && is_valid_port "$CURRENT_PORT"; then
  while true; do
    read -r -p "Project is already running on port ${CURRENT_PORT}. Keep this port? [Y/n]: " KEEP_CURRENT_PORT
    KEEP_CURRENT_PORT="${KEEP_CURRENT_PORT:-Y}"

    case "$KEEP_CURRENT_PORT" in
      [Yy]|[Yy][Ee][Ss])
        HOST_PORT="$CURRENT_PORT"
        break
        ;;
      [Nn]|[Nn][Oo])
        if [[ -n "$RUNNING_CONTAINER_ID" ]]; then
          echo "Running prism-tools containers detected. Stopping them first..."
          docker compose down
          RUNNING_CONTAINER_ID=""
        fi
        prompt_for_port
        break
        ;;
      *)
        echo "Please answer yes or no."
        ;;
    esac
  done
else
  prompt_for_port
fi

if [[ -n "$RUNNING_CONTAINER_ID" ]]; then
  echo "Running prism-tools containers detected. Stopping them first..."
  docker compose down
fi

echo "Starting prism-tools on http://localhost:${HOST_PORT}"
HOST_PORT="$HOST_PORT" docker compose up --build -d

echo "Container started."
echo "Open: http://localhost:${HOST_PORT}"
