# kind-hooks

This image provides hooks into the kind node startup process allowing scripts to be run at various stages

## How to use this image
To run a script at a certain stage overwrite the associated /hooks/*.sh file.

helm is installed and ready to be used for installing resources in the after_ready.sh script.

The following hooks are supported:
- before_start.sh: Runs before anything else when the container starts up 
- after_ready.sh:  Runs after the kubernetes cluster is ready for installing resources

### Postgres example
In this example, we'll create a new docker image with our setup script pre-loaded.

We'll create the following directory structure

    - kind-postgres
        - Dockerfile
        - setup_postgres.sh

These files are available in the example directory of this repo.

setup_postgres.sh
    
    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm template --set postgresqlPassword=password,postgresqlDatabase=kuberneats,image.tag=13-debian-10 bitnami/postgresql | kubectl apply -f -

Dockerfile

    FROM snowbldr/kind-hooks
    COPY setup_postgres.sh /hooks/after_ready.sh

Build the docker image

    docker build -t kind-postgres:latest .

Create the cluster

    kind create cluster --image kind-postgres:latest --name kind-postgres

After the kube-system pods are ready, postgres will be installed.