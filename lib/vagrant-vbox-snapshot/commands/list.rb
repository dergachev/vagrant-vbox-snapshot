module VagrantPlugins
  module VBoxSnapshot
    module Command
      class List < Vagrant.plugin(2, :command)
        def execute
          options = {}

          opts = OptionParser.new do |opts|
            opts.banner = "List snapshots"
            opts.separator ""
            opts.separator "Usage: vagrant snapshot list"
          end
          # Parse the options
          argv = parse_options(opts)
          return if !argv

          with_target_vms(argv, single_target: true) do |machine|
            puts "Listing snapshots for '#{machine.name}':"

            res = machine.provider.driver.execute("snapshot", machine.id, "list", "--details") do |type, data|
              machine.env.ui.info(data, :color => :green) if (type == :stdout)
            end
          end
        end
      end
    end
  end
end
