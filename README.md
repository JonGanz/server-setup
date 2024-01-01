# Server Setup

The purpose of this repo is to make the setting up and restoring of my personal home
server quick, repeatable, and as painless as possible. We'll start small and build out
from there.

## Setup Steps

### GitHub

Before we can go about installing Ubuntu Server, an SSH key should be added to a Github
account. This can be done at the [SSH and GPG keys](https://github.com/settings/keys)
section of your account settings.

Generate an SSH key on the machine from which you intend to update or generally manage the
server. If you are on Windows, you can generate a key with the following:

```
ssh-keygen -o -t rsa -C "email@example.com"
```

If you ran this without modifying any of the prompts, you will be able to take the
contents of `C:\Users\<your user>\.ssh\id_rsa.pub` and paste that into the Key field when
adding a new SSH key to Github.

### Installing Ubuntu Server 22.04

Create your installation media by downloading the Ubuntu Server ISO and either creating a
bootable USB drive (via [Rufus](https://rufus.ie) for instance) or burning to a disc if
your server is that decrepit. Insert your media, and start the server setup process.

<<< There is a big missing section here when starting the installation process. >>>

<<< Installed minimal version >>>

#### Profile setup
Enter the name of the user you wish to have administering the server. Note your username
and password.

#### Upgrade to Ubuntu Pro
Chose "Skip for now".

#### SSH Setup
Chose to "Install OpenSSH server". Then under "Import SSH identity", choose "from GitHub".
Now enter the username under which you added the SSH key in the [Github](#GitHub) section.
Leave "Allow password authentication over SSH" unchecked.

#### <<< Something about software; the Snaps page >>>
Leave blank. We'll install what we need via scripts.

### Configure Static IP
We _could_ configure the static IP with our Ansible scripts, however since we don't have
full knowledge of the hardware this will be using, or the networks it will be connected
to, it is simpler to stop and this point and simply assign the server a static IP based on
MAC address from your router. Note the address you use, as it will be used later.

At this point you should be able to connect via SSH, so from the machine you selected
earlier (the one(s) for which you uploaded the SSH public key), open a terminal /
Powershell and enter `ssh username@ip-address`. `username` is the username you selected in
[Profile setup](#profile-setup) and `ip-address` can be found by running `ip a` on the
server.

Now that you have an SSH session and a static IP configured, restart the server to make
sure you get your new IP. In your SSH session:

```
sudo reboot
```

### Run the Setup script
Once the server has rebooted, open an SSH session and run the following command to run the
setup script.

```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/JonGanz/server-setup/main/setup.sh)"
```

## Sources
- [Quickly set up GitHub SSH example](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/GitHub-SSH-Key-Setup-Config-Ubuntu-Linux)
- [How to Use Ansible to Automate Initial Server Setup on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-automate-initial-server-setup-on-ubuntu-20-04)
- [How To Set Up an NFS Mount on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04)
