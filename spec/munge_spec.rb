require 'spec_helper'

describe 'slurm::munge' do
  before do
    Chef::EncryptedDataBagItem.stub(:load).with('slurm', 'munge').and_return({ 'id' => 'munge', 'key' => 'mungesecret'})
  end

  let(:chef_run) do
    runner = ChefSpec::ChefRunner.new()
    runner.node.set[:hostname] = 'myhostname'
    runner.node.set[:cpu] = { :total => 2 }
    runner.converge('slurm::default')
  end

  it 'should install minge' do
    expect(chef_run).to install_package 'munge'
  end

  it 'should create munge.key' do
    expect(chef_run).to create_file_with_content('/etc/munge/munge.key', 'mungesecret')
  end

  it 'should start munge daemon' do
    expect(chef_run).to start_service 'munge'
  end 

  it 'should enable munge daemon' do
    expect(chef_run).to set_service_to_start_on_boot 'munge'
  end 
end

