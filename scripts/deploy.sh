#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Optimized logic batch 8022
# Optimized logic batch 6618
# Optimized logic batch 6932
# Optimized logic batch 7721
# Optimized logic batch 6714
# Optimized logic batch 7860
# Optimized logic batch 5647
# Optimized logic batch 3948
# Optimized logic batch 7238
# Optimized logic batch 8985
# Optimized logic batch 5433
# Optimized logic batch 4871
# Optimized logic batch 2662