# Abbreviations and aliases

status is-interactive || exit

### Abbreviations ###
abbr b brew
abbr brewski 'brew update && brew bundle && brew upgrade && brew cleanup && brew doctor'

abbr bjson 'bat -l json'
abbr byaml 'bat -l yaml'

abbr calfix 'launchctl stop com.apple.CalendarAgent; and launchctl start com.apple.CalendarAgent'
abbr gpgfix 'gpgconf --kill gpg-agent'

abbr ghe 'GH_HOST=github.mlbam.net gh'
abbr ghepr 'GH_HOST=github.mlbam.net gh pr create --fill'

abbr gbsu 'git branch --set-upstream-to'
abbr gcae 'git commit --allow-empty --verbose'
abbr gcae! 'git commit --allow-empty --amend --verbose'
abbr gpdo 'git push --delete origin'
# abbr grp git-rebase-preserve-author
# abbr grpm 'git-rebase-preserve-author $(git_main_branch)'

# abbr gff 'git-fresh -f'

abbr --position anywhere k kubectl
abbr --position anywhere ksys 'kubectl --namespace=kube-system'
abbr kbuild 'kustomize build'
abbr kc kube-context
abbr kdrain 'kubectl drain --delete-emptydir-data --ignore-daemonsets'
abbr kfailed 'kubectl delete pods -A --field-selector=status.phase=Failed'
abbr kkrew 'kubectl krew'
abbr klogs 'kubectl logs'
abbr kn kube-namespace
abbr kport 'kubectl port-forward'
abbr kwatch 'watch kubectl'

abbr p poetry
abbr pc pbcopy
abbr pp pbpaste
abbr py python3

# abbr sternsys 'stern --namespace=kube-system'

abbr tf terraform
abbr tfgp 'terraform get -update && terraform plan'

abbr urldecode "string unescape --style=url"
abbr urlencode "string escape --style=url"

abbr y yadm


### Aliases ###
function _alias
    command -q $argv[2] && alias $argv
end

_alias cat bat
_alias less 'less --force --no-init --hilite-search --ignore-case --SILENT --status-column --underline-special'

if command -q lsd
    alias ls "lsd --icon=never"
    alias ll "ls -l --header --date=relative --blocks=permission,size,user,date,name"
    alias la "ll -A"
    alias lt "ls --tree --depth=1"
end

# set -gx TREE_IGNORE 'cache|log|logs'
# _alias ll 'exa -all --git --group-directories-first --icons --long'
# _alias ls 'exa --all --group-directories-first --icons '
# _alias lt 'exa --icons --ignore-glob=\"$TREE_IGNORE\" --level=2 --only-dirs --tree'
# _alias tree 'exa --group-directories-first --icons --ignore-glob=\"$TREE_IGNORE\" --tree'

_alias rm trash
_alias top glances
_alias watch viddy
