#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'lib/vagrant-vbox-snapshot.rb'

Vagrant.configure("2") do |config|

  TEST_MULTI_VM = false
  TEST_SHARED_FOLDERS = false

  if TEST_MULTI_VM
    config.vm.define :web do |web|
      web.vm.box = "precise64"
    end
    config.vm.define :db do |web|
      web.vm.box = "precise64"
    end
  else
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  end

  if TEST_SHARED_FOLDERS
    config.vm.synced_folder "/tmp", "/tmp/host-tmp"
    config.vm.synced_folder "/tmp", "/tmp/host-tmp2"
  end
end
