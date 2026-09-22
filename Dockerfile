# Same base image and digest as the Galera nodes in the author's private
# DNS cluster config, so garbd and the nodes' libgalera_smm always come
# from the same galera-4 release. Renovate bumps both Dockerfiles' digests
# independently; if they drift, garbd and the nodes can still speak to each
# other (the wire protocol is versioned, not tied to the packaging), but
# keeping them matched is the point.
FROM mariadb:13.0.2@sha256:d4fdec0510ad498e4f3127da30a99df3745bd6d5e611ae6ac5f76403d9284a8d
RUN apt-get update && apt-get install -y --no-install-recommends galera-arbitrator-4 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["garbd"]
