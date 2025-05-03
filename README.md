# 🏠 Home Lab 2025: Secure, Scalable Virtual Infrastructure

## Goal / Problem Statement
I set out to build a home lab that mirrors enterprise-level cloud and network environments, providing a hands-on platform to experiment with **virtualization, containerization, automation, and security** while managing real-world complexity at home.

My goal was to create a secure, scalable, and segmented infrastructure where I could:
- Test cloud deployments and DevOps pipelines
- Explore identity and access management
- Implement Zero Trust principles
- Automate deployments and network operations

## Technologies Used
- **Virtualization:** Proxmox, Unraid
- **Containerization:** Docker, Ansible
- **Networking:** Unifi, VLANs, Pi-hole
- **Storage:** Unraid NAS, Plex, Sonarr, Radarr
- **Security:** Pi-hole DNS filtering, Unifi firewall rules
- **Home Automation:** Home Assistant, wall-mounted tablets

## Architecture Overview
✅ **Virtualization Layer:** Started with Proxmox → migrated to Unraid for native Docker support and easier container management.  
✅ **Containerization & Automation:** Deployed applications using Docker; automated provisioning and updates using Ansible playbooks.  
✅ **Network Segmentation:** Created VLANs across Unifi switches to separate IoT, work, personal, and guest traffic for security and QoS.  
✅ **Security:** Installed redundant Pi-hole servers for DNS filtering and ad-blocking; configured firewall rules to limit east-west and outbound traffic.  
✅ **Storage & Media:** Built an Unraid-based NAS serving Plex, with automated downloads via Sonarr and Radarr for media organization.  
✅ **Home Automation:** Configured Home Assistant; deployed wall-mounted tablets using Fully Kiosk Browser as centralized smart home control panels.

![Network Diagram](docs/network-diagram.png)  

## Process
1. **Virtualization Platform** – Deployed Proxmox; migrated to Unraid for Docker container support and increased flexibility.
2. **Containerization & Automation** – Automated application deployments with Docker and Ansible to minimize manual maintenance.
3. **Network Security** – Installed redundant Pi-hole servers; configured Unifi firewall rules for DNS filtering and network protection.
4. **Network Segmentation** – Designed VLANs to isolate IoT, personal, work, and guest traffic to reduce risk and optimize performance.
5. **Storage & Media Management** – Built Unraid NAS to store backups and media; integrated Plex, Sonarr, and Radarr for automated library management.
6. **Home Automation** – Integrated Home Assistant; repurposed tablets into control hubs for centralized smart device management.

## Key Outcomes
✅ Built a **fully segmented, secure network** supporting enterprise-level security practices at home.  
✅ Automated **90% of deployment and updates** across apps and containers using Ansible.  
✅ Created a **centralized smart home platform** combining media management, automation, and secure networking.  
✅ Gained hands-on experience in **IAM principles, firewall management, Zero Trust segmentation, and infrastructure as code.**

## Screenshots / Artifacts
![Central Dashboard](docs/central-dashboard.png)
![Home Assistant UI](docs/home-assistant-ui.png)
![Unifi VLAN Config](docs/unifi-vlan.png)
![Home Assistant UI](docs/home-assistant-ui.png)

## Generalized Deployment 
## 🚀 Ansible Deployment Playbook

This repository includes an Ansible playbook to automatically deploy the core containers in my Homelab 2025 setup. I've included both Jellyfin and Plex.

- Jellyfin
- NZBHydra
- Pi-hole
- Overseerr
- Plex
- Radarr
- Readarr
- SABnzbd
- Sonarr
- Heimdall
- Homepage
- Jellyseerr
- Nginx Proxy Manager
- Portainer CE

The playbook ensures all containers are deployed with recommended settings, using Docker on Unraid.

👉 **[View the Ansible Playbook](https://github.com/sgersz/homelab-2025/blob/main/docs/ansible_deploy.yml)**

## 🚀 Terraform Deployment Script

👉 **[View the Terraform Deployment Script](https://github.com/sgersz/homelab-2025/blob/main/docs/terraform_deploy.tf)**


## Reflection / Learnings
This project strengthened my expertise in **virtualization, automation, network security, and cloud infrastructure management** by bridging enterprise concepts into a home environment. It challenged me to balance **security, performance, and user experience** while managing complex, interconnected systems independently.

## Key Skills Demonstrated
- Docker, Unraid, Ansible
- Network segmentation, VLANs, firewall config
- Pi-hole, Unifi
- Home Assistant, IoT security
- Automation, Infrastructure as Code
