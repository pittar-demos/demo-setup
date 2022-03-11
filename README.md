# Demo Setup

This repository has details on how to use either Red Hat Advanced Cluster Management for Kubernetes or OpenShift GitOps to configure these demos in your own OpenShift cluster.

## Common Setup

Each demo is configured using either [OpenShift GitOps / Argo CD](https://docs.openshift.com/container-platform/4.10/cicd/gitops/understanding-openshift-gitops.html) or [Red Hat Advanced Cluster Management for Kubernetes](https://www.redhat.com/en/technologies/management/advanced-cluster-management) (coming soon).

Pick **one** of the below options to install OpenShift GitOps *or* Advanced Cluster Management, then move on to the configuration specific to the demo you want to try.

### OpenShift GitOps

1. Clone this repository
2. Run the setup script in the `argocd/install` folder:

```
cd argocd/install
./setup.sh
```

This will deploy the **OpenShift GitOps Operator**, apply some additional configuration to the default Argo CD instance, and apply a custom *ClusterRole and Binding* to allow Argo CD to deploy Gitea instances.

### Red Hat Advanced Cluster Management for Kubernetes

Coming soon!

## Individual Demo Config

### Demo: GitOps and Serverless CI/CD with OpenShift

Once you have completed the above common configuration (install OpenShift GitOps Operator or Advanced Cluster Management), do the following to setup the demo.

#### Using OpenShift GitOps

Bootstrap the demo config by running:

```
oc apply -k argocd/gitops-and-serverless-cicd/bootstrap
```

If you login to the OpenShift GitOps (Argo CD) UI, you will see a few different *Applications* appear.  These will install the following components:

* Gitea Operator
* OpenShift Pipelines Operator (Tekton)
* Gitea Instance (configured with a demo user, repo and webhook)

This could take a few minutes to complete, as the operators need to be installed before Gitea will begin installing.  Gitea itself takes a few minutes to complete installation and configuration.

Once these components have finished deploying, you can start the demo by [following the instructions in the README](https://github.com/pittar-demos/gitops-and-tekton-with-openshift).

#### Using Advanced Cluster Management for Kubernetes

Coming Soon!
