FROM ubuntu:18.04

ARG ANSIBLE_VERSION=2.9.1

# Ansible
RUN apt-get update \
 && apt-get install -y software-properties-common python-pip curl \
 && apt-add-repository -y --update ppa:ansible/ansible \
 && apt-get install -y ansible \
 && rm -rf /var/lib/apt/lists/* \
 && pip install ansible[azure]==${ANSIBLE_VERSION}

# Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Additional Python packages
RUN pip install netaddr

# Create user
COPY ["./createuser.sh", "./run.sh", "/"]
ENTRYPOINT ["/run.sh"]
CMD bash