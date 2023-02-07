# shellcheck shell=bash
#
# Install Homebrew and packages

export PATH="/opt/homebrew/bin:/usr/local/bin${PATH+:$PATH}"
if ! has brew; then
    debug "Installing Homebrew"
    NONINTERACTIVE=1 HOMEBREW_INSTALL_FROM_API=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure `brew` is in PATH
case "$(uname -sm)" in
"Darwin arm64") eval "$(/opt/homebrew/bin/brew shellenv)" ;;
"Darwin x86_64") eval "$(/usr/local/bin/brew shellenv)" ;;
"Linux x86_64") eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" ;;
esac

debug "Checking Homebrew packages"
export HOMEBREW_BUNDLE_FILE=~/.config/homebrew/Brewfile
if [ ! -e "$HOMEBREW_PREFIX/bin/yadm" ] || ! brew bundle check &>/dev/null; then
    debug "Installing Homebrew packages"
    brew bundle install --no-lock
fi
