# Docker image for Pylint checker

[Pylint](https://www.pylint.org/) is a source code bug and quality checker for the Python programming language. It follows the style recommended by PEP 8, the Python style guide. 

## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.pylint/blob/master/Dockerfile)
- [`1.7.2` (*Dockerfile*)](https://github.com/eea/eea.docker.pylint/blob/1.7.2/Dockerfile)

## Usage

    $ docker run --rm -v /path/to/python/code:/code eeacms/pylint

or

    $ docker run --rm eeacms/pylint https://github.com/eea/eggmonkeytest.git

## Advanced usage

Change output format to `json`:

    $ docker run --rm -e PARAMS="--output-format=json" eeacms/pylint https://github.com/eea/eggmonkeytest.git


By default this image runs with [this pylint rcfile](https://github.com/eea/eea.docker.pylint/blob/master/pylint.cfg),
but you can provide your own like:


    $ docker run --rm -v /path/to/pylint/rcfile.cfg:/etc/pylint.cfg \
             eeacms/pylint https://github.com/eea/eggmonkeytest.git


See `--help` for more options:

    $ docker run --rm eeacms/pylint --help
