apt_repository 'golang-go' do
  uri 'ppa:longsleep/golang-backports'
end

apt_update 'update the packages'

apt_package 'golang-go'

file '/usr/local/bin/run.sh' do
  content <<-EOH
go build
./hello-world
  EOH
  mode '0755'
  owner 'vagrant'
  group 'vagrant'
end

systemd_unit 'hello.service' do
  content <<-EOU
  [Unit]
  Description="Hello World App"
  Requires=network.target

  [Service]
  Type=simple
  User=vagrant
  Group=vagrant
  WorkingDirectory=/opt/hello-world
  ExecStart=/bin/bash /usr/local/bin/run.sh
  TimeoutSec=30
  RestartSec=5s
  Restart=always

  [Install]
  WantedBy=multi-user.target
  EOU

  action [:create, :enable, :start]
end
