#!/bin/bash
# Install script for Pluto emotion analysis tool

set -e  # Exit on any error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.local/bin"

echo "Pluto Emotion Analysis Tool - Installation Script"
echo "=================================================="

# Create local bin directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating $INSTALL_DIR directory..."
    mkdir -p "$INSTALL_DIR"
fi

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo ""
    echo "⚠️  Warning: $HOME/.local/bin is not in your PATH"
    echo "   Add this line to your ~/.bashrc or ~/.zshrc:"
    echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
fi

# Install dependencies
echo "Installing dependencies..."
cd "$SCRIPT_DIR"
make setup

# Create a wrapper script in ~/.local/bin
echo "Creating pluto command in $INSTALL_DIR..."
cat > "$INSTALL_DIR/pluto" << EOF
#!/bin/bash
# Pluto emotion analysis tool wrapper
python3 "$SCRIPT_DIR/pluto" "\$@"
EOF

chmod +x "$INSTALL_DIR/pluto"

echo ""
echo "✓ Installation complete!"
echo ""
echo "Usage:"
echo "  pluto path/to/textfile.txt"
echo ""
echo "If 'pluto' command is not found, make sure $INSTALL_DIR is in your PATH."
echo "You may need to restart your terminal or run: source ~/.bashrc"
