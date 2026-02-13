#!/usr/bin/env bash
set -euo pipefail

DEFAULT_PORT=8080

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

RUNNING_CONTAINERS="$(docker compose ps --status running -q 2>/dev/null || true)"
if [[ -n "$RUNNING_CONTAINERS" ]]; then
  echo "Running prism-tools containers detected. Stopping them first..."
  docker compose down
fi

while true; do
  read -r -p "Which host port should be used? [${DEFAULT_PORT}]: " HOST_PORT
  HOST_PORT="${HOST_PORT:-$DEFAULT_PORT}"

  if ! [[ "$HOST_PORT" =~ ^[0-9]+$ ]]; then
    echo "Port must be a number."
    continue
  fi

  if (( HOST_PORT < 1 || HOST_PORT > 65535 )); then
    echo "Port must be in range 1..65535."
    continue
  fi

  if is_port_in_use "$HOST_PORT"; then
    echo "Port ${HOST_PORT} is already in use. Please choose another port."
    continue
  fi

  break
done

echo "Starting prism-tools on http://localhost:${HOST_PORT}"
HOST_PORT="$HOST_PORT" docker compose up --build -d

echo "Container started."
echo "Open: http://localhost:${HOST_PORT}"
