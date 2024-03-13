#!/bin/bash

# Function to delete CRDs containing either "model-registry" or "modelregistry"
delete_crds() {
    # Get CRDs containing either "model-registry" or "modelregistry"
    crds=$(oc get crd --no-headers | awk '$1 ~ /model-registry|modelregistry/ { print $1 }')

    # Delete CRDs found
    for crd in $crds; do
        echo "Deleting CRD: $crd..."
        oc delete crd $crd
    done
}

# Function to delete OpenShift resources containing either "model-registry" or "modelregistry"
delete_resources() {
    local resources=("deployment" "service" "route")
    
    # Loop through each resource
    for resource in "${resources[@]}"; do
        # Get resource names containing either "model-registry" or "modelregistry"
        resource_names=$(oc get $resource --all-namespaces --no-headers | awk -v rs="$resource" '$2 ~ /model-registry|modelregistry/ { print $2 }')

        # Delete resources found
        for name in $resource_names; do
            echo "Deleting $resource: $name..."
            oc delete $resource $name -n default
        done
    done
}

# Delete CRDs containing either "model-registry" or "modelregistry"
delete_crds

# Delete resources containing either "model-registry" or "modelregistry"
delete_resources