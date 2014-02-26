require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/user/sbin'
  end
end

describe "DynamoDB Local Daemon" do
  describe "group 'dynamodb-local'" do
    it "exists" do
      expect(group('dynamodb-local')).to exist
    end
  end

  describe "user 'dynamodb-local'" do
    before :each do
      @user = user('dynamodb-local')
    end

    it "exists" do
      expect(@user).to exist
    end
  end

  describe "dynamodb archive" do
    before :each do
      @file = file('/tmp/dynamodb-local.tar.gz')
    end

    it "downloads to tmp" do
      expect(@file).to be_file
    end

    it "extracts into '/home/dynamodb-local'" do
      expect(file('/home/dynamodb-local/DynamoDBLocal.jar')).to be_file
    end
  end
end
