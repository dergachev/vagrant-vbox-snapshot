## Updating to vagrant 1.1 plugin API

Resources:

* http://docs.vagrantup.com/v2/plugins/development-basics.html
* http://railscasts.com/episodes/245-new-gem-with-bundler?view=asciicast (Gem tutorial)

Example code:

* https://gist.github.com/dergachev/5367385#vagrant-snapshot.rb
* https://github.com/mitchellh/vagrant/issues/143#add-vagrant-snapshot-option
* https://github.com/fgrehm/vagrant-notify
* https://github.com/RiotGames/berkshelf-vagrant
* https://github.com/mitchellh/vagrant-aws/blob/master/lib/vagrant-aws/plugin.rb
* sahara 1.1 update commit: https://github.com/ryuzee/sahara/commit/b80a621a9200bb4935c782bd4e538886c42b8643
* vagrant-snap: https://github.com/t9md/vagrant-snap/blob/master/lib/vagrant_snap.rb
* https://github.com/dotless-de/vagrant-plugins-env/blob/master/.gitmodules

Vagrant source code:

* https://github.com/mitchellh/vagrant/blob/master/lib/vagrant/registry.rb
* https://github.com/mitchellh/vagrant/tree/master/plugins/provisioners/shell
* https://github.com/mitchellh/vagrant/blob/master/lib/vagrant/plugin/v2/provisioner.rb
* https://github.com/mitchellh/vagrant/blob/master/lib/vagrant/plugin/v2/command.rb

## other ideas related to snapshots

* http://code.chrisroberts.org/blog/2012/05/09/cooking-up-partial-run-lists-with-chef/
