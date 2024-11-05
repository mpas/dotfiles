kube-config-merge() {
    echo "Kube config merge: merging ${1}"
    cp ~/.kube/config ~/.kube/config.bak
    export KUBECONFIG=~/.kube/config:"${1}"
    kubectl config view --flatten > /tmp/config
    mv /tmp/config ~/.kube/config
    echo KUBE_CONFIG
    
    echo "Kube config merge: available clusters"
    kubectl config get-clusters
}

kube-config-context-delete-cluster() {
    echo "Kube config delete cluster with name ${1}"
    kubectl config delete-cluster ${1}
}

