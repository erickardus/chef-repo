require 'spec_helper'

describe 'nginx::default' do

	describe file('/usr/local/nginx/sbin/nginx') do
  it { should exist }
end
  it 'nginx running' do
     expect(process 'nginx').to be_running
  end
  it 'responds on nginx call' do
     expect(command('curl localhost:80/index.html').stdout).to match /Welcome/
  end
end
