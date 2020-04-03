echo "Starting Kubernetes..."
minikube start
while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done

echo "Kubernetes Started"

curl -o /tmp/pachctl.deb -L https://github.com/pachyderm/pachyderm/releases/download/v1.10.0/pachctl_1.10.0_amd64.deb && sudo dpkg -i /tmp/pachctl.deb

pachctl deploy local
