DynamoDB Local Chef Cookbook
============================

Installs and configures dynamodb-local.

## Requirements

### Cookbooks

 * apt
 * java
 * ark

## Recipes

### default

Include the default recipe in a run list, to get `dynamodb-local`.
The `dynamodb-local` is compiled & installed from source with `ark`.

## Attributes

 * `node[:dynamodb_local][:source]` - URL to fetch source of dynamodb-local.
 * `node[:dynamodb_local][:source_extension]` - file extension of source file. default: `tar.gz`

###  USER & PATHS
 * `node[:dynamodb_local][:dir]` - install directory. default: `/usr/local/dynamodb-local`
 * `node[:dynamodb_local][:path][:data]` - directory stored data. default: `/var/lib/dynamodb-local`
 * `node[:dynamodb_local][:path][:logs]` - log directory. default: `./main`

### RUN DETAILS
 * `node[:dynamodb_local][:port]` - server port of dynamodb-local. default: `9506`
 * `node[:dynamodb_local][:java][:lib]` - Java library name. default: `DynamoDBLocal_lib`
 * `node[:dynamodb_local][:java][:jar]` - filename of jar. default: `DynamoDBLocal.jar`

## Usage

Simply include the dynamodb-local recipe where ever you would like dynamo installed.

