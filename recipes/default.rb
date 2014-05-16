include_recipe 'apt'
include_recipe 'java'
include_recipe 'ark'

# download and install dynamodb local
#
ark 'dynamodb' do
  url node[:dynamodb_local][:source]
  path node[:dynamodb_local][:dir]
  action :install
  strip_components 0
end

# create data directory
#
directory node[:dynamodb_local][:path][:data] do
  owner "root"
  mode 0755
  action :create
end

# create logs directory
#
directory node[:dynamodb_local][:path][:logs] do
  owner "root"
  mode 0755
  action :create
end

# create service
#
service "dynamodb-local" do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :stop => true, :start => true, :restart => true
end

template "dynamodb-local.conf" do
  path "/etc/init/dynamodb-local.conf"
  source "dynamodb-local.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => 'dynamodb-local')
end

template "dynamodb-local.upstart.conf" do
  path "/etc/init/dynamodb-local.conf"
  source "dynamodb-local.upstart.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => 'dynamodb-local')
end

# enable and start service
#
service "dynamodb-local" do
  action [:enable, :start]
end
