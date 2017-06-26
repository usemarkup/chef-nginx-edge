# nginx-edge

A cookbook for managing an nginx instance behind an edge server like Fastly. 

This will create a bash script that allows writing a file to the /etc/nginx folder
to include in web servers that are behind edge servers.


In short in the case of Fastly it will create a file like this

/etc/nginx/fastly.nginx.conf:

```ini
# This was auto generated from /usr/local/bin/edge-nginx-fastly
# PLEASE DO NOT MAKE MANUAL CHANGES

# Use this header for the IP address of the web request
real_ip_header X-Forwarded-For;
real_ip_recursive on;

# Fastly Subnets
set_real_ip_from 23.235.32.0/20;
set_real_ip_from 43.249.72.0/22;
set_real_ip_from 103.244.50.0/24;
set_real_ip_from 103.245.222.0/23;
set_real_ip_from 103.245.224.0/24;
set_real_ip_from 104.156.80.0/20;
set_real_ip_from 151.101.0.0/16;
set_real_ip_from 157.52.64.0/18;
set_real_ip_from 172.111.64.0/18;
set_real_ip_from 185.31.16.0/22;
set_real_ip_from 199.27.72.0/21;
set_real_ip_from 199.232.0.0/16;
set_real_ip_from 202.21.128.11/32;
set_real_ip_from 202.21.128.12/32;
set_real_ip_from 203.57.145.11/32;
set_real_ip_from 203.57.145.12/32;
```
