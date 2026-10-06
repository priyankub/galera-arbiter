# Same base image and digest as the Galera nodes in the author's private
# DNS cluster config, so garbd and the nodes' libgalera_smm always come
# from the same galera-4 release. Renovate bumps both Dockerfiles' digests
# independently; if they drift, garbd and the nodes can still speak to each
# other (the wire protocol is versioned, not tied to the packaging), but
# keeping them matched is the point.
FROM mariadb:11.8.9@sha256:6422478cb8e159f080fb1d8ccf65101e26fe51385787fde7d16c3b165a331f15
RUN apt-get update && apt-get install -y --no-install-recommends galera-arbitrator-4 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["garbd"]
