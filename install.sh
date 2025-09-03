#!/bin/bash
# Installer for Omarchy Display Tools (v5.1 - Final)

echo "--- Omarchy Display Tools :: Installer ---"

BIN_DIR="$HOME/.local/bin"
SERVICE_DIR="$HOME/.config/systemd/user"
BINDINGS_FILE="$HOME/.config/hypr/bindings.conf"

# Step 1: Install scripts
echo "[1/3] Installing scripts (toggle-monitor, lid-manager)..."
mkdir -p "$BIN_DIR"
cp toggle-monitor lid-manager "$BIN_DIR/"
chmod +x "$BIN_DIR/toggle-monitor" "$BIN_DIR/lid-manager"
echo "Scripts installed to $BIN_DIR."

# Step 2: Install and enable the systemd service
echo "[2/3] Setting up systemd service for lid management..."
mkdir -p "$SERVICE_DIR"
cp lid-monitor.service "$SERVICE_DIR/"
systemctl --user daemon-reload
systemctl --user enable --now lid-monitor.service
echo "Systemd service 'lid-monitor.service' enabled and started."

# Step 3: Add keyboard shortcuts
echo "[3/3] Adding keyboard shortcuts to '$BINDINGS_FILE'..."
SHORTCUT_BLOCK=$'\n# Custom shortcuts for Omarchy Monitor Toggle\nbindd = SUPER CTRL, D, Toggle Laptop Screen, exec, ~/.local/bin/toggle-monitor eDP-1\nbindd = SUPER CTRL, F, Toggle External Screen, exec, ~/.local/bin/toggle-monitor DP-1'
if ! grep -q "toggle-monitor" "$BINDINGS_FILE"; then
    echo "$SHORTCUT_BLOCK" >> "$BINDINGS_FILE"
    echo "Shortcuts added."
else
    echo "Shortcuts already exist. Skipping."
fi

# Final instructions
echo -e "\n\033[1;32mInstallation complete!\033[0m"
echo "------------------------------------------------"
echo "NOTE: For lid detection to work, you may need to edit '/etc/systemd/logind.conf' and set 'HandleLidSwitch=ignore'."
echo "A system reboot is recommended after that change."
echo "Reload Hyprland now to activate all features."
