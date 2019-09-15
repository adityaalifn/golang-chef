Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'
  config.vm.network :private_network, ip: '192.168.50.4', owner: "vagrant", group: "vagrant"
  config.vm.synced_folder '.', '/opt/hello-world'
  config.vm.provision 'chef_solo' do |chef|
    chef.arguments = '--chef-license accept'
    chef.add_recipe 'app'
  end
end
