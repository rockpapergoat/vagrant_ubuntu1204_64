# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "base"
   config.vm.box_url = "https://s3-sa-east-1.amazonaws.com/willian-boxes/UbuntuServer12.04amd64.box" #"https://dl.dropbox.com/u/1543052/Boxes/UbuntuServer12.04amd64.box"
   
   config.vm.define :proxy do |proxy_config|
    proxy_config.vm.host_name = "proxy1"
    proxy_config.vm.network :hostonly, "192.168.33.10"
    proxy_config.vm.forward_port 80, 8080
    proxy_config.vm.share_folder "data", "/data", "data"
   end

    config.vm.define :web1 do |web_config|
     web_config.vm.host_name = "web1"
     web_config.vm.network :hostonly, "192.168.33.11"
     #web_config.vm.forward_port 80, 8080
     web_config.vm.share_folder "data", "/data", "data"
end

    config.vm.define :web2 do |web_config|
     web_config.vm.host_name = "web2"
     web_config.vm.network :hostonly, "192.168.33.12"
     #web_config.vm.forward_port 80, 8080
     web_config.vm.share_folder "data", "/data", "data"
end

   config.vm.provision :puppet, :options => "--verbose --debug --pluginsync", :facter => { "proxy" => ENV["FACTER_proxy"] } do |puppet|
     puppet.manifests_path = "manifests"
     puppet.module_path = "modules"
     puppet.manifest_file  = "base.pp"
   end
end
