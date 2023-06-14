Vagrant.configure("2") do |config|
   config.vm.define "manager" do |manager|
    manager.vm.box = "ubuntu/jam"
    manager.vm.hostname = "manager"
    manager.vm.network "private_network", ip: "192.168.33.100"
    manager.vm.provider "virtualbox" do |v|
      v.name = "ansiblemachine"
      v.memory = 2048
      v.cpus = 2
    end
    manager.vm.provision "shell", path: "ansiblemachine1.sh"
  end
   config.vm.define "container" do |container|
    container.vm.box = "ubuntu/jam"
    container.vm.hostname = "container"
    container.vm.network "private_network", ip: "192.168.33.101"
    container.vm.provider "virtualbox" do |v|
      v.name = "dockermachine"
      v.memory = 2048
      v.cpus = 2
    end
    container.vm.provision "shell", path: "dockermachine1.sh"

  end  
end
