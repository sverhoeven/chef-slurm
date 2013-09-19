#
# Cookbook Name:: slurm
# Recipe:: munge
#
# Copyright (C) 2013 Netherlands eScience Center
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "munge" do
  action :install
end

# The munge key must be shared between all slurm nodes
munge_bag_item = Chef::EncryptedDataBagItem.load('slurm', 'munge')
munge_key = munge_bag_item["key"]

template "/etc/munge/munge.key" do
  source "munge.key.erb"
  owner "munge"
  mode "0400"
  variables ({
    :munge_key => munge_key
  })
  notifies :restart, "service[munge]"
end

service "munge" do
  action [ :enable, :start ]
end

