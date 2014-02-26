include_recipe 'apt'
include_recipe 'java'

group "dynamodb-local" do
end

user "dynamodb-local" do
  gid "dynamodb-local"
end

remote_file "tmp/dynamodb-local.tar.gz" do
  source "https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_2013-12-12.tar.gz"
  user "root"
  group "root"
  backup false
end

bash "extract dynamodb local" do
  cwd "/tmp/"
  code "tar -zxvf dynamodb-local.tar.gz && cp -fr dynamodb_local_2013-12-12/ /home/dynamodb-local/"
end
