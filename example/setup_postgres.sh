#!/usr/bin/env bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm template --set postgresqlPassword=password,postgresqlDatabase=kuberneats,image.tag=13-debian-10 bitnami/postgresql | kubectl apply -f -