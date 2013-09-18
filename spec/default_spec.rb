require 'spec_helper'

describe 'slurm::default' do
  before do
    Chef::EncryptedDataBagItem.stub(:load).with('slurm', 'munge').and_return({ :id => 'munge', :key => 'mungesecret'})
  end
  
  let(:chef_run) do
    runner = ChefSpec::ChefRunner.new()
    runner.node.set[:hostname] = 'myhostname'
    runner.node.set[:cpu] = { :total => 2 }
    runner.converge('slurm::default')
  end

  it 'installs slurm-llnl' do
    expect(chef_run).to install_package 'slurm-llnl'
  end

  it 'creates slurm.conf file' do
    expect(chef_run).to create_file('/etc/slurm-llnl/slurm.conf')
  end

  it 'should start slurm-llnl daemon' do
    expect(chef_run).to start_service 'slurm-llnl'
  end 

  it 'should enable slurm-llnl daemon' do
    expect(chef_run).to set_service_to_start_on_boot 'slurm-llnl'
  end 
end
