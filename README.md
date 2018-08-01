# docker-pycsw

## Before Begin

See https://github.com/geopython/pycsw for more information about pycsw.

This repo is a modification from https://github.com/rischanlab/pycsw.

The pycsw can work independently from the existing system.

You should analyse your database structure and do modifications accordingly.

A good knowledge in docker and PL/pgSQL is required.

You need to connect the nginx with docker-pycsw in `docker-compose.yml` file.
Then, doing the migration as defined in update-migrations command in Makefile.

## Pre-Requirement

Add the content of `docker-compose.yml` and Makefile to the existing files accordingly. 


## Running the Docker-pycsw

To run the docker-pycsw for the first time, simply type:

`make setup-pycsw`

To run the docker-pycsw after turn the server off, you can type:

`make run-pycsw`
