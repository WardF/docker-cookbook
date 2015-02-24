# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  # Enable x11 forwarding.
  config.ssh.forward_x11 = "true"

  # Configure default virtualbox environment.
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  config.vm.define "u64", primary: true do |v|
    v.vm.provision :shell, :path => "bootstrap_vm.sh"
    v.vm.hostname = "unicorn64"
    v.vm.box = "unicorn64"
  end

end
