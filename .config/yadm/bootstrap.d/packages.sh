# shellcheck shell=bash
#
# Install non-Homebrew packages & plugins

### Rust ###
if ! has rustup; then
    debug "Rust"
    export CARGO_HOME=~/.local/share/cargo RUSTUP_HOME=~/.local/share/rustup
    curl -fsS https://sh.rustup.rs | sh -s -- -y --quiet --no-modify-path
fi

### VS Code ###
# if has code; then
#     debug "VS Code"
#     missing=$(comm -13 <(code --list-extensions | sort) <(sort ~/.config/code/extensions.txt))
#     if [ -n "$missing" ]; then
#         debug "Installing extensions"
#         echo "$missing" | sed 's/^/--install-extension /' | xargs code
#     fi
# fi

### Helm ###
if has helm; then
    debug "Helm"
fi

### Krew ###
if has kubectl krew; then
    debug "Krew"
    kubectl krew install <~/.config/krew/plugins.txt
fi

### KSOPS ###
if has ksops; then
    debug "KSOPS"
    curl -fsLS https://github.com/viaduct-ai/kustomize-sops/releases/latest/download/ksops_latest_Darwin_x86_64.tar.gz | tar -xz -C /usr/local/bin
fi
