function kube-context
    if test -n "$argv"
        set -f fzf_query "--query=$argv"
    end

    set -l context (kubectl config get-contexts -o name | fzf --no-multi $fzf_query)

    if test -n "$context"
        kubectl config use-context $context
    end
end
