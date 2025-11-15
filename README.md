# How To Install Ruby & Rails On Termux & Ubuntu & Debian - Quick Installation Script

[🇹🇷 Türkçe](README.tr.md) | 🇬🇧 English

A fast and simple installation script for Ruby and Rails on Termux/Ubuntu environment and Linux/Debian-based systems using APT package manager.

## Features

- **One-command installation**
- Automatic sudo detection and installation
- Automatically updates system package lists
- Installs Ruby with full development tools
- Configures Gem settings for faster installations
- Installs Bundler package manager
- Optional Rails installation

## Requirements

- **Linux/Debian-based system** (Ubuntu, Debian, Linux Mint, Termux, etc.)
- **Internet connection**

**Note:** The script automatically checks for sudo and installs it if needed!

## Quick Installation (One Command)

Run this single command to download and execute the installation script directly:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/ozbilgic/install-ruby-rails-on-termux-ubuntu-debian/main/install-ruby-rails.sh)
```

Or with wget:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/ozbilgic/install-ruby-rails-on-termux-ubuntu-debian/main/install-ruby-rails.sh)
```

## Manual Installation

1. Clone or download this repository:
```bash
git clone https://github.com/ozbilgic/install-ruby-rails-on-termux-ubuntu-debian.git
cd install-ruby-rails-on-termux-ubuntu-debian
```

2. Make the script executable:
```bash
chmod +x install-ruby-rails.sh
```

3. Run the installation:
```bash
./install-ruby-rails.sh
```

## What Gets Installed

The script installs the following packages:

- **ruby-full** - Complete Ruby programming language
- **build-essential** - Essential compilation tools
- **libsqlite3-dev** - SQLite database development files
- **nodejs** - JavaScript runtime (required for Rails asset pipeline)
- **git** - Version control system
- **curl** - Data transfer tool
- **gnupg** - Encryption tools
- **libssl-dev** - SSL/TLS development files
- **zlib1g-dev** - Compression library
- **libgmp-dev** - Arithmetic library
- **tzdata** - Implementation of standard local time for Termux
- **bundler** - Ruby dependency manager
- **rails** - Web application framework (automatic in one-command mode, optional in manual mode)

## Usage

### Automatic Installation (One-Command)
When using the one-command installation method, Rails is automatically installed without prompting.

### Manual Installation
During manual installation, you'll be prompted:

```
Want to install Rails too? (y/n):
```

- Type `y` or `Y` to install Rails (takes 3-5 minutes)
- Type `n` or any other key to skip Rails installation

## Post-Installation

After successful installation, you can use:

```bash
ruby -v              # Check Ruby version
gem -v               # Check Gem version
bundle -v            # Check Bundler version
rails -v             # Check Rails version (if installed)

gem install <gem>    # Install a Ruby gem
rails new myapp      # Create new Rails application
```

## Troubleshooting

**Permission denied error:**
```bash
chmod +x install-ruby-rails.sh
```

**Sudo not installed:**
- The script automatically detects and installs sudo if needed
- If you don't have sudo and aren't root, run: `su -c 'apt update && apt install -y sudo'`

**Sudo password prompt:**
- The script requires your user password for administrative tasks
- Enter your password when prompted

**Installation fails:**
- Ensure your system is up to date: `sudo apt update && sudo apt upgrade`
- Check your internet connection
- Verify you have sudo privileges: `sudo -v`

**One-command installation fails:**
- Make sure `curl` or `wget` is installed: `sudo apt install curl` or `sudo apt install wget`
- Check your internet connection
- Verify the GitHub URL is correct

## License

MIT License

## Contributing

Feel free to submit issues or pull requests to improve this installation script.

---

Happy coding! 🚀
