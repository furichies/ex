su - vagrant
ansible-playbook /vagrant/docker-playbook.yaml
ansible all -a "usermod -aG docker vagrant" --become
ansible all -a "docker compose -f /vagrant/docker-compose.yaml up -d"


