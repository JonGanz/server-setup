# Server Setup

The purpose of this repo is to make the setting up, and restoring of my personal home
server and quick, repeatable, and painless as possible. We'll start small and build out
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
Skip for now.

#### SSH Setup
Chose to "Install OpenSSH server". Then under "Import SSH identity", choose "from GitHub".
Now enter the username under which you added the SSH key in the [Github](#GitHub) section.
Leave "Allow password authentication over SSH" unchecked.

#### <<< Something about software; the Snaps page >>>
Leave blank. We'll install what we need via scripts.

### Run the Setup script
Now that the server is up and running, you should be able to SSH into it from the machine
you selected earlier (the ones for which you uploaded the SSH public key). From there,
open a terminal / Powershell and enter `ssh username@ip-address`, where username was
selected in [Profile setup](#Profile setup) and `ip-address` can be found by running
`ip a` on the server (we'll get this fixed up shortly).

After connecting, run the following command to run the setup script.

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JonGanz/server-setup/main/setup.sh)"
```

## Sources
- [Quickly set up GitHub SSH example](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/GitHub-SSH-Key-Setup-Config-Ubuntu-Linux)
- [How to Use Ansible to Automate Initial Server Setup on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-automate-initial-server-setup-on-ubuntu-20-04)

