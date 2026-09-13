#!/bin/bash
set -euo pipefail

# Visuals
BOLD='\033[1m'
DIM='\033[2m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo -e "${YELLOW}${BOLD}  ███████╗██████╗ ██████╗ ${NC}"
echo -e "${YELLOW}${BOLD}  ╚══███╔╝██╔══██╗██╔══██╗${NC}"
echo -e "${YELLOW}${BOLD}    ███╔╝ ██║  ██║██████╔╝${NC}"
echo -e "${YELLOW}${BOLD}   ███╔╝  ██║  ██║██╔══██╗${NC}"
echo -e "${YELLOW}${BOLD}  ███████╗██████╔╝██████╔╝${NC}"
echo -e "${YELLOW}${BOLD}  ╚══════╝╚═════╝ ╚═════╝ ${NC}"
echo -e "  ${YELLOW}${BOLD}ZDB${NC} ${DIM}• Installer${NC}\n"

# Platform check
OS="$(uname -s)"
ARCH="$(uname -m)"

if [ "$OS" != "Darwin" ] || [ "$ARCH" != "arm64" ]; then
    echo -e "  ${RED}Error: zdb requires macOS on Apple Silicon.${NC}"
    exit 1
fi

INSTALL_DIR="${ZDB_DIR:-$HOME/.zdb}"
REPO_URL="https://github.com/unperoxide/zdb.git"

# Clone or update
if [ -d "$INSTALL_DIR/.git" ]; then
    echo -e "  ${CYAN}Updating existing installation in ${INSTALL_DIR}...${NC}"
    git -C "$INSTALL_DIR" pull --ff-only
else
    echo -e "  ${CYAN}Cloning zdb into ${INSTALL_DIR}...${NC}"
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

# Permissions
chmod +x "$INSTALL_DIR/zdb"

# Symlinks and completions
echo -e "  ${CYAN}Configuring system command and completions...${NC}"
"$INSTALL_DIR/zdb" --install

echo ""
echo -e "  ${GREEN}zdb installed successfully.${NC}"
echo ""

if [ ! -d "$INSTALL_DIR/data/mysql" ]; then
    echo "  Start setup with:"
    echo "    zdb --setup"
    echo ""
fi
