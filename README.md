![HackDepot](https://github.com/cadrspace/hackdepot/blob/master/doc/logo.png)

# HackDepot

Hackspace inventory platform

## Requirements

- Ruby >= 2.2.2
- MongoDB >= 3.x

## Installation

- Install [rvm](http://rvm.io)
- Install ruby through RVM
- Go to the project root
- Change database credentials in **config/mongoid.yml**
- Install the needed gems:
```
$ bundle install
```
- Configure the database:
```
$ rake db:setup
```
- Start the production server:
```
$ export RAILS_ENV=production
$ rails server
```

Alternatively you can use `hackdepot` script that starts the
production service as a daemon.

The application comes with a System V init script `etc/init.debian`
that allows you to start the HackDepot service on the boot and manage
it with the system tools.  Copy the script to `/etc/init.d/hackdepot`
and adjust it to your needs (see the comments in the script).

## Usage

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

Please refer [the official Git book](https://www.git-scm.com/book/)
for details on how to work with Git.

## History

Initial commit

## Roadmap

- Search by tags
- Generate QR code
- Material design

## Credits

- https://github.com/noroot
- https://github.com/cadrspace

## License

GNU GPLv2
