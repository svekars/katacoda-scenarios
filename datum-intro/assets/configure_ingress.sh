until timeout 1s ./check_ready.sh app=pachd; do sleep 5; done

kubectl apply -f /root/roles.yaml
kubectl apply -f /root/traefik-daemonset.yaml
sed s/host01/[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/g < /root/traefik-ingress-minikube.yaml | kubectl apply -f -
