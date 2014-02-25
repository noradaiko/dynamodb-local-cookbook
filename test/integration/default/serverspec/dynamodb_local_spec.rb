require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/user/sbin'
  end
end

describe "DynamoDB Local Daemon" do
  describe 'group' do
    it "exists" do
      expect(group('dynamodb-local')).to exist
    end
  end

  describe "user" do
    it "exists" do
      expect(user('dynamodb-local')).to exist
    end

    it "belongs to group 'dynamodb-local'" do
      expect(user('dynamodb-local')).to belong_to_group 'dynamodb-local'
    end

    it "has a home directory '/home/dynamodb-local'" do
      expect(user('dynamodb-local')).to have_home_directory '/home/dynamodb-local'
    end
  end

  describe "dynamodb local jar" do
    it "should be downloaded to tmp" do
      expect(file('/tmp/dynamodb_local_2013-12-12.tar.gz')).to be_file
    end
  end
end
