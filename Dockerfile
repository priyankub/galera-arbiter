# Same base image and digest as the Galera nodes in the author's private
# DNS cluster config, so garbd and the nodes' libgalera_smm always come
# from the same galera-4 release. Renovate bumps both Dockerfiles' digests
# independently; if they drift, garbd and the nodes can still speak to each
# other (the wire protocol is versioned, not tied to the packaging), but
# keeping them matched is the point.
FROM mariadb:11.8.9@sha256:e1d5495f445654134f226f55a41ce0da227116f6f27f283101f405c794d841fc
RUN apt-get update && apt-get install -y --no-install-recommends galera-arbitrator-4 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["garbd"]
