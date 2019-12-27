# docker-ansible
Docker image with Ansible, Azure and additional tools.

## Usage

Start with `docker run pietere/ansible` to show instructions on how to create aliases for CLI tool in the container.

Note: the current working directory is mounted as `$HOME` in the container.
Using `az` and `ansible` will result in `.azure/` and `.ansible/` directories being created in the working directory.


## Know issues

`Failed to authenticate with provided credentials` is caused by azure_rm `auth_source` `auto` detection being confused.
Fix: set your desired `auth-source` explicitly by adding `auth_source: cli` to `azure_rm_*` task.

TODO set `$ANSIBLE_AZURE_AUTH_SOURCE` inside container.
  edit alias to include -e ANSIBLE_AZURE_AUTH_SOURCE
  copy ANSIBLE_AZURE_AUTH_SOURCE
