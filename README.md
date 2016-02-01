## Synopsis
Ovirt-developer aims to lower the bar for getting started with developing for ovirt with focus on ovirt-engine. Using `docker-compose` a complete dev env should be ready, with an IDE, database, the project's git repo. It will make contribution much easier, New team members setup in zero time, and can act as the defacto live documentaion of getting an dev env up and running.

## Go, develop!
To get you started, simply spin the compsed docker up:
```
$ # share you xsession, run once
$ xhost +
$ docker-compose build
$ docker-compose run developer intellij
```

### What you get:
- 3 differnt docker container, 1 for the OS (Fedora 23) with ovirt-engine-jboss + jdk8 + git + mvn, 1 postgres on Centos and 1 data container exposing the db data folder. This give you enough flexibility to switch/upgrade components without problems (and also aligned with docker's principles)
- Your ovirt-engine repo located at `/home/ovirt/src`
- Empty database reachable at hostname `db`, accesible with no password. It needs the inital setup (may change later)
  ```$ psql -h db engine engine ```
- Intellij IDEA 15 community edition
  ```$ intellij &```

## In depth

Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Motivation
TODO
A short description of the motivation behind the creation and maintenance of the project. This should explain **why** the project exists.

## Installation
TODO-continue
The installation will pull and build few images on your machines, reuse your xsession socket, and mount your ovirt-engine git repository so every change made inside the container will be persisted out side of it. Alternatively this can be changed, we'll get that later.
So make sure you have few free Gb to for the images. Docker saves its images under /var/lib/docker. Personnaly I quickly ran out of space on / so my /var/lib/docker a symlink to /home/user/docker. Change it and restart docker service, your done.

I also had technical issues with the docker storage driver and switch to the overlay fs (recommended). Do that with:
  ```
  $ root@localhost cat /etc/sysconfig/docker-storage
  $ root@localhost DOCKER_STORAGE_OPTIONS=--storage-driver overlay
  ```

Initiate a `docker-compose up` command, it will build all containers and run them. Consecutive calls will run it wihout building (follow docker-compose docs).


## API Reference
TODO
Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.

## Tests
TODO
Describe and show how to run the tests with code examples.

## Contributors

* **Author** - rgolan@redhat.com
* **irc** - #ovirt at irc.oftc.net
* **mailing list** - devel@ovirt.org
* **issue tracker** - [report here](https://github.com/rgolangh/ovirt-developer/issues)

## License

A short snippet describing the license (MIT, Apache, etc.)
