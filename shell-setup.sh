#!/bin/bash
# IPS26-Dubai Shell Configuration Setup
# Source this in your ~/.bashrc to activate ips/IPS commands globally
# Location: /home/alex/IPS26-Dubai/shell-setup.sh

IPS_PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Jump to IPS26-Dubai directory
ips() {
  cd "$IPS_PROJECT_DIR"
}

IPS() {
  cd "$IPS_PROJECT_DIR"
}

# Optional: Add to prompt to show you're in IPS project
# export PS1="\[\033[32m\][IPS26]\[\033[0m\] $PS1"
