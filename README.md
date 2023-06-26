# Infrastructure - LocalCloud

A lightweight docker application platform for single servers that gives you:

- Docker swarm
- Docker registry
- Portainer
- Traefik
- TLS with Letsencrypt (optional)

See [examples/nginx-app](./examples/nginx-app) for a real-world example.

## Installation

### System Requirements

You need a fresh install of Ubuntu 22.04. _This is the only supported OS version._

### DNS Setup

- Locally

```bash
sudo sh -c "echo '<vm_ip_here> traefik.localcloud.local portainer.localcloud.local registry.localcloud.local' >> /etc/hosts"
```

- In case to use TLS (Public access)

Create a wildcard `A` (ipv4) record to point `*.<public_domain.com>` to your server.

### Install

Run the following script to install:

```bash
curl -s https://raw.githubusercontent.com/rneiva/localcloud/main/pre-flight.sh | sudo -E bash
```

### Credits

- This project is a Fork from: [badsyntax/docker-box](https://github.com/badsyntax/docker-box)
- Edited by [rneiva](https://github.com/rneiva)