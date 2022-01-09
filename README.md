# PHP & MariaDB Development Container Template
Made from [PHP & MariaDB (Community)](https://github.com/microsoft/vscode-dev-containers/tree/main/containers/php-mariadb)

## Summary

Develop PHP based applications with MariaDB (MySQL Compatible).  Includes necessary extensions and tools for both PHP and MariaDB.

## Description

This definition creates three containers, one for PHP, one for MariaDB and one for Adminer. Code will attach to the PHP container, and from within that container the MariaDB container will be available on **`localhost`** port 3306. The MariaDB instance can be managed via the automatically installed Adminer, or from the container's command line with:

```bash
mariadb -h localhost -P 3306  --protocol=tcp -u root --password=mariadb -D mariadb
```

The default database is called `mariadb` with a `mariadb` user whose password is `mariadb`, and if desired this may be changed in `docker-compose.yml`. Data is stored in a volume named `mariadb-data`. Note that you will **not** be able to access the MariaDB socket, so be sure to specify `--protocol=tcp` when using the command line.

## Using this definition

While the definition itself works unmodified, you can select the version of PHP the container uses by updating the `VARIANT` arg in the included `.devcontainer/docker-compose.yml` (and rebuilding if you've already created the container).

```yaml
build:
  context: .
  dockerfile: Dockerfile
  args:
    VARIANT: "7"
```

### Adding another service

You can add other services to your `docker-compose.yml` file [as described in Docker's documentation](https://docs.docker.com/compose/compose-file/#service-configuration-reference). However, if you want anything running in this service to be available in the container on localhost, or want to forward the service locally, be sure to add this line to the service config:

```yaml
# Runs the service on the same network as the database container, allows "forwardPorts" in devcontainer.json function.
network_mode: service:db
```

### Starting / stopping PHP's built in CLI server

To start CLI server from the container's run command line with
``` bash
php -S 0.0.0.0:8000 -t site/
```
### Starting / stopping Apache

To build container with Apache in addition to the PHP CLI set the appropriate `VARIANT` arg value in `.devcontainer/docker-compose.yml`. *See comments in* `docker-compose.yml`

Then you can start Apache by running:

```bash
apache2ctl start
```
Apache will be available on port `8000` with root directory `site/`.

### Adding the definition to a project

1. If this is your first time using a development container, please see getting started information on [setting up](https://aka.ms/vscode-remote/containers/getting-started) Remote-Containers.

1. Start VS Code and clone this repository.

1. Put your project code into `site` folder.

1. Finally, press <kbd>F1</kbd> and run **Remote-Containers: Reopen in Container**.

## Testing the definition

This definition includes some test code that will help you verify it is working as expected on your system. Follow these steps:

1. If this is your first time using a development container, please follow the [getting started steps](https://aka.ms/vscode-remote/containers/getting-started) to set up your machine.
1. Clone this repository.
1. Start VS Code, press <kbd>F1</kbd>, and select **Remote-Containers: Open Folder in Container...**
1. Select cloned repository folder.
1. Run the script `test-project/test.sh`

## Developing

Once you have your project opened in container, you'll be able to develope it like you would locally.

> **Note:** This container runs as root user by default. Unomment `"remoteUser": "vscode"` in `.devcontainer/devcontainer.json` if you'd prefer to run as non-root user `vscode` with sudo access.

Some things to use:

1. **Edit:**
   - Open `index.php`
   - Try adding some code and check out the language features.
   - Notice that PHP debugging and IntelliSense are already included in the container since the `.devcontainer/devcontainer.json` lists `"felixfbecker.php-debug"`, `"bmewburn.vscode-intelephense-client"`, and `"mrmlnc.vscode-apache"` as extensions to install automatically when the container is created.
1. **Terminal:** Press <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>\`</kbd> and type `uname` and other Linux commands from the terminal window.
1. **Run and Debug:**
   - Open `index.php`
   - Add a breakpoint (e.g. on line 4).
   - Press <kbd>F5</kbd> to launch the app in the container.
   - Once the breakpoint is hit, try hovering over variables, examining locals, and more.
1. **Running a server:**
   - From the terminal, run `php -S 0.0.0.0:8000 -t site/`
   - Click "Open in Browser" in the notification that appears to access the web app on this new port.
   - You can view an organized table of your forwarded ports in the `Ports` view on the bottom panel.
   - Look back at the terminal, and you should see the output from your site navigations.
   - Edit the text in `index.php` and refresh the page to see the changes immediately take effect.
1. **Attach debugger to the server:**
   - Follow the previous steps to start up a PHP server and open a browser on port `8000`
   - Press <kbd>F1</kbd> and select the **View: Show Debug** command.
   - Pick "Listen for XDebug" from the dropdown.
   - Press <kbd>F5</kbd> to attach the debugger.
   - Add a breakpoint to `index.php` if you haven't already.
   - Reload your browser window and switch to vscode
   - Once the breakpoint is hit, try hovering over variables, examining locals, and more.

## License

Copyright (c) Microsoft Corporation. All rights reserved.<br />
Licensed under the MIT License. See [LICENSE](https://github.com/microsoft/vscode-dev-containers/blob/main/LICENSE).
