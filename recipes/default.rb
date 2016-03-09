#
# Cookbook Name:: logdna_agent
# Recipe:: default
#
# Copyright 2016, Toby Sullivan
#
# All rights reserved - Do Not Redistribute
#

# Host agent install instructions from logdna.com:
# ===
# echo "deb http://repo.logdna.com stable main" | sudo tee /etc/apt/sources.list.d/logdna.list
# sudo apt-get update
# sudo apt-get install -y --force-yes logdna-agent
# sudo logdna-agent -k <API_KEY>
# # /var/log is monitored/added by default (recursively), optionally specify more folders here
# sudo logdna-agent -d /path/to/log/folders
# sudo update-rc.d logdna-agent defaults
# sudo /etc/init.d/logdna-agent start

apt_repository 'logdna' do
  uri        'http://repo.logdna.com'
  components ['main', 'stable']
  action     :add
  notifies   :run, 'execute[apt-get update]', :immediately
end

execute 'run logdna-agent' do
  command "logdna-agent -k #{node['logdna']['api_key']}"
  action  :nothing
end

apt_package 'logdna-agent' do
  action   :install
  notifies :run, 'execute[run logdna-agent]', :immediately
end

node['logdna_agent']['log_directories'].each do |dir|
  execute "add #{dir} to logdna-agent" do
    command "logdna-agent -d #{dir}"
  end
end

execute 'add logdna-agent to defaults' do
  command 'update-rc.d logdna-agent defaults'
  action  :run
end

service 'logdna-agent' do
  action :start
end
