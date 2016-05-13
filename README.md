![HackDepot](https://github.com/cadrspace/hackdepot/blob/master/doc/logo.png)

# HackDepot

HackDepot is a service that helps to keep track of things in
community-operated places such as
[hackerspaces](http://hackerspaces.org/).

Though HackDepot has no stable release yet, we're hoping to make the
first release as soon as it gets to the point where it fulfills the
basic needs of [our own hackerspace](http://cadrspace.ru/).

## Requirements

- [Ruby](https://www.ruby-lang.org/) 2.2.2 or later
- [MongoDB](https://www.mongodb.com/) 3.x

## Installation

- Install [rvm](https://rvm.io)
- Install ruby through RVM
- Go to the project root directory.
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
$ RAILS_ENV=production rails server
```

Alternatively you can use `hackdepot` script that starts the
production service as a daemon.

The application comes with a System V init script `etc/init.debian`
that allows you to start the HackDepot service on the boot and manage
it with the system tools.  Copy the script to `/etc/init.d/hackdepot`
and adjust it to your needs (see the comments in the script).

## Deployment and serving

Deployment routine is made with [Capistrano](http://capistranorb.com).

- Deploy to a server using a configured environment.  Eg. for
deploying to a production server use `production` environment:

```
$ cap production deploy
```

- Restart the server:

```
$ cap production service:restart
```

will restart the rails application server.

Serving by default implemented with nginx, with custom capistrano
tasks that are generating configuration for nginx to `shared`
directory on the remote server.

- Generate a nginx configuration by a template:

```
$ cap production config:upload
```

will upload all the necessary configuration files to `shared`, from
you can symlink it to whereever you need on your server.

On the Debian GNU/Linux based distributions the Nginx configuration is
symlinked to `/etc/nginx/sites-enabled/hackdepot.conf`.

## Usage
Empty

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

Please refer [the official Git book](https://www.git-scm.com/book/)
for details on how to work with Git.

## Credits

- [Noroot](https://github.com/noroot)
- [CADR Hackerspace](https://github.com/cadrspace)

## License

HackDepot is free software; it is distributed under terms of GNU
General Public License as published by the Free Software Foundation,
version 2 of the License.  See `LICENSE` file for the full text of the
license.
