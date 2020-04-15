Pachyderm can run on any Kubernetes platform — both in the cloud
or on premises.

In this tutorial, we will deploy Pachyderm in a `minikube` cluster.
`minikube` is preinstalled and running on this machine.
Verify `minikube` status by running:

`minikube status`{{execute}}

Before you can deploy Pachyderm, you need to install the Pachyderm
client, `pachctl`, which you will later use to deploy and manage
Pachyderm.

To deploy `pachctl`, run:

`curl -o /tmp/pachctl.deb -L https://github.com/pachyderm/pachyderm/releases/download/v1.10.0/pachctl_1.10.0_amd64.deb && sudo dpkg -i /tmp/pachctl.deb`{{execute}}

Verify that `pachctl` has been installed by running the following command:

`pachctl version --client-only`{{execute}}

After `pachctl` is installed, deploy Pachyderm by running:

`pachctl deploy local`{{execute}}

Monitor container creation by running the following `watch` script:

`watch -n 5 kubectl get pods`{{execute}}

When all pods are running, run `CTRL + C`.

Now, run `pachctl version` again to verify that both `pachctl`
and `pachd` are installed.

`pachctl version`{{execute}}
