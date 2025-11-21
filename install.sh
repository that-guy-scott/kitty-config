#!/bin/bash
# Kitty Terminal Configuration Installer

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KITTY_CONFIG_DIR="$HOME/.config/kitty"

echo -e "${GREEN}Kitty Configuration Installer${NC}"
echo "================================"
echo

# Check if kitty is installed
if ! command -v kitty &> /dev/null; then
    echo -e "${RED}Error: Kitty is not installed${NC}"
    echo "Please install Kitty first:"
    echo "  - Arch: sudo pacman -S kitty"
    echo "  - Ubuntu: sudo apt install kitty"
    echo "  - Fedora: sudo dnf install kitty"
    echo "  - macOS: brew install kitty"
    exit 1
fi

echo -e "${GREEN}✓${NC} Kitty is installed"
kitty --version

# Create config directory if it doesn't exist
if [ ! -d "$KITTY_CONFIG_DIR" ]; then
    echo -e "${YELLOW}Creating kitty config directory...${NC}"
    mkdir -p "$KITTY_CONFIG_DIR"
fi

# Backup existing config if present
if [ -f "$KITTY_CONFIG_DIR/kitty.conf" ]; then
    BACKUP_FILE="$KITTY_CONFIG_DIR/kitty.conf.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}Backing up existing config to:${NC}"
    echo "  $BACKUP_FILE"
    cp "$KITTY_CONFIG_DIR/kitty.conf" "$BACKUP_FILE"
fi

# Copy config file
echo -e "${GREEN}Installing kitty.conf...${NC}"
cp "$SCRIPT_DIR/kitty.conf" "$KITTY_CONFIG_DIR/kitty.conf"

echo
echo -e "${GREEN}Installation complete!${NC}"
echo
echo "Next steps:"
echo "  1. Make sure DroidSansM Nerd Font Mono is installed"
echo "  2. Restart Kitty or press Ctrl+Shift+F5 to reload config"
echo
echo "Shell integration (optional):"
echo "  - Bash: Add to ~/.bashrc:"
echo "      source <(kitty + complete setup bash)"
echo "  - Zsh: Add to ~/.zshrc:"
echo "      source <(kitty + complete setup zsh)"
echo "  - Fish: Automatically detected"
echo
echo "Enjoy your configured Kitty terminal!"
