# galera-arbiter

Multi-arch (amd64 + arm64) container image for `garbd`, the Galera
arbitrator daemon. A vote-only member of a Galera cluster: it holds no
data, just participates in quorum.

Built from the same `mariadb` base image and digest as the Galera nodes in
`homelab-core-dns`'s `roles/mariadb_galera` (self-hosted at
git.baruah.net/priyanku/homelab-core-dns, not public), so `garbd` and the
nodes' `libgalera_smm` track the same `galera-4` release.

Published to `ghcr.io/priyankub/galera-arbiter:latest` on every push to
`main` (`.github/workflows/deploy.yml`), built for both `linux/amd64` and
`linux/arm64` in one manifest so the same tag works on any consuming host
regardless of architecture.

## Usage

```
docker run --rm --network host --user mysql \
  ghcr.io/priyankub/galera-arbiter:latest \
  --group=<wsrep_cluster_name> \
  --address=gcomm://<node1-ip>:4567,<node2-ip>:4567
```

`--network host` so the address `garbd` advertises to the cluster's nodes
is this host's real LAN address, not a container-bridge IP they can't dial
back to.
