# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "diegodefuentes"
client_key               "#{current_dir}/diegodefuentes.pem"
validation_client_name   "pato-validator"
validation_key           "#{current_dir}/pato-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/pato"
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:editor]=          "C:\\progra~2\\notepa~1\\notepad++.exe -nosession -multiInst"