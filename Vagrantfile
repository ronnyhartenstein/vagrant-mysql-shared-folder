# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 1024
  end

  config.vm.network :private_network, ip: "33.33.33.11"

  config.vm.network :forwarded_port, guest: 22, host: 3322, id: "ssh"
  config.vm.network :forwarded_port, guest: 3306, host: 3306

  config.vm.synced_folder "/Volumes/Daten/mysql", "/var/lib/mysql/vagrant", id: "mysql",
    owner: 108, group: 113,  # owner: "mysql", group: "mysql",
    mount_options: ["dmode=775,fmode=664"]

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
    puppet.options = "--verbose"
  end

end
