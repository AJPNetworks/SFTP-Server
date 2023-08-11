#!/bin/bash

# Check if script is run as root or with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or use sudo."
  exit 1
fi

# Check if OpenSSH server is installed
if ! command -v sshd &>/dev/null; then
    echo "OpenSSH server is not installed. Installing..."
    
    # Assuming Ubuntu/Debian. Adjust for other distributions if necessary.
    apt update
    apt install -y openssh-server
    
    if ! command -v sshd &>/dev/null; then
        echo "Error installing OpenSSH server. Exiting."
        exit 1
    fi
fi

# Ensure the SSH service is enabled and started
systemctl enable ssh
systemctl start ssh

# Previous script continues from here
adduser_url="https://raw.githubusercontent.com/AJPNetworks/SFTP-Server/main/addsftpuser"
deluser_url="https://raw.githubusercontent.com/AJPNetworks/SFTP-Server/main/delsftpuser"

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
