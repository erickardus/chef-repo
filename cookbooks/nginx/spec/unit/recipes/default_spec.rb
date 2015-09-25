#
# Cookbook Name:: nginx
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'chefspec'
at_exit  {  ChefSpec::Coverage.report!  }
describe 'nginx::default' do
  let(:chef_run) {ChefSpec::ServerRunner.new.converge('nginx::default') }
   before do
#      stub_command("test -f /usr/local/nginx/sbin/nginx").and_return(true)
       stub_command("/usr/local/nginx/sbin/nginx -v | grep -q 1.9.0").and_return(true)
   end
    it 'installs nginx' do
          expect(chef_run).to install_package('zlib-devel')
          expect(chef_run).to install_package('pcre-devel')
          expect(chef_run).to install_package('gcc')
          expect(chef_run).to install_package('libpcre3-dev')
          expect(chef_run).to install_package('build-essential')
          expect(chef_run).to install_package('libssl-dev')
          expect(chef_run).to create_template('/etc/init.d/nginx')
          expect(chef_run).to enable_service('nginx')
          expect(chef_run).to create_template('nginx.conf')
          expect(chef_run).to create_template('/data_test/www/index.html')
          expect(chef_run).to create_template('/data_test/proxy/index.html')
#          expect(chef_run).to create_directory('/etc/nginx')
    end
end