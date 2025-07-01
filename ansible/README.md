# Requirements

Install ansible

```sh
pip install ansible
```

# Config file
`ansible.cfg` used by any ansible binary that is called from this directory.

# Inventory
`inventory.ini` defines host groups and variables shared among host groups.

# Playbooks
Playbooks are located in the root directory.

These are the current playbooks:
- `playbook_bootstrap`: PB to provision a new Ubuntu server
- `debug`: PB to use for test purposes

# Roles
Some roles have naming conventions in this ansible repo.

## Prefixes
Some roles have certain prefixes that mean specific things:

`setup_`: This is a meta role that only includes other smaller roles.

It should help to declutter big playbooks.

`config_`: This role configures certain packages or software.

It probably has certain templates or files that are copied to the server
during execution. Chances are high that these roles use variables that
needs to be set for it to properly work.

`No Prefix`: This is a 'default' role.

It normally can run without any requirement or special variables.
Should be self-contained.

# RUN Playbooks

## General

```sh
ansible-playbook [playbook_name]
```

Limit to one or more hosts:

```sh
ansible-playbook [playbook_name] --limit=spendings.primus-fatum.de --limit=main.factorio-servers.de
```

## Boostrap new server
```sh
echo "new_server.primus-fatum.de ansible_user=root" >> inventory.ini
ansible-playbook playbook_bootstrap.yml --limit=new_server.primus-fatum.de --private-key ~/.ssh/hetzner_cloud
```
