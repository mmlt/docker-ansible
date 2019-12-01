#! /bin/bash

#TODO fix enter-ansible-azure-container warnings: (hint: don't use su -c)
#  bash: cannot set terminal process group (25): Inappropriate ioctl for device
#  bash: no job control in this shell


if [ -n "$XXNAME" ]; then
  /createuser.sh $XXNAME $XXUID $XXGID "PATH"
  su - $XXNAME -c '"$0" "$@"' -- "$@"
else
  if [ $# = 1 ]; then imagename=$1; else imagename="pietere/ansible"; fi

  echo "# This container provides Ansible, Azure and additionals tools. "
  echo "#"
  echo "# Source this output to add aliases for frequently used commands;"
  echo "#	  . <(docker run $imagename $imagename) OR (docker run $imagename $imagename) >> ~/.bash_aliases"
  echo "# then use aliases like this;"
  echo "#   az login"
  echo "#   az --version"
  echo "#   ansible --version"
  echo "#   ansible-doc --list"
  echo "#   ansible-playbook xyz.yml"
  echo "#   enter-ansible-azure-container"
  echo "#"
  echo "#"
  echo "# Note: the CWD is mounted as ~ in the container."
  echo 
  echo "alias ansible=\"docker run -ti --rm -e XXNAME=\$(id -un) -e XXUID=\$(id -u) -e XXGID=\$(id -g) -v \$(pwd):/home/\$(id -un) $imagename ansible \""
  echo "alias ansible-doc=\"docker run -ti --rm -e XXNAME=\$(id -un) -e XXUID=\$(id -u) -e XXGID=\$(id -g) -v \$(pwd):/home/\$(id -un) $imagename ansible-doc \""
  echo "alias ansible-playbook=\"docker run -ti --rm -e XXNAME=\$(id -un) -e XXUID=\$(id -u) -e XXGID=\$(id -g) -v \$(pwd):/home/\$(id -un) $imagename ansible-playbook \""
  echo "alias az=\"docker run -ti --rm -e XXNAME=\$(id -un) -e XXUID=\$(id -u) -e XXGID=\$(id -g) -v \$(pwd):/home/\$(id -un) $imagename az \""
  echo "alias enter-ansible-azure-container=\"docker run -ti --rm -e XXNAME=\$(id -un) -e XXUID=\$(id -u) -e XXGID=\$(id -g) -v \$(pwd):/home/\$(id -un) $imagename \""
fi
