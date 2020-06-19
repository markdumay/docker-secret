# docker-secret

<!-- Tagline -->
<p align="center">
    <b>Create A Docker Secret With User Prompt</b>
    <br />
</p>


<!-- Badges -->
<p align="center">
    <a href="https://github.com/markdumay/docker-secret/commits/master" alt="Last commit">
        <img src="https://img.shields.io/github/last-commit/markdumay/docker-secret.svg" />
    </a>
    <a href="https://github.com/markdumay/docker-secret/issues" alt="Issues">
        <img src="https://img.shields.io/github/issues/markdumay/docker-secret.svg" />
    </a>
    <a href="https://github.com/markdumay/docker-secret/pulls" alt="Pulls">
        <img src="https://img.shields.io/github/issues-pr-raw/markdumay/docker-secret.svg" />
    </a>
    <a href="https://github.com/markdumay/docker-secret/blob/master/LICENSE" alt="License">
        <img src="https://img.shields.io/github/license/markdumay/docker-secret.svg" />
    </a>
</p>

<!-- Table of Contents -->
<p align="center">
  <a href="#about">About</a> •
  <a href="#built-with">Built With</a> •
  <a href="#prerequisites">Prerequisites</a> •
  <a href="#usage">Usage</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#credits">Credits</a> •
  <a href="#donate">Donate</a> •
  <a href="#license">License</a>
</p>


## About
Docker is a popular platform to package software into so-called [containers][docker_container]. Each container is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries, and settings. The Docker engine is available for many operating systems, including Linux and Windows. Since Docker 1.13, you can use *Docker secrets* to manage sensitive data that a container needs at runtime. Examples are usernames, passwords, and API keys. 

Docker secrets are a feature of *Docker Swarm*. The secrets are stored in an encrypted Raft log and are replicated across the other swarm nodes if any. When you grant a newly-created or running service access to a secret, the decrypted secret is mounted into the container as an in-memory filesystem. The location of the mount point within the container defaults to `/run/secrets/<secret_name>` in Linux containers. *Docker-secret* is a Unix shell script that ensures data to create a Docker secret is read from a user prompt. This prevents sensitive data to be visible in the console logs.

<!-- TODO: add tutorial deep-link 
Detailed background information is available on the author's [personal blog][blog].
-->

## Built With
The project uses the following core software components:
* [Docker][docker_url] - Container platform (including Swarm)

## Prerequisites
Docker-secret works on any machine capable of running a standard Unix shell. The host needs to have Docker installed and needs to be initialized as Docker Swarm manager.

## Usage
*Docker-secret* can be invoked from the Unix shell command line as such:
```
./create_secret.sh [OPTIONS] SECRET
```
`SECRET` is the name of the Docker Secret. The script supports the following options. All options are passed to `docker secret create`.

| Option | Alias               | Argument | Description     |
|--------|---------------------|----------|-----------------|
| `-d`   | `--driver`          | `string` | Secret driver   |
| `-l`   | `--label`           | `list`   | Secret labels   |
| `-d`   | `--template-driver` | `string` | Template driver |


## Contributing
1. Clone the repository and create a new branch 
    ```
    $ git checkout https://github.com/markdumay/docker-secret.git -b name_for_new_branch
    ```
2. Make and test the changes
3. Submit a Pull Request with a comprehensive description of the changes

## Credits
*Docker-secret* is inspired by the following code snippet:
* Susam Pal - [How to get a password from a shell script without echoing][script_source]

## Donate
<a href="https://www.buymeacoffee.com/markdumay" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/lato-orange.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;"></a>

## License
<a href="https://github.com/markdumay/docker-secret/blob/master/LICENSE" alt="License">
    <img src="https://img.shields.io/github/license/markdumay/docker-secret.svg" />
</a>

Copyright © [Mark Dumay][blog]



<!-- MARKDOWN PUBLIC LINKS -->
[docker_url]: https://docker.com
[docker_container]: https://www.docker.com/resources/what-container
[script_source]: https://stackoverflow.com/a/28393320

<!-- MARKDOWN MAINTAINED LINKS -->
<!-- TODO: add blog link
[blog]: https://markdumay.com
-->
[blog]: https://github.com/markdumay
[repository]: https://github.com/markdumay/docker-secret.git