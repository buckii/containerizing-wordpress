# Docker Environment

This directory contains everything needed to build a working docker environment
using Vagrant on Mac OS.

## Starting the VM

You will need to install Vagrant, Virtualbox, and Ansible.  You can use
homebrew and homebrew cask to install these easily.  You will also need
the following plugins:

* vagrant-bindfs
* vagrant-hostmanager

You will be prompted to install them if they are missing.

Then simply run:

```
vagrant up
```

To start the environment.  You will be prompted to run `vagrant reload` once or
twice the first time you start the machine.  Docker requires changes to the
kernel, which requires reboots to take effect.

Once the machine is running, use `vagrant ssh` to connect to it.

## Running docker commands

Once you have connected to the VM (`vagrant ssh`) you will be able to run
`docker`.  Give it a try!

This directory is available inside the VM at `/vagrant`.  The following
commands should be run from this directory on the VM.

## Building the images

You will need to build a few images to get WordPress running.

### Ubuntu Ansible base image

`cd /vagrant`, then run:

```
packer build ubuntu-ansible.json
```

This will take a few minutes to complete.  Once it is done you can run `docker
images` to verify the image was created.

### PHP-FPM and Nginx image

After building the Ubuntu Ansible base image, run:

```
packer build php-fpm-nginx.json
```

This will take a few minutes to complete.  Once it is done you can run `docker
images` to verify the image was created.

## Starting the images

Create the data volume with:

```
./create-db-data-volume.sh
```

Create the network with

```
./create-wordpress-network.sh
```

Start the web container:

```
./start-web.sh
```

Start the db container:

```
./start-db.sh
```

Verify everything is running:

```
docker ps
```

Then head to http://docker.dev:8080 to see WordPress!
