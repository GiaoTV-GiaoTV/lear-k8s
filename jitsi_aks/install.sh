kubectl apply -f configmap.yaml -f jibri-service.yaml -f jicofo-service.yaml -f jvb-service.yaml -f prosody-service.yaml -f web-ingress.yaml -f web-service.yaml
kubectl apply -f prosody-deployment.yaml
sleep 30
kubectl apply -f jicofo-deployment.yaml -f jvb-deployment.yaml -f web-deployment.yaml -f jibri-deployment.yaml