# XRP Ledger Ripple Kubernetes Setup

## Start minikube cluster:

-   Create cluster: `minikube start --cpus 2 --memory 4g --driver virtualbox`
-   Get external IP: `minikube ip`

## Steps to run:

-   Change docker env: `eval $(minikube docker-env)`
-   Build Image: `docker build -t rippled .`
-   Apply Config: `kubectl apply -f ripple-setup.yaml`
-   Add external IP: `kubectl patch svc ripple-service -p '{"spec": {"type": "LoadBalancer", "externalIPs": ["<external-ip>"]}}'`

### Access server on `external-ip`.
