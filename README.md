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

## Deployment and serving
Deplpoyment routine made with [Capistrano](http://capistranorb.com).

- Deploy to `environment` server where environment is configured
environment

```
$ cap [production] deploy
```

- Restart server

```
$ cap production service:restart
```

will restart rails application server

Serving by default implemented with nginx, with custom capistrano tasks which is
generating configuration for nginx to `shared` directory on remote
server.

- Generate nginx configuration by template

```
$ cap production config:upload
```

will upload all necessary configuration files to `shared`, from you
can symlink it to whereever you need on you server.

Nginx configuration symlinked to (on debian based)
`/etc/nginx/sites-enabled/hackdepot.conf`

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

- https://github.com/noroot
- https://github.com/cadrspace

## License

GNU GPLv2
