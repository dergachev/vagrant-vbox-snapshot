module VagrantPlugins
  module VBoxSnapshot
    module Command
      class Go < Vagrant.plugin(2, :command)
        def execute
          options = {}

          opts = OptionParser.new do |opts|
            opts.banner = "Go to specified snapshot"
            opts.separator ""
            opts.separator "Usage: vagrant snapshot go <SNAPSHOT_NAME>"
          end
          # Parse the options
          argv = parse_options(opts)
          return if !argv

          if !argv[0]
            @env.ui.info(opts.help, :prefix => false)
            return
          end

          with_target_vms do |machine|
            vm_id = machine.id
            snapshot_name = argv[0]
            system "VBoxManage controlvm #{vm_id} poweroff"
            system "VBoxManage snapshot  #{vm_id} restore #{snapshot_name}"
            system "VBoxManage startvm   #{vm_id} --type headless"
          end
        end
      end
    end
  end
end
