FROM kindest/node:v1.20.7
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash -s
COPY hooks/* /hooks/
RUN chmod -R 755 /hooks
COPY --chmod=0755 runAfterReady.sh /runAfterReady.sh
RUN mv /usr/local/bin/entrypoint /usr/local/bin/kind-entrypoint
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint