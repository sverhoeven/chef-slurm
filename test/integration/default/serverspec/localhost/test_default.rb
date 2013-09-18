require 'spec_helper'

describe 'slurm::default' do
  describe package('slurm-llnl') do
    it { should be_installed }
  end

  describe file('/etc/slurm-llnl/slurm.conf') do
    it { should be_file }
  end

  describe service('slurm-lnnl') do
    it { should be_enabled }
    it { should be_running }
  end
end

