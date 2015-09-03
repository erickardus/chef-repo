#
# Cookbook Name:: apache3
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'
at_exit { ChefSpec::Coverage.report! }

describe 'apache3::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

	it 'installs perl' do
	  expect(chef_run).to install_package('perl')
	end
	
	it 'installs httpd' do
	  expect(chef_run).to install_package('httpd') 
	end
	
	it 'Enables httpd' do
	  expect(chef_run).to enable_service('httpd') 
	end
	
	it 'create group' do
	  expect(chef_run).to create_group('web_admin') 
	end
	
	it 'Create user' do
	  expect(chef_run).to create_user('web_admin') 
	end
	
	it 'Creates index.html' do
	  expect(chef_run).to create_template('/var/www/html/index.html') 
	end
	
	it 'Modifies custom.conf' do
	  expect(chef_run).to create_template('/etc/httpd/conf.d/custom.conf') 
	end
	
	it 'restart httpd' do
      template = chef_run.template('/etc/httpd/conf.d/custom.conf')
      expect(template).to notify('service[httpd]').to(:restart)
    end
	
	it 'Modifies httpd.conf' do
	  expect(chef_run).to create_template('/etc/httpd/conf/httpd.conf') 
	end	
	
	it 'Modifies sysctl.conf' do
	  expect(chef_run).to create_template('/etc/sysctl.conf') 
	end	
	
#    it 'restarts sysctl' do
#      template = chef_run.template('/etc/sysctl.conf')
#      expect(template).to execute('renew_sysctl')
#    end

	
  end
end
