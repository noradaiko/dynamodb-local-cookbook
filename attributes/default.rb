# === SOURCE
node.default[:dynamodb_local][:source] = "http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest"
node.default[:dynamodb_local][:source_extension] = 'tar.gz'

# === USER & PATHS
node.default[:dynamodb_local][:dir] = '/usr/local/dynamodb-local'
node.default[:dynamodb_local][:path][:data] = "/var/lib/dynamodb-local"
node.default[:dynamodb_local][:path][:logs] = "./main"

# === RUN DETAILS
node.default[:dynamodb_local][:port] = 9506
node.default[:dynamodb_local][:java][:lib] = 'DynamoDBLocal_lib'
node.default[:dynamodb_local][:java][:jar] = 'DynamoDBLocal.jar'
