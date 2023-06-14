apt update
apt install -y ansible git
git clone http://github.com/richifor/ventabus.git
cat << EOF > /etc/ansible/hosts
[container]
dockermachine ansible_host=192.168.33.101
EOF
cat << EOF > /etc/ansible/ansible.cfg
[defaults]
host_key_checking = False
EOF
cat << EOF > /vagrant/docker-playbook.yaml
---
- name: Instalar docker
  hosts: all
  become: true
  tasks:
    - name: dependencias
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - apt-transport-https
        - ca-certificates
        - curl
        - gnupg
        - lsb-release

    - name: la clave de gpg
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Repositorio
      apt_repository:
        repo: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ ansible_distribution_release }} stable
        state: present

    - name: instalar docker
      apt:
        name: "{{ item }}"
        state: present
      loop: 
        - docker-ce
        - docker-ce-cli
        - containerd.io
        - docker-buildx-plugin
        - docker-compose-plugin

    - name: bootear servicio
      service:
        name: docker
        state: started    
EOF


