su - vagrant
ansible-playbook -i /vagrant/clave /vagrant/docker-playbook.yaml
ansible all -a "usermod -aG docker vagrant" --become
ansible all -a "docker compose -f /vagrant/docker-compose.yaml up -d"


