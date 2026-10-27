# Same base image and digest as the Galera nodes in the author's private
# DNS cluster config, so garbd and the nodes' libgalera_smm always come
# from the same galera-4 release. Renovate bumps both Dockerfiles' digests
# independently; if they drift, garbd and the nodes can still speak to each
# other (the wire protocol is versioned, not tied to the packaging), but
# keeping them matched is the point.
FROM mariadb:11.8.9@sha256:c4124d1afa875e47f2892edf26b482fa54f796e2f342d3717a04ca091a22a9bd
RUN apt-get update && apt-get install -y --no-install-recommends galera-arbitrator-4 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["garbd"]
