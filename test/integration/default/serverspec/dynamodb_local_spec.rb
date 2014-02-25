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

    it "belongs to group 'dynamodb-local'" do
      expect(@user).to belong_to_group 'dynamodb-local'
    end

    it "has a home directory '/home/dynamodb-local'" do
      expect(@user).to have_home_directory '/home/dynamodb-local'
    end
  end

  describe "dynamodb archive" do
    before :each do
      @file = file('/tmp/dynamodb_local_2013-12-12.tar.gz')
    end

    it "should be downloaded to tmp" do
      expect(@file).to be_file
    end

    it "should be owned by 'dynamodb-local'" do
      expect(@file).to be_owned_by 'dynamodb-local'
    end

    it "should be grouped into 'dynamodb-local'" do
      expect(@file).to be_grouped_into 'dynamodb-local'
    end
  end
end
