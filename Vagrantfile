# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'bento/centos-7.3'

  config.vm.define :server do |host|
    hostname = 'server'
    ip_address = '192.168.33.10'

    host.vm.hostname = hostname
    host.vm.network 'private_network', ip: ip_address
  end
end
