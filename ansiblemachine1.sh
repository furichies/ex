apt update
apt install -y ansible git
git clone http://github.com/richifor/examen.git
cat << EOF > /home/vagrant/hosts
[container]
dockermachine ansible_host=192.168.33.101 ansible_user=vagrant ansible_ssh_private_key_file=/vagrant/clave
EOF
cat << EOF > /home/vagrant/.ansible.cfg
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

echo -e "/vagrant/clave\n\n"|ssh-keygen -t rsa -b 4096
 if [ $? = "0" ]
 then 
	echo -e "entendemos que se ha creado un par de claves"
	sleep 1
fi
chown vagrant:vagrant /vagrant/clave
