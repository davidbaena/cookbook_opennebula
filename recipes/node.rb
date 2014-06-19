#
# Cookbook Name:: opennebula
# Recipe:: node
#
# Copyright 2014, david baena
#
# All rights reserved - Do Not Redistribute
#
log "Installing Node..."
package "opennebula-node"

log "Installing nfs"
package "nfs-common"

log "Installing bridge-utils"
package "bridge-utils"

