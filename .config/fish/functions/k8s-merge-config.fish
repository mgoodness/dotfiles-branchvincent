function k8s-merge-config
    set -l ktemp (mktemp)

    echo $KUBECONFIG
    set -l --path KUBECONFIG $KUBECONFIG:$argv[1]
    echo $KUBECONFIG

    # kubectl config view --merge --flatten > $ktemp
    # cp $ktemp $KUBECONFIG
end
