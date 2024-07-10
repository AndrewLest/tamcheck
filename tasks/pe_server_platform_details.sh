#!/bin/sh

# Puppet Task Name: pe_server_platform_details
#
# This is where you put the shell code for your task.
#
# You can write Puppet tasks in any language you want and it's easy to
# adapt an existing Python, PowerShell, Ruby, etc. script. Learn more at:
# https://puppet.com/docs/bolt/0.x/writing_tasks.html
#
# Puppet tasks make it easy for you to enable others to use your script. Tasks
# describe what it does, explains parameters and which are required or optional,
# as well as validates parameter type. For examples, if parameter "instances"
# must be an integer and the optional "datacenter" parameter must be one of
# portland, sydney, belfast or singapore then the .json file
# would include:
#   "parameters": {
#     "instances": {
#       "description": "Number of instances to create",
#       "type": "Integer"
#     },
#     "datacenter": {
#       "description": "Datacenter where instances will be created",
#       "type": "Enum[portland, sydney, belfast, singapore]"
#     }
#   }
# Learn more at: https://puppet.com/docs/bolt/0.x/writing_tasks.html#ariaid-title11
#
#!/bin/sh

# Puppet Task Name: pe_server_node_detail
#
# This is where you put the shell code for your task.
#
# You can write Puppet tasks in any language you want and it's easy to
# adapt an existing Python, PowerShell, Ruby, etc. script. Learn more at:
# https://puppet.com/docs/bolt/0.x/writing_tasks.html
#
# Puppet tasks make it easy for you to enable others to use your script. Tasks
# describe what it does, explains parameters and which are required or optional,
# as well as validates parameter type. For examples, if parameter "instances"
# must be an integer and the optional "datacenter" parameter must be one of
# portland, sydney, belfast or singapore then the .json file
# would include:
#   "parameters": {
#     "instances": {
#       "description": "Number of instances to create",
#       "type": "Integer"
#     },
#     "datacenter": {
#       "description": "Datacenter where instances will be created",
#       "type": "Enum[portland, sydney, belfast, singapore]"
#     }
#   }
# Learn more at: https://puppet.com/docs/bolt/0.x/writing_tasks.html#ariaid-title11
#
if [ -d ${T_output_dir} ]
then
    if [ ! -d "${PT_output_dir}/tamcheck_data" ]
    then
        mkdir -p "${PT_output_dir}/tamcheck_data"
        output_dir="${PT_output_dir}"
        output_dir+="/"
        output_dir+="tamcheck_data"
    else
        output_dir="${PT_output_dir}"
        output_dir+="/"
        output_dir+="tamcheck_data"
    fi
else
    echo "No ${PT_output_dir} directory exists to dump files"
    exit
fi

# Ensure pathing is set to be able to run puppet commands
[[ $PATH =~ "/opt/puppetlabs/bin" ]] || export PATH="/opt/puppetlabs/bin:${PATH}"

# File variable to use in redirections of command outputs to files
output_file_pe_server_platform="${output_dir}/pe_node_server_platform.out"

fqdn = puppet facts networking.fqdn
ip = puppet facts networking.ip
os = puppet facts os.name
os_version = puppet facts os.release.full
vcpu = puppet facts processors.count
cpu_model = puppet facts processors.models | uniq 
memory = puppet facts memory.total
uptime = puppet facts system_uptime.uptime

echo "" > $output_file_pe_server_platform
echo "PE Server FQDN: ${fqdn}" >> $output_file_pe_server_platform
echo "PE Server ip address: ${ip}" >> $output_file_pe_server_platform
echo "PE Server operating system: ${os}" >> $output_file_pe_server_platform
echo "PE Server operating system version: ${os_version}" >> $output_file_pe_server_platform
echo "PE Server vCPU count: ${vcpu}" >> $output_file_pe_server_platform
echo "PE Server CPU type: ${cpu_model}" >> $output_file_pe_server_platform
echo "PE Server Memory: ${memory}" >> $output_file_pe_server_platform
echo "PE Server Uptime: ${uptime}" >> $output_file_pe_server_platform

echo "" >> $output_file_pe_server_platform