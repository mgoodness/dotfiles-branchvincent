status is-login || exit

set -Uq fish_features || set -U fish_features all

# Environment
set -gx BAT_THEME TwoDark

set -gx EDITOR nvim
if command -q code
    set -gx EDITOR code --wait
else if command -q hx
    set -gx EDITOR hx
end

set -gx FZF_DEFAULT_OPTS --ansi --color=16 --height=80% --layout=reverse --marker="*" --preview-window=wrap

set -gx GIT_MERGE_AUTOEDIT no # accept default merge commit message
set -gx GIT_WORKSPACE ~/Code

set -gx LESSCHARSET utf-8
set -gx LESS --incsearch --ignore-case --jump-target=.5 --LONG-PROMPT --raw-control-chars --quit-if-one-screen
set -gx PAGER less

command -q delta || set -gx GIT_PAGER $PAGER

set -gx SSH_AUTH_SOCK ~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock
set -gx USE_GKE_GCLOUD_AUTH_PLUGIN True

# Daily update
up --auto

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish
