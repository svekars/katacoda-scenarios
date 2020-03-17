## Deploy Pachyderm

Pachyderm can run on any Kubernetes platform — both in the cloud
or on premises.

In this tutorial, we will deploy Pachyderm on a `minikube` cluster.
`minikube` is already preinstalled in this environment.

You can check that `minikube` is running by executing the following
command:

`minikube version`{{execute}}

Before you can deploy Pachyderm, you need to install the Pachyderm
client which you will later use to deploy Pachyderm.

To deploy `pachctl`, run:

`curl -o /tmp/pachctl.deb -L https://github.com/pachyderm/pachyderm/releases/download/v1.10.0/pachctl_1.10.0_amd64.deb && sudo dpkg -i /tmp/pachctl.deb`{{execute}}

Verify that `pachctl` has been installed by running the following command:

`pachctl version --client-only`{{execute}}

After `pachctl` is installed, deploy Pachyderm by running:

`pachctl deploy local`{{execute}}

Now, run `pachctl version` again to verify that both `pachctl`
and `pachd` are installed.

`pachctl version`{{execute}}
