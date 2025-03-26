# Inception Project

## Description

This project sets up a Dockerized environment to host a WordPress website with a MariaDB database and an NGINX web server. The services are orchestrated using `docker-compose`, ensuring proper isolation and configuration for each component.

## Project Structure

```
Makefile
srcs/
	.env
	docker-compose.yml
	requirements/
		mariadb/
			conf/
				mariadb-server.cnf
			Dockerfile
			tools/
				script.sh
		nginx/
			conf/
				nginx.conf
			Dockerfile
		wordpress/
			conf/
				www.conf
			Dockerfile
			tools/
				script.sh
```

### Components

1. **MariaDB**:
   - Hosts the database for WordPress.
   - Configured using 

mariadb-server.cnf

.
   - Initializes the database and user credentials via a custom script.

2. **NGINX**:
   - Acts as a reverse proxy for WordPress.
   - Configured with SSL certificates for secure connections.
   - Uses 

nginx.conf

 for server configuration.

3. **WordPress**:
   - Hosts the WordPress website.
   - Configured with PHP-FPM and initialized using WP-CLI.
   - Automatically installs WordPress, creates an admin user, and sets up a theme.

4. **Makefile**:
   - Simplifies project management with commands like `all`, `clean`, `fclean`, `re`, `up`, and `down`.

## Prerequisites

- Docker
- Docker Compose

## Configuration

### Environment Variables

The 

.env

 file contains the necessary environment variables for the project:

```env
DOMAIN_NAME=dzurita.42.fr

# WordPress Setup
WP_TITLE=InceptionWordpress
WP_ADMIN_USR=lex
WP_ADMIN_PWD=1234
WP_ADMIN_EMAIL=dzurita@student.hive.fi
WP_USR=dzurita
WP_EMAIL=dzurita@42.fr
WP_PWD=1234

# MariaDB Setup
WP_DB_NAME=wordpress_db
WP_DB_USER=wordpress
WP_DB_PWD=1234
MYSQL_ROOT_PASSWORD=pw
MYSQL_HOST=mariadb
```

### Volumes

Persistent data is stored in the following directories:

- `/home/dzurita/data/mariadb`: MariaDB data.
- `/home/dzurita/data/wordpress`: WordPress files.

## Usage

### Makefile Commands

- **`make all`**: Builds and starts the containers. Adds the domain to 

hosts

.
- **`make clean`**: Stops and removes containers, images, and volumes.
- **`make fclean`**: Performs `clean` and deletes persistent data.
- **`make re`**: Rebuilds the entire project from scratch.
- **`make up`**: Starts the containers.
- **`make down`**: Stops the containers.

### Steps to Run

1. Clone the repository.
2. Run `make all` to build and start the containers.
3. Access the WordPress site at `https://dzurita.42.fr`.

## Notes

- Ensure the domain `dzurita.42.fr` is added to your 

hosts

 file.
- SSL certificates are automatically generated for secure connections.
