required_plugins = %w( vagrant-fsnotify )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "192.168.10.11"
  config.vm.hostname = "blockchain"
  config.vm.synced_folder "projects/", "/home/vagrant/projects", fsnotify: true
  config.vm.provision "file", source: "test_net", destination: "/home/vagrant/test_net"
  config.vm.provision :shell, path: "provision.sh"
  config.vm.provision :shell, path: "init_test_net.sh", privileged: false
  config.vm.provision :shell, path: "start_test_net.sh", run: 'always', privileged: false
  
  # Port forwarding
  config.vm.network :forwarded_port, guest: 8080, host: 8080 
  config.vm.network :forwarded_port, guest: 8545, host: 8545
  config.vm.network :forwarded_port, guest: 30303, host: 30303, protocol: "udp"
end
