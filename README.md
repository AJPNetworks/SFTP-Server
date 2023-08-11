# SFTP-Server (Version 1.0)
 Quick and simple scripts to add and delete users on an Ubuntu Server acting as an SFTP server


## Instalation

 To install the scripts, simply run the following command

 ```sh <(curl -sS https://raw.githubusercontent.com/AJPNetworks/SFTP-Server/main/install.sh)```

 This will download and run the install script which installs the two bash scripts and ensures that OpenSSH is setup properly.

## Usage

 Add Users: Utilize the `addsftpuser` script. When invoked, it will guide you through providing a username, password, and optionally, the user's full name and description. All required permissions and directories are automatically configured.

 Delete Users: Simply run `delsftpuser`.

 For every user created, two folders, Inbound and Outbound, are established. These are designed for users to effortlessly log in, drop, or fetch files as necessary. Specifically:
    Outbound: Read-only access for the user.
    Inbound: Both readable and writable by the user.

 Admin and shared folders coming soon...

## Donate

 This project was created by AJP Networks LLC as an open source project that may be freely distributed without license.
 I accept donations through PayPal at the following link

 https://paypal.me/kn0t5
