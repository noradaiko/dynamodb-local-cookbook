include_recipe 'apt'
include_recipe 'java'
include_recipe 'ark'
include_recipe 'runit'

ark 'dynamodb' do
  url node[:dynamodb_local][:source]
  path node[:dynamodb_local][:path]
  action :install
  strip_components node[:dynamodb_local][:strip_components]
end

runit_service 'dynamodb-local' do
  service_name 'dynamodb-local'
  options({
    :dynamodb_local_port => node[:dynamodb_local][:port],
    :dynamodb_local_log_dir => node[:dynamodb_local][:log_dir],
    :dynamodb_local_path => node[:dynamodb_local][:path],
    :dynamodb_local_strip_components => node[:dynamodb_local][:strip_components],
    :dynamodb_local_java_library_path => node[:dynamodb_local][:java_library_path],
    :dynamodb_local_jar => node[:dynamodb_local][:jar],
    :dynamodb_local_db_path => node[:dynamodb_local][:db_path]
  })
end
