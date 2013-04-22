vagrant-vbox-snapshot
==================================
Vagrant plugin that exposes the `VBoxManage snapshot` command.

## Install

Ensure you have Vagrant 1.1+ installed, then run:

    vagrant plugin install vagrant-vbox-snapshot

## Usage

The following commands are added by this plugin:

     vagrant snap back                   # back to current snapshot
     vagrant snap delete SNAP_NAME       # delete snapshot
     vagrant snap go SNAP_NAME           # go to specified snapshot
     vagrant snap help [COMMAND]         # Describe subcommands or one specific subcommand
     vagrant snap list                   # list snapshot
     vagrant snap take [NAME]            # take snapshot

## Other solutions

There have been a number of similar plugins, but none worked for Vagrant 1.1:

* [vagrant-snap](https://github.com/t9md/vagrant-snap)
  - originally published as a gist: https://gist.github.com/t9md/1008031
  - fork of above gist, with Vagrant 1.0.6 compatibility: https://gist.github.com/tombh/5142237 
    - [source](https://github.com/mitchellh/vagrant/issues/143#issuecomment-14781762)
    - primary inspiration for vagrant-vbox-snapshot
* [sahara](https://github.com/jedi4ever/sahara)
  - fork exists with 1.1 functionality: https://github.com/ryuzee/sahara

## Development

See [DEVNOTES.md](https://github.com/dergachev/vagrant-vbox-snapshot/blob/master/DEVNOTES.md)
for the notes I compiled while developing this plugin.
