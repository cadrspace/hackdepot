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
- Start the server:
```
$ rails s
```

## Usage

-- 

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
