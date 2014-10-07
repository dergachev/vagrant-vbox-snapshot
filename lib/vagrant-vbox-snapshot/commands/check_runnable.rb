# Adapted from https://github.com/dotless-de/vagrant-vbguest/

require Vagrant.source_root.join("plugins/commands/up/start_mixins")

module VagrantPlugins
  module VBoxSnapshot
    module Command

      module CheckRunnable

        include VagrantPlugins::CommandUp::StartMixins

        class NoVirtualBoxMachineError < Vagrant::Errors::VagrantError
          error_message "The VBGuest plugin must be used with VirtualBox Machines only."
        end

        def check_runnable_on(vm)
          raise NoVirtualBoxMachineError if vm.provider.class != VagrantPlugins::ProviderVirtualBox::Provider
          raise Vagrant::Errors::VMNotCreatedError if vm.state.id == :not_created
        end
      end
    end
  end
end
