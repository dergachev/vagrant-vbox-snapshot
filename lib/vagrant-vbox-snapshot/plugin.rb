begin
    require "vagrant"
rescue LoadError
    raise "The Vagrant VBox Snapshot plugin must be run within Vagrant."
end

module VagrantPlugins
  module VBoxSnapshot
    class Plugin < Vagrant.plugin("2")
      name "Vagrant VBox Snapshot"
      description "Wrapper on the `VBoxManage snapshot` command."

      command "snapshot" do
        require_relative 'commands/root.rb'
        Command::Root
      end

    end
  end
end
