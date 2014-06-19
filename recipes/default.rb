#
# Cookbook Name:: opennebula
# Recipe:: default
#
# Copyright 2014, david baena
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"

apt_repository 'add opennebula repository' do
  uri        'http://downloads.opennebula.org/repo/Ubuntu/12.04'
  components ['stable','opennebula']
  key        'http://downloads.opennebula.org/repo/Ubuntu/repo.key'
  action :add
end


