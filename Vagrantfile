Vagrant.configure("2") do |config|
  config.vm.box = "generic/rocky9"
  config.vm.synced_folder ".", "/vagrant"

  config.vm.define "controller" do |c|
    c.vm.hostname = "controller.slurm.test"
    c.vm.network "private_network", ip: "192.168.56.10"
    c.vm.provider "virtualbox" do |vb|
      vb.name = "hpc-controller"
      vb.memory = 4096
      vb.cpus = 2
    end
    c.vm.provision "shell", path: "provision/controller-bootstrap.sh"
  end

  config.vm.define "compute1" do |c|
    c.vm.hostname = "compute1.slurm.test"
    c.vm.network "private_network", ip: "192.168.56.11"
    c.vm.provider "virtualbox" do |vb|
      vb.name = "hpc-compute1"
      vb.memory = 2048
      vb.cpus = 2
    end
    c.vm.provision "shell", path: "provision/compute-bootstrap.sh"
  end
end
