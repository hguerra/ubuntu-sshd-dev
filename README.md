# ubuntu-sshd-dev

Dockerized SSH service, built on top of [official Ubuntu](https://registry.hub.docker.com/_/ubuntu/) images.

## Image tags

- heitorcarneiro/ubuntu-sshd:18.04 (bionic)

## Installed packages

Base:

- [Bionic (18.04) minimal](http://packages.ubuntu.com/bionic/ubuntu-minimal)

Image specific:
- [openssh-server](https://help.ubuntu.com/community/SSH/OpenSSH/Configuring)
- openssh-client
- sudo
- vim
- inotify-tools
- openssl
- python
- python-setuptools

Config:

  - `PermitRootLogin yes`
  - `UsePAM no`
  - exposed port 22
  - default command: `/usr/sbin/sshd -D`
  - root password: `root`

## Run example

```sh
# Option 1
$ docker run -d -P --rm --name ubuntu heitorcarneiro/ubuntu-sshd-dev:18.04
$ docker port ubuntu 22
  0.0.0.0:49154

# root password is "root"
# vagrant password is "vagrant"
$ ssh root@localhost -p 49154
$ ssh vagrant@localhost -p 49154
```

```sh
# Option 2
# Using vagrant keys https://github.com/hashicorp/vagrant/blob/master/keys/vagrant
$ docker run -d -p "4444:22" --rm --name ubuntu heitorcarneiro/ubuntu-sshd-dev:18.04
$ ssh -o StrictHostKeyChecking=no vagrant@localhost -p 4444 -i ./keys/vagrant
```

## Security

If you are making the container accessible from the internet you'll probably want to secure it bit.
You can do one of the following two things after launching the container:

- Change the root password: `docker exec -ti test_sshd passwd`
- Don't allow passwords at all, use keys instead:

```bash
$ docker exec test_sshd passwd -d root
$ docker cp file_on_host_with_allowed_public_keys test_sshd:/root/.ssh/authorized_keys
$ docker exec test_sshd chown root:root /root/.ssh/authorized_keys
```

## Issues

If you run into any problems with this image, please check (and potentially file new) issues on the [heitorcarneiro/ubuntu-sshd](https://github.com/heitorcarneiro/ubuntu-sshd/issues) repo, which is the source for this image.
