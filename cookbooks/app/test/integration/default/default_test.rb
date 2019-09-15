describe apt('ppa:longsleep/golang-backports') do
  it { should exist }
  it { should be_enabled }
end

describe package('golang-go') do
  it { should be_installed }
end

describe file('/usr/local/bin/run.sh') do
  it { should exist }
end

describe systemd_service('hello') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
