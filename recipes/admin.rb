#
# Cookbook Name:: opennebula
# Recipe:: admin
#
# Copyright 2014, david baena
#
# All rights reserved - Do Not Redistribute
#

log "Installing Opennebula..."
package "opennebula"

log "Installing Opennebula-Sunstone..."
package "opennebula-sunstone"

log "Installing nfs-server..."
package "nfs-kernel-server"

log "Setting sunstone-config"
template "/etc/one/sunstone-server.conf" do
 source "sunstone-server.conf.erb"
 owner "oneadmin"
 group "root"
 mode 0600
end

service "opennebula-sunstone" do
  action :restart
end

log "Setting credentials"
execute "change passwd" do
  command "oneuser passwd 0 oneadmin"
  environment ({'ONE_AUTH' => "#{node['one']['path']}/.one/one_auth"})
  user "oneadmin"
end

template "#{node['one']['path']}/.one/one_auth" do
 source "one_auth.erb"
 owner "oneadmin"
 group "root"
 mode 0600
end

service "opennebula" do
  action :restart
end

