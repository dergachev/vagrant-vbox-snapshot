## [0.0.9](https://github.com/dergachev/vagrant-vbox-snapshot/compare/v0.0.8...v0.0.9) (July 3, 2015)

IMPROVEMENTS:

- vagrant snapshot back and go no longer fails if the VM is in "saved" state [#33](https://github.com/dergachev/vagrant-vbox-snapshot/pull/33)

## [0.0.8](https://github.com/dergachev/vagrant-vbox-snapshot/compare/v0.0.7...v0.0.8) (October 10, 2014)

IMPROVEMENTS:

  - make 'vagrant' dev dependency in Gemfile [#29](https://github.com/dergachev/vagrant-vbox-snapshot/issues/29)

## [0.0.7](https://github.com/dergachev/vagrant-vbox-snapshot/compare/v0.0.6...v0.0.7) (October 7, 2014)

IMPROVEMENTS:

  - don't crash if vm is poweroff [#28](https://github.com/dergachev/vagrant-vbox-snapshot/issues/28)

## [0.0.6](https://github.com/dergachev/vagrant-vbox-snapshot/compare/v0.0.5...v0.0.6) (October 6, 2014)

IMPROVEMENTS:

  - suppress 'snapshot list' error when no snapshots [#17](https://github.com/dergachev/vagrant-vbox-snapshot/issues/17)

## [0.0.5](https://github.com/dergachev/vagrant-vbox-snapshot/compare/v0.0.4...v0.0.5) (June 7, 2014)

IMPROVEMENTS:

  - Add command synopsys [#23](https://github.com/dergachev/vagrant-vbox-snapshot/issues/23)

## [0.0.4](https://github.com/dergachev/vagrant-vbox-snapshot/compare/v0.0.3...v0.0.4) (Sep 23, 2013)

BACKWARDS INCOMPATIBILITIES:

  - none

FEATURES:

  - Add Windows compatibility [#12](https://github.com/dergachev/vagrant-vbox-snapshot/issues/12)

IMPROVEMENTS:

  - Clean up `vagrant snapshot go` output when target is already in poweroff state. [#14](https://github.com/dergachev/vagrant-vbox-snapshot/pull/14)

## [0.0.3](https://github.com/dergachev/vagrant-vbox-snapshot/compare/v0.0.2...v0.0.3) (Sep 3, 2013)

BACKWARDS INCOMPATIBILITIES:

  - none

FEATURES:

  - Add multi-vm support [#6](https://github.com/dergachev/vagrant-vbox-snapshot/pull/6)

IMPROVEMENTS:

  - Run `vagrant reload` when restoring snapshots with changed config [#2](https://github.com/dergachev/vagrant-vbox-snapshot/issues/2)
