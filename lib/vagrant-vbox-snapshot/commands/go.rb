require_relative 'multi_vm_args'

module VagrantPlugins
  module VBoxSnapshot
    module Command
      class Go < Vagrant.plugin(2, :command)
        include MultiVmArgs

        def get_shared_folders(vm_id)
          shared_folders = []
          info = `VBoxManage showvminfo #{vm_id} --machinereadable`
          info.split("\n").each do |line|
            if line =~ /^SharedFolderNameMachineMapping\d+="(.+?)"$/
              shared_folders << $1.to_s
            end
          end
          return shared_folders
        end

        def before_restore(vm_id)
          @shared_folders_before = get_shared_folders(vm_id)
        end

        def after_restore(vm_id)
          @shared_folders_after = get_shared_folders(vm_id)
          if @shared_folders_before != @shared_folders_after
            missing_folders = @shared_folders_before - @shared_folders_after
            @env.ui.warn("Synced folders have changed after restoring snapshot. Consider running 'vagrant reload'.")
            @env.ui.warn("   Before restore: #{@shared_folders_before}")
            @env.ui.warn("    After restore: #{@shared_folders_after}")
          end
        end

        def execute
          options = {}
          options[:reload] = false

          opts = OptionParser.new do |opts|
            opts.banner = "Go to specified snapshot"
            opts.separator ""
            opts.separator "Usage: vagrant snapshot go [vm-name] <SNAPSHOT_NAME>"

            opts.on("-r", "--reload", "Runs 'vagrant reload --no-provision' after restoring snapshot to ensure Vagrantfile config is applied.") do |reload|
              options[:reload] = reload
            end

          end
          # Parse the options
          argv = parse_options(opts)
          return if !argv

          vm_name, snapshot_name = parse_vm_and_snapshot_options(argv, opts)
          return if !snapshot_name

          with_target_vms(vm_name, single_target: true) do |machine|
            vm_id = machine.id

            before_restore(vm_id)

            if machine.state.id != :poweroff
              @env.ui.info("Powering off machine #{vm_id}")
              machine.provider.driver.execute("controlvm", machine.id, "poweroff")
            end

            machine.provider.driver.execute("snapshot", machine.id, "restore", snapshot_name) do |type, data|
              machine.env.ui.info(data, :color => type == :stderr ? :red : :white, :new_line => false)
            end

            if options[:reload]
              @env.ui.info("Reloading VM, since --reload passed")
              machine.action(:reload, :provision_enabled => false)
            else
              @env.ui.info("Starting restored VM")
              machine.action(:up, :provision_enabled => false)
            end

            after_restore(vm_id)
          end
        end
      end
    end
  end
end
