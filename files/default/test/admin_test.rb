require 'minitest/spec'

describe_recipe 'opennebula::admin' do

  describe "All packages installed" do
    it "Opennebula Installed" do
      assert  package("opennebula").must_be_installed
    end

    it "Sunstone Installed" do
      assert  package("opennebula-sunstone").must_be_installed
    end

    it "Nfs server Installed" do
      assert  package("nfs-kernel-server").must_be_installed
    end
  end

  describe "Wrote config files" do
    it "creates a file sunstone-server.conf" do
      assert file("/etc/one/sunstone-server.conf").must_have(:mode, "0600")
    end
    
    it "creates a file one_auth" do
      assert file("/var/lib/one/.one/one_auth").must_have(:mode, "0600")
    end
  end

  describe "Users & groups"do
    it "User oneadmin exists" do
      user("oneadmin").must_exist
    end
  end

#  describe "Running services"do
#    it "Sunstone is running" do
#      user("oneadmin").must_exist
#    end
#
#    it "Opennebula is running" do
#      user("oneadmin").must_exist
#    end
#  end

  describe "Sunstone" do
    it "is accesible" do
      #Host IP
      ip=node['ipaddress']
      #Port Binder
      port=node['one']['sunstone']['port']
        
      result = assert_sh("curl #{ip}:#{port}")
      assert_includes result, "OpenNebula Sunstone Login"
    end
  end
end
