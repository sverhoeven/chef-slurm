# slurm cookbook

[![Build Status](https://travis-ci.org/sverhoeven/chef-slurm.png)](https://travis-ci.org/sverhoeven/chef-slurm)

Cookbook for Slurm resource manager (https://computing.llnl.gov/linux/slurm/slurm.html).
Can configure controller and computed nodes.

Inspiration from https://github.com/ajdecon/hpc-chef/tree/master/cookbooks/slurm-mpi-cluster

# Requirements

Chef 0.11+

## Platforms

Tested on:

* Ubuntu 12.04

# Usage

Create data bag with munge key using:

    gem install knife-solo_data_bag
    openssl rand -base64 512 > test/integration/default/encrypted_data_bag_secret
    EDITOR=nano knife solo data bag create --data-bag-path test/integration/default/data_bags --secret-file test/integration/default/encrypted_data_bag_secret slurm munge

#Tests

Unit tests can be run with:

    rspec

Integration tests can be run with:

   kitchen test

For integration tests a included encrypted data bag is used, this bag should not be used in production!!

# Attributes

See the `attributes/default.rb` for the defaults.

* `node['slurm']['control_machine']` - Hostname of primary controller.
* `node['slurm']['nodes']` - Array of compute nodes.
 * `node['slurm']['nodes'][<index>]['name']` - Hostname of compute node.
 * `node['slurm']['nodes'][<index>]['cpus']` - Number of cpus of compute node.
* `node['slurm']['partitions]`- Hash of partitions.
 * `node['slurm']['partitions][<partition name>]['nodes']` - Array of compute nodes which are member of this partition.
 * `node['slurm']['partitions][<partition name>]['default']` - String whether partition is default `YES` or `NO`.

# Recipes

* default, install munge and slurm 
* munge, install munge

# Author

Author:: Netherlands eScience Center (<info@esciencecenter.nl>)
