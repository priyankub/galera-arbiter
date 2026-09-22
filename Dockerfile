# Same base image and digest as homelab-core-dns's Galera nodes
# (roles/mariadb_galera/files/Dockerfile.galera), so garbd and the nodes'
# libgalera_smm always come from the same galera-4 release. Renovate bumps
# both Dockerfiles' digests independently; if they drift, garbd and the
# nodes can still speak to each other (the wire protocol is versioned, not
# tied to the packaging), but keeping them matched is the point.
FROM mariadb:11.8.9@sha256:79d59758afc91b89b120b0a8904d637f5a3b3e1c4900f29b740d6d46c72fef68
RUN apt-get update && apt-get install -y --no-install-recommends galera-arbitrator-4 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["garbd"]
