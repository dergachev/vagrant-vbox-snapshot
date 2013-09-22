module VagrantPlugins
  module VBoxSnapshot
    module Command
      class Back < Vagrant.plugin(2, :command)
        def execute
          options = {}

          opts = OptionParser.new do |opts|
            opts.banner = "Back to current snapshot"
            opts.separator ""
            opts.separator "Usage: vagrant snapshot back [vm-name]"
          end
          # Parse the options
          argv = parse_options(opts)
          return if !argv

          with_target_vms(argv, single_target: true) do |machine|
            vm_id = machine.id
            vm_info = `VBoxManage showvminfo #{vm_id} --machinereadable`
            vm_state = vm_info.match(/^VMState="([a-z]+)".*/)[1]

            system "VBoxManage snapshot #{vm_id} list --details"
            system "VBoxManage controlvm #{vm_id} poweroff" if vm_state != 'poweroff'
            system "VBoxManage snapshot  #{vm_id} restorecurrent"
            system "VBoxManage startvm   #{vm_id} --type headless"
          end
        end
      end
    end
  end
end
