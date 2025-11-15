#!/bin/bash

# Ruby & Rails Quick Installation Script (with APT)

echo "================================================"
echo "  Ruby & Rails Quick Installation"
echo "================================================"
echo ""

# Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to detect if sudo is available and needed
check_sudo() {
    if command -v sudo &> /dev/null && [ "$EUID" -ne 0 ]; then
        info "sudo detected - using sudo for package management"
        SUDO_CMD="sudo"
    else
        info "Running without sudo (root or Termux environment)"
        SUDO_CMD=""
    fi
}

# Check sudo availability before starting
check_sudo

# Configure APT to skip documentation installation
info "Configuring APT to skip documentation..."
APT_CONF_DIR="/etc/apt/apt.conf.d"
APT_CONF_FILE="$APT_CONF_DIR/99-no-install-recommends"

if [ -d "$APT_CONF_DIR" ]; then
    # Create APT config to skip docs, man pages, and recommends
    echo 'APT::Install-Recommends "0";' | $SUDO_CMD tee $APT_CONF_FILE > /dev/null
    echo 'APT::Install-Suggests "0";' | $SUDO_CMD tee -a $APT_CONF_FILE > /dev/null
    echo 'APT::Get::Install-Recommends "false";' | $SUDO_CMD tee -a $APT_CONF_FILE > /dev/null
    echo 'APT::Get::Install-Suggests "false";' | $SUDO_CMD tee -a $APT_CONF_FILE > /dev/null

    # Also create dpkg config to skip docs
    DPKG_CONF_DIR="/etc/dpkg/dpkg.cfg.d"
    DPKG_CONF_FILE="$DPKG_CONF_DIR/01_nodoc"

    if [ -d "$DPKG_CONF_DIR" ]; then
        echo 'path-exclude /usr/share/doc/*' | $SUDO_CMD tee $DPKG_CONF_FILE > /dev/null
        echo 'path-exclude /usr/share/man/*' | $SUDO_CMD tee -a $DPKG_CONF_FILE > /dev/null
        echo 'path-exclude /usr/share/groff/*' | $SUDO_CMD tee -a $DPKG_CONF_FILE > /dev/null
        echo 'path-exclude /usr/share/info/*' | $SUDO_CMD tee -a $DPKG_CONF_FILE > /dev/null
        echo 'path-exclude /usr/share/lintian/*' | $SUDO_CMD tee -a $DPKG_CONF_FILE > /dev/null
        echo 'path-exclude /usr/share/linda/*' | $SUDO_CMD tee -a $DPKG_CONF_FILE > /dev/null
    fi
fi

# 1. Updating package
info "Updating package lists..."
if ! $SUDO_CMD apt update; then
    warn "apt update failed, continuing anyway..."
fi

# 2. Install Ruby and dependencies
info "Installing Ruby and development tools..."
if ! $SUDO_CMD apt install -y ruby-full build-essential libsqlite3-dev nodejs git curl gnupg libssl-dev zlib1g-dev libgmp-dev libyaml-dev tzdata; then
    warn "Some dependencies may not have installed correctly"
fi

# 3. Gem settings
info "Gem configuration in progress..."
echo "gem: --no-document" >> "$HOME/.gemrc"

# 4. Install Bundler
info "Bundler is being installed..."
gem install bundler

# 5. Rails installation option
echo ""

# Check if running in interactive mode (has terminal input)
if [ -t 0 ]; then
    # Interactive mode - ask user
    read -p "Want to install Rails too? (y/n): " install_rails
else
    # Non-interactive mode (piped from curl/wget) - auto install
    info "Running in automatic mode - Rails will be installed"
    install_rails="y"
fi

if [ "$install_rails" = "y" ] || [ "$install_rails" = "Y" ] || [ "$install_rails" = "e" ] || [ "$install_rails" = "E" ]; then
    info "Installing Rails..."
    info "This process may take 3-5 minutes..."
    gem install rails

    rails_version=$(rails -v)
    info "Rails version: $rails_version"
fi

# 6. Summary
echo ""
echo "================================================"
info "Installation completed!"
echo "================================================"
echo ""
echo -e "${BLUE}Installation Summary:${NC}"
echo "  Ruby: $(ruby -v)"
echo "  Gem: $(gem -v)"
echo "  Bundler: $(bundle -v)"

if [ "$install_rails" = "e" ] || [ "$install_rails" = "E" ]; then
    echo "  Rails: $(rails -v)"
fi

echo ""
echo -e "${YELLOW}How to Use:${NC}"
echo "  ruby -v              # Ruby version"
echo "  gem install <gem>    # Gem installation"
echo "  rails new myapp      # New Rails project"
echo "  rails s -b 0.0.0.0   # Start Rails project"
echo ""
echo -e "${GREEN}Happy coding!${NC}"
echo ""
