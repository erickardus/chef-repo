#
# Cookbook Name:: apache3
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package "httpd"

service "httpd" do
 action [ :enable, :start ]
end

template '/etc/httpd/conf.d/custom.conf' do
 source 'custom.erb'
 mode '0644'
 notifies :restart, 'service[httpd]'
end

document_root = node['apache3']['document_root']

directory document_root do
 mode '0755'
 recursive true
end

template "#{document_root}/index.html" do
 source 'index.html.erb'
 mode '0644'
end

group "#{node['apache3']['group']}" do
  members "#{node['apache3']['user']}"
end

user "#{node['apache3']['user']}" do
	password "#{node['apache3']['password']}"
	shell "#{node['apache3']['shell']}"
end

template '/etc/httpd/conf/httpd.conf' do
 source 'httpd.erb'
 mode '0644'
 notifies :restart, 'service[httpd]'
end