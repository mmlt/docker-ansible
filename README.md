# docker-ansible
Docker image with Ansible, Azure and additional tools.

## Usage

Start with `docker run pietere/ansible` to show instructions on how to create aliases for CLI tool in the container.

Note that the working directory is mounted as `$HOME` in the container.
Using `az` and `ansible` will result in `.azure/` and `.ansible/` directories being created in the working directory.



