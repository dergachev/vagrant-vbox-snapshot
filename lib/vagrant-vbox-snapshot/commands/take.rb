module VagrantPlugins
  module VBoxSnapshot
    module Command
      class Take < Vagrant.plugin(2, :command)
        def execute
          options = {}

          opts = OptionParser.new do |opts|
            opts.banner = "Take snapshot"
            opts.separator ""
            opts.separator "Usage: vagrant snapshot take [vm-name] <SNAPSHOT_NAME>"
          end
          # Parse the options
          argv = parse_options(opts)
          return if !argv

          unless [1, 2].include?(argv.size)
            @env.ui.info(opts.help, :prefix => false)
            return
          end

          vm_name, snapshot_name = (argv.size == 1 ? [nil, argv[1]] : [argv[0], argv[1]])

          with_target_vms(vm_name, single_target: true) do |machine|
            vm_id = machine.id
            system "VBoxManage snapshot #{vm_id} take #{snapshot_name} --pause"
          end
        end
      end
    end
  end
end
