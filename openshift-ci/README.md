# Model Registry Deployment and Deployment Test

This deployment of model-registry is deployed via Opendatahub and used the ODH nightly images deployed to an openshfit cluster.

The script will do the following:
* Create a catalogue source pointing to the latest successful nightly ODH image.
* Deploy the opendatahub operator using the catalogue source.
* Deploy a Data Science Cluster.
* Test the model-registry-operator-contoller-manager pods are running.
* Clone the model-registry-operator repository.
* Deploy model-registry using config/samples/mysql configuration files.
* Test the model-registry-db mysql database pod is running
* Test the modelregistry-sample pods are running

## Pre-requisites:

You will need to have an openshift cluster deployed and be oc logged into you cluster as admin.

## Runing the script:

From the root of the repository
```shell
./openshift-ci/scripts/oc-model-registry.-deploy.sh
```