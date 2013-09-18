require 'chefspec'

describe 'slurm::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'slurm::default' }
  it 'should do something' do
    pending 'Your recipe examples go here.'
  end
end
