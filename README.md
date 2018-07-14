# Wordpress on Docker

Docker enviroment setup to install wordpress and develop wordpress plugins 
using Docker.

> Wordpress on Docker is heavenly influenced and inspired by [Vessel][vessel]

## Requirements
- You need the latest version of [Docker][docker] to be installed on your machine.
- [Docker Compose][docker-compose] is also required. 
If you installed docker using [Docker for Mac][docker-mac], [Docker for Windows][docker-windows] or [Docker Toolbox][docker-toolbox], then you already have Docker Compose.


## Installation

Clone the repository, add `.env` file, 
and run the script [wpdocker](./wpdocker) with the argument `init` as the following:
```bash
git clone https://github.com/alhoqbani/wpdocker.git
cd wpdocker
cp .env.example .env
bash wpdocker init
```
The script will build docker images and install wordpress. Visit the site at http://localhost:8080

By default the docker containers will share port 8080 for the web server and port 33306 for mysql server.
If you have any server running on any of these ports, 
change them in the `.env` as this will prevent containers from running.

To check if the containers are running run `./wpdocker` without any arguments,
and you should see to containers up and running.

## Usage
TODO

## Plugin Development
TODO

.

.

.

#### Add Existing plugins
To add *your* plugin to the wordpress installation, 
and assuming your plugin is on Github:
```bash
git submodule add -f https://github.com/<username>/<repo>.git src/wp-content/plugins/<plugin-name>
```

#### Testing Plugins
wpdocker can prepare your plugin testing environment utilizing the WP-CLI `scaffold plugin-tests` command.

Make your sure your plugin is located at `src/wp-content/plugins` and run the following command:
```bash
./wpdocker test-install <plugin-name>
```

This command will run `wp scaffold plugin-tests` passing testing database information located in `.env` file.

It will also run the script `install-wp-tests.sh`  which will download a fresh Wrodpress installation 
and the Wordpress testing framework to the [tmp](./tmp) directory.


### Credits
The script and most of docker files are derived from the work of 
[fideloper](https://github.com/fideloper) in [Vessel][vessel]
with some adjustment to work with wordpress.


[vessel]:[https://vessel.shippingdocker.com/]
[docker]:[https://docs.docker.com/install/]
[docker-compose]:[https://docs.docker.com/compose/install/]
[docker-mac]:[https://docs.docker.com/docker-for-mac/install/]
[docker-windows]:[https://docs.docker.com/docker-for-windows/install/]
[docker-toolbox]:[https://docs.docker.com/toolbox/overview/]
[fideloper]:[https://github.com/fideloper]
