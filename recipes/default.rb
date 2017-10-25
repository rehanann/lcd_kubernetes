#
# Cookbook:: lcd_kubernetes
# Recipe:: default
#
# Copyright:: 2017, Rehan Anwar, All Rights Reserved.
#
#
#
%w{kubernetes etcd}.each  do |pkg|
  package pkg do
   action :install
  end
end

cookbook_file '/etc/etcd/etcd.conf' do
   source 'etcd.conf'
   owner  "root"
   group  "root"
   mode '0644'
end


cookbook_file '/etc/kubernetes/apiserver' do
    source 'apiserver'
    owner "root"
    group "root"
    mode '0644'
end

template '/etc/kubernetes/config' do
     source 'config.erb'
     owner "root"
     group "root"
     mode '0644'
end

