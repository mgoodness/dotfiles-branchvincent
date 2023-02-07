function kube-namespace
  if test -n "$argv"
    set -f fzf_query "--query=$argv"
  end

  set -l namespace (kubectl get namespaces -o name | cut -d/ -f2 | fzf --no-multi $fzf_query)

  if test -n "$namespace"
    kubectl config set-context --current --namespace=$namespace
  end
end
