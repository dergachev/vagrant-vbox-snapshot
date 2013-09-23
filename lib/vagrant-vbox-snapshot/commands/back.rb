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

            if machine.state.id != :poweroff
              machine.provider.driver.execute("controlvm", machine.id, "poweroff")
            end

            machine.provider.driver.execute("snapshot", machine.id, "restorecurrent") do |type, data|
              machine.env.ui.info(data, :color => type == :stderr ? :red : :white, :new_line => false)
            end

            if options[:reload]
              @env.ui.info("Reloading VM, since --reload passed")
              machine.action(:reload, :provision_enabled => false)
            else
              @env.ui.info("Starting restored VM")
              machine.action(:up, :provision_enabled => false)
            end
          end
        end
      end
    end
  end
end
