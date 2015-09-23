#
# Cookbook Name:: nginx
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'chefspec'
at_exit  {  ChefSpec::Coverage.report!  }
describe 'nginx::default' do
  let(:chef_run) {ChefSpec::ServerRunner.new.converge('nginx::default') }
    it 'installs nginx' do
          expect(chef_run).to install_package('zlib-devel')
          expect(chef_run).to install_package('pcre-devel')
          expect(chef_run).to install_package('gcc')
          expect(chef_run).to create_template('/data_test/www/index.html')
          expect(chef_run).to create_template('/data_test/proxy/index.html')
#          expect(chef_run).to create_template('/etc/nginx/nginx-1.7.9/conf/nginx.conf')
          expect(chef_run).to create_template('/etc/init.d/nginx')
          expect(chef_run).to enable_service('nginx')
#          expect(chef_run).to create_directory('/etc/nginx')
    end
end