#!/bin/bash

adduser_url="https://raw.githubusercontent.com/AJPNetworks/SFTP-Server/main/bash-commands/addsftpuser"
deluser_url="https://raw.githubusercontent.com/AJPNetworks/SFTP-Server/main/bash-commands/delsftpuser"

# Extract file names from links
adduser_filename=$(basename "$adduser_url")
deluser_filename=$(basename "$deluser_url")

# Download the files
wget "$adduser_url"
wget "$deluser_url"

# Move the files to /usr/bin/ and make them executable
mv "$adduser_filename" /usr/bin/
mv "$deluser_filename" /usr/bin/
chmod +x /usr/bin/"$adduser_filename"
chmod +x /usr/bin/"$deluser_filename"

echo "Files downloaded, made executable, and moved to /usr/bin/."
