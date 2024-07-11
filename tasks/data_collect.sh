#!/bin/sh

# Puppet Task Name: data_collect
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
if [ -d ${PT_output_dir} ]
then
    if [ ! -d "${PT_output_dir}/tamcheck_data" ]
    then
    	echo "${PT_output_dir}/tamcheck_data has not been created, run the collection task(s) first"
   	exit
    else
        output_dir="${PT_output_dir}"
        output_dir+="/"
        output_dir+="tamcheck_data"
    fi
else
    echo "Output directory: ${PT_output_dir} does not exist, terminating task"
    exit
fi

# Ensure pathing is set to be able to run puppet commands
[[ $PATH =~ "/opt/puppetlabs/bin" ]] || export PATH="/opt/puppetlabs/bin:${PATH}"

# Move to the output directory
cd $output_dir

# Use the date to generate a meaningful, unique string for the filename [Start with dd-mm-yy, can be extended if needed]
date=`data +"%d-%m-%y`

# Add all files with the .out suffix to a compressed archive
tar cfz tamcheck_archive_${date}.tar.gz *.out
 