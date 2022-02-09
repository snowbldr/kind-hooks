FROM kindest/node:v1.20.7
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash -s
COPY hooks/* /hooks/
COPY runAfterReady.sh /runAfterReady.sh
RUN mv /usr/local/bin/entrypoint /usr/local/bin/kind-entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint