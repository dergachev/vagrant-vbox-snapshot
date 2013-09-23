vagrant-vbox-snapshot
==================================
Vagrant plugin that exposes the `VBoxManage snapshot` command.

## Install

Ensure you have Vagrant 1.1+ installed, then run:

    vagrant plugin install vagrant-vbox-snapshot

## Usage

The following commands are added by this plugin:

     vagrant snapshot take [vm-name] [NAME]            # take snapshot, labeled by NAME
     vagrant snapshot list [vm-name]                   # list snapshots
     vagrant snapshot back [vm-name]                   # restore last taken snapshot
     vagrant snapshot delete [vm-name] [NAME]          # delete specified snapshot
     vagrant snapshot go [vm-name] [NAME]              # restore specified snapshot

## Caveats

* Not compatible with Vagrant <1.1. If you need this, try [another solution](#other-solutions).

## Other solutions

This plugin is primarily a port of vagrant-snap to Vagrant 1.1.

* [vagrant-snap](https://github.com/t9md/vagrant-snap)
  - fork with Vagrant 1.0.4-1.0.7 compatibility: https://gist.github.com/tombh/5142237 [source](https://github.com/mitchellh/vagrant/issues/143#issuecomment-14781762)
* [sahara](https://github.com/jedi4ever/sahara)
  - fork exists with 1.1 functionality: https://github.com/ryuzee/sahara

## Development

To develop on this plugin, do the following:

```
# get the repo, and then make a feature branch (REPLACE WITH YOUR FORK)
git clone https://github.com/dergachev/vagrant-vbox-snapshot.git
cd vagrant-vbox-snapshot
git checkout -b MY-NEW-FEATURE

# installs the vagrant gem, which is a dev dependency
bundle install 

# hack on the plugin
vim lib/vagrant-vbox-snapshot.rb # or any other file

# test out your changes, in the context provided by the development vagrant gem, and the local Vagrantfile.
bundle exec vagrant snapshot ...

# commit, push, and do a pull-request
```

See [DEVNOTES.md](https://github.com/dergachev/vagrant-vbox-snapshot/blob/master/DEVNOTES.md)
for the notes I compiled while developing this plugin.
