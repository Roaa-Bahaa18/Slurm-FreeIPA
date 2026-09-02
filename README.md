# Slurm-FreeIPA
A fully automated **HPC (High-Performance Computing) test cluster** built with **Vagrant, VirtualBox, Rocky Linux 9, Ansible, FreeIPA, NFS, MUNGE, and Slurm**.

The project demonstrates how centralized identity management with FreeIPA can be integrated with Slurm to authenticate users and run distributed workloads on a compute node.

---
## 📌 Project Objectives

This project was created to implement the following HPC environment:

- Build a basic HPC test cluster
  - 1 Controller Node
  - 1 Compute Node
- Configure **Slurm** as the workload manager.
- Configure **FreeIPA** for centralized authentication and user management.
- Integrate FreeIPA authentication with the HPC nodes.
- Configure **MUNGE** for Slurm authentication.
- Configure **NFS** to provide a shared `/home` directory.
- Demonstrate user authentication and Slurm job submission.
- Demonstrate Slurm job monitoring and tracking.

---

## 🏗️ Architecture

```text
                         HPC TEST CLUSTER
                              │
              ┌───────────────┴───────────────┐
              │                               │
              ▼                               ▼
     ┌─────────────────┐             ┌─────────────────┐
     │   CONTROLLER    │             │    COMPUTE 1    │
     │                 │             │                 │
     │ Rocky Linux 9   │             │ Rocky Linux 9   │
     │ 192.168.56.10   │             │ 192.168.56.11   │
     │                 │             │                 │
     │ FreeIPA Server  │◄───────────►│ FreeIPA Client  │
     │ DNS             │             │ SSSD            │
     │ Kerberos        │             │                 │
     │ Slurmctld       │◄───────────►│ Slurmd          │
     │ MUNGE           │             │ MUNGE           │
     │ NFS Server      │────────────►│ NFS Client      │
     └─────────────────┘             └─────────────────┘
```

### Network

| Host | Hostname | IP Address |
|---|---|---|
| Controller | `controller.slurm.test` | `192.168.56.10` |
| Compute Node | `compute1.slurm.test` | `192.168.56.11` |

Domain:

```text
slurm.test
```

Kerberos realm:

```text
SLURM.TEST
```

---
## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Rocky Linux 9 | Operating system |
| Vagrant | VM lifecycle and provisioning |
| VirtualBox | Virtualization |
| Ansible | Configuration automation |
| FreeIPA | Centralized identity management |
| Kerberos | Authentication |
| SSSD | Identity/authentication client |
| DNS | Host/service resolution |
| Slurm | HPC workload management |
| MUNGE | Slurm authentication |
| NFS | Shared `/home` directory |

---
## 📂 Project Structure

```text
hpc-rocky9-freeipa-slurm/
│
├── Vagrantfile
├── README.md
│
├── provision/
│   ├── controller-bootstrap.sh
│   └── compute-bootstrap.sh
│
├── ansible/
│   ├── inventory/
│   │   └── hosts.ini
│   │
│   ├── group_vars/
│   │   └── all.yml
│   │
│   ├── playbooks/
│   │   ├── controller.yml
│   │   └── compute.yml
│   │
│   └── templates/
│       └── slurm.conf.j2
│
└── scripts/
    └── verify-cluster.sh
```

---
# ⚙️ Prerequisites

Before starting, install:

### 1. VirtualBox

Install Oracle VirtualBox and make sure virtualization is enabled in the BIOS/UEFI.

### 2. Vagrant

Install Vagrant and verify:

```bash
vagrant --version
```

### 3. Git

Recommended for version control:

```bash
git --version
```

### 4. Hardware Requirements

Recommended minimum:

- 8 GB RAM
- 2+ CPU cores
- 20+ GB available disk space

The controller is configured with:

```text
4 GB RAM
2 CPUs
```

The compute node is configured with:

```text
2 GB RAM
2 CPUs
```

---
# 🚀 Deployment

## 1. Clone the repository

```bash
git clone <repository-url>
cd hpc-rocky9-freeipa-slurm
```

---

## 2. Start the cluster

Run:

```bash
vagrant up
```

Vagrant will create:

```text
controller
compute1
```

The controller is configured first.

The controller performs:

1. Rocky Linux configuration
2. Package installation
3. FreeIPA server installation
4. Integrated DNS configuration
5. Kerberos configuration
6. NFS configuration
7. MUNGE configuration
8. Slurm controller configuration

The compute node is then configured as:

1. FreeIPA client
2. SSSD client
3. NFS client
4. MUNGE client
5. Slurm compute node

---

## 📚 Learning Outcomes

This project provides practical experience with:

- Linux system administration
- Virtualization
- Vagrant
- Ansible automation
- DNS
- Kerberos
- LDAP/FreeIPA
- SSSD
- PAM and Linux authentication
- NFS
- MUNGE
- Slurm
- HPC cluster architecture
- Automated infrastructure deployment
- Job scheduling and monitoring

---
