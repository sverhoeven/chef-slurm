#
# Cookbook Name:: slurm
# Recipe:: default
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
include_recipe "slurm::munge"

package "slurm-llnl" do
  action :install
end

# Build slurm.conf based on the template
template "/etc/slurm-llnl/slurm.conf" do
    source "slurm.conf.erb"
    owner "slurm"
    mode "0755"
    notifies :restart, "service[slurm-llnl]"
end

service "slurm-llnl" do
  action [ :enable, :start ]
end
