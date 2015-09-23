#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Define nginx version and url for download

version = node['nginx']['version']
url     = node['nginx']['url']

user    = node['nginx']['user']
dir     = node['nginx']['dir']

www     = node['nginx']['data_test']
image   = node['nginx']['data_images']
proxy   = node['nginx']['data_proxy']

# Needed libraries to compile nginx

package 'zlib-devel'
package 'pcre-devel'
package 'gcc'

bash "install_nginx" do
  user 'root'
  code <<-EOC
    mkdir #{dir}
    mkdir -p #{www}
    mkdir -p #{image}
    mkdir -p #{proxy}
    cd #{dir}
    wget #{url}nginx-#{version}.tar.gz
    tar xzf nginx-#{version}.tar.gz &&
    cd nginx-#{version} &&
    ./configure && make && make install
  EOC
#    not_if "test -f /usr/local/nginx/sbin/nginx"
   not_if "/usr/local/nginx/sbin/nginx -v | grep -q #{node['nginx']['version']}" 
end

template "#{dir}nginx-#{version}/conf/nginx.conf" do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template "/etc/init.d/nginx" do
  source 'nginx.init.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

service 'nginx' do
  action [ :start, :enable ]
end

template "#{www}index.html" do
  source 'nginx.conf.static.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template "#{proxy}index.html" do
  source 'nginx.conf.proxy.erb'
  owner 'root'
  group 'root'
  mode '0755'
end
