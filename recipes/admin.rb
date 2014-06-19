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

log "Setting credentials"
template "#{node['one']['path']}/.one/one_auth" do
 source "one_auth.erb"
 owner "oneadmin"
 group "root"
 mode 0600
end

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

execute "change passwd" do
  command "oneuser passwd 0 oneadmin"
  user "oneadmin"
end

service "opennebula" do
  action :restart
end
#
#include_recipe "database::mysql"
#mysql_connection_info = {
#  :host     => 'localhost',
#  :username => 'root',
#  :password => node['mysql']['server_root_password']
#}
