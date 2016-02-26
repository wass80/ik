# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "master" do |web|
    web.vm.provider :virtualbox do |vb|
      vb.name = "master"
    end
    web.vm.hostname = "master"
    web.vm.box = "ubuntu/trusty64"
    web.vm.network "public_network", bridge: "enp0s25", ip: "192.168.220.55"
    web.vm.network "private_network", ip: "192.168.33.10"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    config.vm.provision :itamae do |config|
      config.sudo = true
      config.recipes = ['./recipes/master.rb']
      config.json = "json/master01.json"
      config.log_level = "debug"
    end
  end
  config.vm.define "slave01" do |web|
    web.vm.provider :virtualbox do |vb|
      vb.name = "slave01"
    end
    web.vm.hostname = "slave01"
    web.vm.box = "ubuntu/trusty64"
    web.vm.network "public_network", bridge: "enp0s25", ip: "192.168.220.56"
    web.vm.network "private_network", ip: "192.168.33.11"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
    end

    config.vm.provision :itamae do |config|
      config.sudo = true
      config.recipes = ['./recipes/slave.rb']
      config.json = "json/slave01.json"
      config.log_level = "debug"
    end
  end
end
