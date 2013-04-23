vagrant-vbox-snapshot
==================================
Vagrant plugin that exposes the `VBoxManage snapshot` command.

## Install

Ensure you have Vagrant 1.1+ installed, then run:

    vagrant plugin install vagrant-vbox-snapshot

## Usage

The following commands are added by this plugin:

     vagrant snapshot take [NAME]            # take snapshot, labeled by NAME
     vagrant snapshot list                   # list snapshots
     vagrant snapshot back                   # restore last taken snapshot
     vagrant snapshot delete [NAME]          # delete specified snapshot
     vagrant snapshot go [NAME]              # restore specified snapshot

## Caveats

* Not compatible with Vagrant <1.1. If you need this, try [another solution](#other-solutions).
* Does not support multiple VMs. Pull requests encouraged.
* Only minimally tested.

## Other solutions

This plugin is primarily a port of vagrant-snap to Vagrant 1.1.

* [vagrant-snap](https://github.com/t9md/vagrant-snap)
  - fork with Vagrant 1.0.4-1.0.7 compatibility: https://gist.github.com/tombh/5142237 [source](https://github.com/mitchellh/vagrant/issues/143#issuecomment-14781762)
* [sahara](https://github.com/jedi4ever/sahara)
  - fork exists with 1.1 functionality: https://github.com/ryuzee/sahara

## Development

See [DEVNOTES.md](https://github.com/dergachev/vagrant-vbox-snapshot/blob/master/DEVNOTES.md)
for the notes I compiled while developing this plugin.
