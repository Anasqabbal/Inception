
- [Problemes that docker comes to solve](problemes.md)

# DOCKER
# Definition
it is platform designed to simplify the process of developing shipping and ruuning apps using the containerization. think of it is like a bundle that contains all dependencies that your apps need to run.


# containerization vs virtualization
both are technologies for running isolated applications.

## Virtualization
creates complete virtual machine that include a full operating system. a hypervisor((the software that allows one machine to run multiple VMs by  manages the Hardware resources of the physical machine like (CPU, GPU, Network, RAM, SSD HHD, MONITOR... ))) sits between the hoste OS and VMs. and providing the isolated environment to run your new virtual machine.

VMs are completely isolated from each other and the host
there are another type of HyperVisor that can installed directley on the sever without Host OS. called the HyperVisor-Type1

Each VM contains the whole OS

## Containerization
contianers shares the same host system's kernel. making them faster and more resource-efficient.
examples of the platforms that can run the containers is the DOCKER.

containers must be packaged to work with the same OS of the server.

# inside this page you will discover
- [Common Terms](#common-terms)
- [Prepare the Makefile](#preparing-the-makefile)
- [Common commands](#common-commands)

# common terms
- [image in containerization](#docker-image)
- [container in containerization](#docker-container)
- [Docker file](#docker-file)
- [container engine](#container-engine)
- [application](#application)
- [Docker compose](#Docker-compose)

## docker image
docker image it is like a blueprint or recipe that contains all necessary information to creat a docker container
- images can inherit from multiple base images 
- images does't have a state and never change
- a dockerfile c contains one image
- docker-compose can contains multiple images

## docker container
a container is an application that 's been packeged with all its dependencies

- is a runtime instance of an image
- image + execution environment + runtime instructions
- docker containers define a standard to ship software

## container engine
the container engine is what unpacks the container files and hands them off to the OS kernel. 

## Docker file 
if a file responsible for configuraion. it specifies the set of software that we want to deploy inside a given container.
### Docker file format
![basic commands](./BasicDockerCommands.png)

## application
is the actual software or service designed to perform tasks.

## docker-compose
is a tool for defining and runnig multi-container docker applications. with compose you can use YAML (Stands for Yet Another Markup Language, it is data serialization language) fle to configure your applicaion's services
service == container.

### syntax
![Docker-compose](./Docker-compose.png)

version : wich syntash should be used.  can written in the format "x.x".
services: you can group here a set of services that you want to run.
each service can have
`
	services:
		image: name of the service
		port
`



the containter is a set or processes that have a grouping of resources specifically assigned to it

docker : to see the available commands
docker pull : pull the docker image from the Docker Hub
docker build : creats a docker image from the Dockerfile

# Preparing the Makefile 
inside our Makefile we can define multiple targets.

build:
down:
clean:
fclean:
re:

# common commands
- [Docker commands](#docker-commands)
- [docker file commands](#common-command-for-dockerfile)
- [docker compose commands](#docker-compose-commands)
## docker commands
- `docke` : print the neccessary command on the docker
- `docker pull `  downloads an image from a docker registry to you local machin
- `docker build`  builds a new docker image from a dockerfile
- `docker images ` lists all docker images stord on your local machine

## docker compose commands
- `docker-compose up` start a container
	- -d (detachec)
	- --build (rebuild images)
- `docker-compose down` stop and remove a container
- `docker-compose pause` : pause running containers of a service
- `docker-compose unpause` : unpause paused containers of a service
- `docker-compose ps` : lists containers
	- -v (remove volumes)
	- --rmi all (remove all images)
- `docker compose up -d` : launching a container in docker-compose
- `docker compose build` : rebuild images without starting 

## common command for dockerfile

## common commands for Docker-compose


