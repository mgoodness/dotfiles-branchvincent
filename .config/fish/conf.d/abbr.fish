# Abbreviations and aliases

status is-interactive || exit

### Abbreviations ###
abbr -ag b brew
abbr -ag d docker
abbr -ag dc "docker compose"
abbr -ag dprune "docker system prune --all --volumes --force"
abbr -ag drun "docker run --rm -it"
abbr -ag dstop "docker ps --quiet | xargs docker stop"
abbr -ag g git
abbr -ag k kubectl
abbr -ag kc kubectx
abbr -ag kn kubens
abbr -ag p poetry
abbr -ag pc pbcopy
abbr -ag pp pbpaste
abbr -ag py python3
abbr -ag urldecode "string unescape --style=url"
abbr -ag urlencode "string escape --style=url"

### Aliases ###
function _alias
    type -q $argv[2] && alias $argv
end
_alias cat bat
if type -q lsd
    alias ls "lsd --icon=never"
    alias ll "ls -l --header --date=relative --blocks=permission,size,user,date,name"
    alias la "ll -A"
    alias lt "ls --tree --depth=1"
end
_alias rm trash
_alias top glances
_alias watch viddy
