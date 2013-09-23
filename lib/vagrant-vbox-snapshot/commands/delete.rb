# this command is very slow
# consider removing it; or replacing with this idea: http://superuser.com/questions/590968/quickest-way-to-merge-snapshots-in-virtualbox

require_relative 'multi_vm_args'

module VagrantPlugins
  module VBoxSnapshot
    module Command
      class Delete < Vagrant.plugin(2, :command)
        include MultiVmArgs

        def execute
          options = {}

          opts = OptionParser.new do |opts|
            opts.banner = "Delete snapshot (warning: this is a very slow operation)"
            opts.separator ""
            opts.separator "Usage: vagrant snapshot delete [vm-name] <SNAPSHOT_NAME>"
          end
          # Parse the options
          argv = parse_options(opts)
          return if !argv

          vm_name, snapshot_name = parse_vm_and_snapshot_options(argv, opts)
          return if !snapshot_name

          with_target_vms(vm_name, single_target: true) do |machine|
            machine.provider.driver.execute("snapshot", machine.id, "delete", snapshot_name) do |type, data|
              machine.env.ui.info(data, :color => type == :stderr ? :red : :white)
            end
          end
        end
      end
    end
  end
end
