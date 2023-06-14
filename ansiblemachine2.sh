export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i /home/vagrant/hosts /vagrant/docker-playbook.yaml
ansible -i /home/vagrant/hosts all -a "usermod -aG docker vagrant" --become
ansible -i /home/vagrant/hosts all -a "docker compose -f /vagrant/docker-compose.yaml up -d" --become


