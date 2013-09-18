require 'chefspec'

describe 'slurm::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'slurm::default' }

  it 'installs slurm-llnl' do
    expect(chef_run).to install_package 'slurm-llnl'
  end

  it 'creates slurm.conf file' do
    expect(chef_run).to create_file('/etc/slurm-llnl/slurm.conf')
  end
end
