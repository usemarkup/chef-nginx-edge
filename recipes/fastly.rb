# This is required tp parse JSON on the command line (Fastly only supply JSON)
package 'jq'

# Create the nginx folder if it doesn't exist
directory '/etc/nginx' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  not_if { ::File.directory?("/etc/nginx") }
end

# Create a stub file for now
file '/etc/nginx/fastly.nginx.conf' do
  content '# This is a placeholder'
  mode '0755'
  owner 'root'
  group 'root'
  action :create_if_missing
end

if node['platform_version'].to_i == 7
  command = "systemctl reload nginx"
else
  command = "service nginx reload"
end

template '/usr/local/bin/edge-nginx-fastly' do
  source 'fastly.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables ({
    service_reload_command: command
  })
end
