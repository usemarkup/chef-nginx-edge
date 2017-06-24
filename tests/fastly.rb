describe package('jq') do
  it { should be_installed }
end

describe file('/usr/local/bin/edge-nginx-fastly') do
  it { should exist }
  its('mode') { should cmp 0755 }
end

describe command('/usr/local/bin/edge-nginx-fastly') do
  it { should exist }
  its('exit_status') { should eq 0 }
end
