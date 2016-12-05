# Gazebo 7 and gzweb docker

This is a [docker](https://www.docker.com) image that runs a [Gazebo7](http://www.gazebosim.org/) server and the [gzweb](http://gazebosim.org/gzweb) web interface inside a Docker container.  **It's not quite production ready yet** but our goal is to make it super-easy to run the Gazebo simulator and GUI on Windows, Mac, etc. through the wonders of docker.

## Requirements

*  [Docker](https://www.docker.com) including `docker-compose`

## Running

1.  clone this repository
2.  open a shell to the directory containing this README
3.  docker-compose up (this takes a while to build the first time)
4.  Open your browser to http://localhost:8080 to launch

