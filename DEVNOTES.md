# Developer notes for vagrant-vbox-snapshot

## Forking and hacking on vagrant-vbox-snapshot

```
# fork vagrant-vbox-snapshot on github.com, and clone locally
cd ~/code # or wherever you like to put coding projects
git clone git@github.com/USERNAME/vagrant-vbox-snapshot.git
cd vagrant-vbox-snapshot

# create a new branch for your work
git checkout -b FEATURE_NAME

bundle install # not 100% sure this is necessary
# hack away...
# then test, possibly modifying Vagrantfile to suit scenario
vagrant up 
vagrant snapshot take TEST1  # and so on...

# then commit, push, and create pull request
```

## Reviewing a pull request

```
git clone https://github.com/dergachev/vagrant-vbox-snapshot.git
cd vagrant-vbox-snapshot
# consider branching if you aren't sure about merging it (not the case here, of course!)
# git checkout dubious-pull-request
git pull https://github.com/fgrehm/vagrant-vbox-snapshot multi-vm-environments-support
# test, fix stuff, etc
git push -u origin master
```

## Pushing out a new release of the gem

Do a local build:

```
vim lib/vagrant-vbox-snapshot/version.rb +/VERSION # increment version counter, eg to 0.0.3
gem build vagrant-vbox-snapshot.gemspec # creates vagrant-vbox-snapshot-0.0.3.gem  
```

Test the local build:

```
# test the gem locally, in a random vagrant project
cd ~/code/screengif
vagrant plugin uninstall vagrant-vbox-snapshot
vagrant plugin install ~/code/vagrant-vbox-snapshot/vagrant-vbox-snapshot-VERSION.gem # replace VERSION with 0.0.3
vagrant plugin list | grep snapshot   # ensure that correct version is installed
vagrant snapshot list -h   # quick sanity check
vagrant plugin uninstall vagrant-vbox-snapshot   # cleanup
```

Now commit and tag:


```
cd ~/code/vagrant-vbox-snapshot

vim CHANGELOG.txt        # update CHANGELOG
# git commit everything

gem push vagrant-vbox-snapshot-0.0.3.gem
git tag vN.N.N     # eg v0.0.3
git push --tags
```

Test installing from rubygems

```
cd ~/code/screengif
vagrant plugin install vagrant-vbox-snapshot
```


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
