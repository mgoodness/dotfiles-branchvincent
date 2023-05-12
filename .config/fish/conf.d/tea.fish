# https://github.com/teaxyz/cli

status is-interactive || exit
command -q tea || exit

set -gx TEA_PREFIX $XDG_DATA_HOME/tea
# test -L $LOCAL_BIN/tea || ln -sf $TEA_PREFIX/tea.xyz/v0/bin/tea $LOCAL_BIN/tea

# tea --magic
function fish_command_not_found
    tea -- $argv
end
