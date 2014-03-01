require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/user/sbin'
  end
end

describe "DynamoDB Local Daemon" do
  describe package('apt') do
    it { should be_installed }
  end

  describe command('which java') do
    it { should return_exit_status 0 }
  end

  describe file('/usr/local/dynamodb') do
    it { should be_directory }
  end

  describe service('dynamodb-local') do
    it { should be_running }
  end

  describe port(8000) do
    it { should be_listening }
  end
end
