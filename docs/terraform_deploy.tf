terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Variables
variable "data_dir" {
  default = "/mnt/user/appdata"
}

resource "docker_network" "default" {
  name = "bridge"
}

# Jellyfin
resource "docker_container" "jellyfin" {
  name  = "jellyfin"
  image = docker_image.jellyfin.latest
  ports {
    internal = 8096
    external = 8096
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/jellyfin"
  }
  volumes {
    container_path = "/media"
    host_path      = "/mnt/user/media"
  }
  restart = "unless-stopped"
}

resource "docker_image" "jellyfin" {
  name = "jellyfin/jellyfin:latest"
}

# NZBHydra
resource "docker_container" "nzbhydra" {
  name  = "nzbhydra"
  image = docker_image.nzbhydra.latest
  ports {
    internal = 5075
    external = 5075
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/nzbhydra"
  }
  restart = "unless-stopped"
}

resource "docker_image" "nzbhydra" {
  name = "linuxserver/nzbhydra2"
}

# Pi-hole
resource "docker_container" "pihole" {
  name  = "pihole"
  image = docker_image.pihole.latest
  ports {
    internal = 53
    external = 53
    protocol = "tcp"
  }
  ports {
    internal = 53
    external = 53
    protocol = "udp"
  }
  ports {
    internal = 80
    external = 80
  }
  ports {
    internal = 443
    external = 443
  }
  env = [
    "TZ=America/Chicago",
    "WEBPASSWORD=changeme"
  ]
  volumes {
    container_path = "/etc/pihole"
    host_path      = "${var.data_dir}/pihole/etc-pihole"
  }
  volumes {
    container_path = "/etc/dnsmasq.d"
    host_path      = "${var.data_dir}/pihole/etc-dnsmasq.d"
  }
  restart = "unless-stopped"
  capabilities {
    add = ["NET_ADMIN"]
  }
}

resource "docker_image" "pihole" {
  name = "pihole/pihole:latest"
}

# Overseerr
resource "docker_container" "overseerr" {
  name  = "overseerr"
  image = docker_image.overseerr.latest
  ports {
    internal = 5055
    external = 5055
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/overseerr"
  }
  restart = "unless-stopped"
}

resource "docker_image" "overseerr" {
  name = "linuxserver/overseerr"
}

# Plex
resource "docker_container" "plex" {
  name  = "plex"
  image = docker_image.plex.latest
  network_mode = "host"
  env = [
    "PUID=99",
    "PGID=100"
  ]
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/plex"
  }
  volumes {
    container_path = "/media"
    host_path      = "/mnt/user/media"
  }
  restart = "unless-stopped"
}

resource "docker_image" "plex" {
  name = "linuxserver/plex"
}

# Radarr
resource "docker_container" "radarr" {
  name  = "radarr"
  image = docker_image.radarr.latest
  ports {
    internal = 7878
    external = 7878
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/radarr"
  }
  volumes {
    container_path = "/movies"
    host_path      = "/mnt/user/media/movies"
  }
  restart = "unless-stopped"
}

resource "docker_image" "radarr" {
  name = "linuxserver/radarr"
}

# Readarr
resource "docker_container" "readarr" {
  name  = "readarr"
  image = docker_image.readarr.latest
  ports {
    internal = 8787
    external = 8787
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/readarr"
  }
  volumes {
    container_path = "/books"
    host_path      = "/mnt/user/media/books"
  }
  restart = "unless-stopped"
}

resource "docker_image" "readarr" {
  name = "linuxserver/readarr"
}

# SABnzbd
resource "docker_container" "sabnzbd" {
  name  = "sabnzbd"
  image = docker_image.sabnzbd.latest
  ports {
    internal = 8080
    external = 8080
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/sabnzbd"
  }
  volumes {
    container_path = "/downloads"
    host_path      = "/mnt/user/downloads"
  }
  restart = "unless-stopped"
}

resource "docker_image" "sabnzbd" {
  name = "linuxserver/sabnzbd"
}

# Sonarr
resource "docker_container" "sonarr" {
  name  = "sonarr"
  image = docker_image.sonarr.latest
  ports {
    internal = 8989
    external = 8989
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/sonarr"
  }
  volumes {
    container_path = "/tv"
    host_path      = "/mnt/user/media/tv"
  }
  restart = "unless-stopped"
}

resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr"
}

# Heimdall
resource "docker_container" "heimdall" {
  name  = "heimdall"
  image = docker_image.heimdall.latest
  ports {
    internal = 80
    external = 80
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/heimdall"
  }
  restart = "unless-stopped"
}

resource "docker_image" "heimdall" {
  name = "linuxserver/heimdall"
}

# Homepage
resource "docker_container" "homepage" {
  name  = "homepage"
  image = docker_image.homepage.latest
  ports {
    internal = 3000
    external = 3000
  }
  volumes {
    container_path = "/app/config"
    host_path      = "${var.data_dir}/homepage"
  }
  restart = "unless-stopped"
}

resource "docker_image" "homepage" {
  name = "ghcr.io/gethomepage/homepage:latest"
}

# Jellyseerr
resource "docker_container" "jellyseerr" {
  name  = "jellyseerr"
  image = docker_image.jellyseerr.latest
  ports {
    internal = 5055
    external = 5056
  }
  volumes {
    container_path = "/app/config"
    host_path      = "${var.data_dir}/jellyseerr"
  }
  restart = "unless-stopped"
}

resource "docker_image" "jellyseerr" {
  name = "fallenbagel/jellyseerr:latest"
}

# Nginx Proxy Manager
resource "docker_container" "nginx_proxy_manager" {
  name  = "nginx-proxy-manager"
  image = docker_image.nginx_proxy_manager.latest
  ports {
    internal = 81
    external = 81
  }
  ports {
    internal = 80
    external = 80
  }
  ports {
    internal = 443
    external = 443
  }
  volumes {
    container_path = "/config"
    host_path      = "${var.data_dir}/nginx-proxy-manager"
  }
  restart = "unless-stopped"
}

resource "docker_image" "nginx_proxy_manager" {
  name = "jc21/nginx-proxy-manager:latest"
}

# Portainer CE
resource "docker_container" "portainer" {
  name  = "portainer"
  image = docker_image.portainer.latest
  ports {
    internal = 9000
    external = 9000
  }
  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
  }
  volumes {
    container_path = "/data"
    host_path      = "${var.data_dir}/portainer"
  }
  restart = "unless-stopped"
}

resource "docker_image" "portainer" {
  name = "portainer/portainer-ce"
}