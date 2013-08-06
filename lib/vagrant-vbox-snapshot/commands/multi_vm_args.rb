module VagrantPlugins
  module VBoxSnapshot
    module Command
      module MultiVmArgs
        def parse_vm_and_snapshot_options(argv, opts)
          unless [1, 2].include?(argv.size)
            @env.ui.info(opts.help, :prefix => false)
            return
          end

          if argv.size == 1
            [nil, argv[0]]
          else
            [argv[0], argv[1]]
          end
        end
      end
    end
  end
end
