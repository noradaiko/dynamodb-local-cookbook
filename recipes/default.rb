include_recipe 'apt'
include_recipe 'java'
include_recipe 'ark'
include_recipe 'runit'

# TODO: Refactor site location into attributes
ark 'dynamodb' do
  url 'http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest'
  extension 'tar.gz'
end

runit_service 'dynamodb-local-cookbook'
