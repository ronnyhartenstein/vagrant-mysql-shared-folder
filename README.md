vagrant-mysql-shared-folder
===========================

Vagrant box with Ubuntu 14.04 LTS and MySQL 5.6, where the database data stays on the host and is mounted as VirtualBox shared folder as user mysql.

Startup
-------

Just point your own mysql directory in `Vagrantfile`:

``
config.vm.synced_folder "/path/on/you/machine/to/mysql/data", "/var/lib/mysql/vagrant", id: "mysql", [...]
``