# shellcheck shell=bash
#
# Fetch all secrets from 1Password

# Login
eval "$(op signin)"

### docker ###
op item get docker --fields password | docker login --username branchvincent --password-stdin
op item get quay --fields password | docker login quay.io --username branchevincent --password-stdin

## env ###
GITHUB_TOKEN=$(op item get GitHub --fields token)
cat <<EOF >~/.config/fish/conf.d/secrets.fish
set -x AWS_ACCESS_KEY_ID $(op item get AWS --fields api.key)
set -x AWS_SECRET_ACCESS_KEY $(op item get AWS --fields api.secret)
set -x GITHUB_TOKEN $GITHUB_TOKEN
set -x NPM_TOKEN $(op item get NPM --fields token)
EOF
chmod 600 ~/.config/fish/conf.d/secrets.fish

### git ###
printf "protocol=https\nhost=github.com\n" | git credential-osxkeychain erase
printf "protocol=https\nhost=github.com\nusername=branchvincent\npassword=%s\n" "$GITHUB_TOKEN" | git credential-osxkeychain store

### gpg ###
# shellcheck disable=SC2016
GNUPGHOME=$(fish -c 'echo $GNUPGHOME')
GPG_TTY=$(tty)
export GNUPGHOME GPG_TTY
curl -fsSL https://github.com/branchvincent.gpg | gpg --import
op document get GPG | gpg --import
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >~/.local/share/gnupg/gpg-agent.conf

### ssh ###
op document get SSH >~/.config/ssh/keys/default
ssh-add --apple-use-keychain ~/.config/ssh/keys/default

### all-repos ###
mkdir -p ~/.local/share/all-repos
cat <<EOF >~/.local/share/all-repos/config.json
{
  "output_dir": "$HOME/Code/all",
  "source": "all_repos.source.github_org",
  "source_settings": {
    "api_key": "$GITHUB_TOKEN",
    "org": "ndustrialio",
    "private": true
  },
  "push": "all_repos.push.github_pull_request",
  "push_settings": {
    "api_key": "$GITHUB_TOKEN",
    "username": "branchvincent",
    "fork": false
  }
}
EOF
chmod 600 ~/.local/share/all-repos/config.json
