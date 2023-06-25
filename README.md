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

- In case to use TLS

Create a wildcard `A` (ipv4) record to point `*.docker.mydomain.com` to your server.

### Install

Run the following script to install:

```bash
curl -s https://raw.githubusercontent.com/rneiva/localcloud/main/install.sh | sudo -E bash
```

### Credits

- This project is a Fork from: [badsyntax/docker-box](https://github.com/badsyntax/docker-box)
