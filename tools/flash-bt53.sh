#!/usr/bin/env bash
# Nap firmware cho module E104-BT53A1 (EFR32BG22) qua J-Link + pyOCD.
#
# Bat buoc tat MPU (MPU_CTRL = 0) trong cung mot phien pyOCD truoc khi nap:
# firmware bat MPU de cam thuc thi code trong RAM, ma thuat toan nap flash cua
# pyOCD lai phai chay trong RAM -> quen buoc nay se loi "flash init failure (0x110d)".
#
#   ./flash-bt53.sh              # nap firmware beacon
#   ./flash-bt53.sh --bootloader # nap bootloader truoc (chi 1 lan cho moi module)

set -euo pipefail

SILABS_DIR="${SILABS_DIR:-$HOME/silabs}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="efr32bg22c112f352gm32"

PYOCD="$SILABS_DIR/pyocd-venv/bin/pyocd"
export LD_LIBRARY_PATH="$SILABS_DIR/SimplicityCommander-Linux/commander:${LD_LIBRARY_PATH:-}"

if [[ "${1:-}" == "--bootloader" ]]; then
  HEX="$SILABS_DIR/bootloader_bt53/build/debug/bootloader_bt53.hex"
else
  HEX="$REPO_DIR/beacon_bt53/build/debug/beacon_bt53.hex"
fi

[[ -f "$HEX" ]] || { echo "Khong thay file: $HEX (build truoc da)" >&2; exit 1; }

echo "Nap: $HEX"
"$PYOCD" cmd -t "$TARGET" \
  -c "halt" \
  -c "write32 0xE000ED94 0x00000000" \
  -c "load $HEX"

echo "Khoi dong lai chip..."
"$PYOCD" cmd -t "$TARGET" -c "halt" -c "write32 0xE000ED0C 0x05FA0004" >/dev/null

echo "Xong. Quet BLE se thay ten dang E73-<benhvien>-B..-K..-F..-<stt>"
