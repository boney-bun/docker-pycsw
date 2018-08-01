# docker-pycsw

See https://github.com/geopython/pycsw for more information about pycsw
This repo is a modification from https://github.com/rischanlab/pycsw

The pycsw can work independently from the existing system.
You should analyse your database structure and do modifications accordingly.
A good knowledge in PL/pgSQL is required.

To run the docker-pycsw for the first time, simply type:
`make setup-pycsw`

To run the docker-pycsw after turn the server off, you can type:
`make run-pycsw`
