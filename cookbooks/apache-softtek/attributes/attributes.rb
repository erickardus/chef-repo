#Index.html Variables
default['apache3']['port'] =  7070
default['apache3']['document_root'] = '/var/www/html'

#Apache User Parameters
default['apache3']['group'] =  'web_admin'
default['apache3']['user'] =  'web_admin'
default['apache3']['password'] =  'patito'
default['apache3']['shell'] =  '/bin/false'

#Apache Server Tuning Variables
default['apache3']['StartServers'] = 8
default['apache3']['MinSpareServers'] = 5
default['apache3']['MaxSpareServers'] = 20
default['apache3']['ServerLimit'] = 256
default['apache3']['MaxClients'] = 256
default['apache3']['MaxRequestsPerChild'] = 4000

#sysctl security Variables
#Controls IP packet forwarding
default['apache3']['net.ipv4.ip_forward'] = 0
# Controls source route verification
default['apache3']['net.ipv4.conf.default.rp_filter'] = 1
# Do not accept source routing
default['apache3']['net.ipv4.conf.default.accept_source_route'] = 0
# Send redirects, if router, but this is just server
default['apache3']['net.ipv4.conf.all.send_redirects'] = 0
default['apache3']['net.ipv4.conf.default.send_redirects'] = 0
# Accept packets with SRR option?
default['apache3']['net.ipv4.conf.all.accept_source_route'] = 0
# Accept Redirects? No, this is not router
default['apache3']['net.ipv4.conf.all.accept_redirects'] = 0
default['apache3']['net.ipv4.conf.all.secure_redirects'] = 0
# Log packets with impossible addresses to kernel log? yes
default['apache3']['net.ipv4.conf.all.log_martians'] = 1
default['apache3']['net.ipv4.conf.default.accept_source_route'] = 0
default['apache3']['net.ipv4.conf.default.accept_redirects'] = 0
default['apache3']['net.ipv4.conf.default.secure_redirects'] = 0
# Ignore all broadcast/multicast ICMP ECHO and TIMESTAMP
default['apache3']['net.ipv4.icmp_echo_ignore_broadcasts'] = 1
# Prevent against the common 'syn flood attack'
default['apache3']['net.ipv4.tcp_syncookies'] = 1
default['apache3']['net.ipv4.tcp_max_syn_backlog'] = 4096
# Enable source validation by reversed path
default['apache3']['net.ipv4.conf.all.rp_filter'] = 1