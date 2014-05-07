node.default[:dynamodb_local][:source] =
  'http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest'

node.default[:dynamodb_local][:port] = 8000
node.default[:dynamodb_local][:log_dir] = './main'
node.default[:dynamodb_local][:java_library_path] = './DynamoDBLocal_lib'
node.default[:dynamodb_local][:jar] = 'DynamoDBLocal.jar'
node.default[:dynamodb_local][:db_path] = '/data/dynamodb-local'
