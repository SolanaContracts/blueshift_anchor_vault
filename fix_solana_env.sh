# Fix Solana Development Environment Setup

# 1. First, let's check if Solana is actually installed
ls -la ~/.local/share/solana/install/active_release/bin/

# 2. Add Solana CLI to PATH permanently
echo 'export PATH="/home/codespace/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc

# 3. Load NVM properly (it's installed but not loaded)
export NVM_DIR="/usr/local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# 4. Reload the shell configuration
source ~/.bashrc

# 5. Verify installations
echo "=== Checking Solana CLI ==="
solana --version

echo "=== Checking Anchor CLI ==="
anchor --version

echo "=== Checking NVM ==="
nvm --version

echo "=== Checking Node.js ==="
node --version

echo "=== Checking Rust ==="
rustc --version

# 6. If Solana CLI still doesn't work, try manual installation
if ! command -v solana &> /dev/null; then
    echo "Solana CLI not found in PATH. Installing manually..."
    sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
    export PATH="/home/codespace/.local/share/solana/install/active_release/bin:$PATH"
fi

# 7. Set Solana config for development
echo "=== Setting up Solana config ==="
solana config set --url localhost
solana-keygen new --no-bip39-passphrase --silent --outfile ~/.config/solana/id.json || echo "Keypair already exists"

echo "=== Final verification ==="
echo "Solana CLI: $(solana --version)"
echo "Anchor CLI: $(anchor --version)"
echo "Node.js: $(node --version)"
echo "Rust: $(rustc --version)"
echo "Current Solana config:"
solana config get
