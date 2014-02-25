group "dynamodb-local" do
end

user "dynamodb-local" do
  gid "dynamodb-local"
end

remote_file "tmp/dynamodb_local_2013-12-12.tar.gz" do
  source "https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_2013-12-12.tar.gz"
  user "dynamodb-local"
  group "dynamodb-local"
  backup false
end
