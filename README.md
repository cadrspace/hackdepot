![HackDepot](https://github.com/cadrspace/hackdepot/blob/master/doc/logo.png)

# HackDepot

HackDepot is a service that helps to keep track of things in
community-operated places such as
[hackerspaces](http://hackerspaces.org/).

Though HackDepot has no stable release yet, we're hoping to make the
first release as soon as it gets to the point where it fulfills the
basic needs of [our own hackerspace](http://cadrspace.ru/).

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

## Roadmap

- Make it possible to enable/disable user registration in a
  configuration file.  In addition, implement a way of adding new
  users to the system for an administrator (e.g. by means of a console
  tool on a server and/or through an administrator interface in the
  service itself).

  Rationale: currently the service blocks access to the list of items
  and to items themselves to unauthorized (unauthenticated) users, but
  given the fact that the registration is open for everyone, it's easy
  to circumvent the access control.
- Search by tags
- Generate QR code
- Material design

## Credits

- https://github.com/noroot
- https://github.com/cadrspace

## License

GNU GPLv2
