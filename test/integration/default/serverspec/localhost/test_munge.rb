require 'spec_helper'

describe file('/etc/munge/munge.key') do
  it { should be_file }
end

describe service('munge') do
  it { should be_enabled }
  it { should be_running }
end
