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
end
