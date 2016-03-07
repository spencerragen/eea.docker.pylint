# Docker image for Pylint checker

[Pylint](https://www.pylint.org/) is a source code bug and quality checker for the Python programming language. It follows the style recommended by PEP 8, the Python style guide. 

## Supported tags and respective `Dockerfile` links

- [`latest` (*Dockerfile*)](https://github.com/eea/eea.docker.pylint/blob/master/Dockerfile)
- [`1.5.4` (*Dockerfile*)](https://github.com/eea/eea.docker.pylint/blob/1.5.4/Dockerfile)

## Usage

```console
$ docker run --rm -v /path/to/python/code:/code eeacms/pylint
```

## Advanced usage

Change output format to `html`:

```console
$ docker run --rm -v /path/to/python/code:/code eeacms/pylint --output-format=html /code
```

By default this image runs with [this pylint rcfile](https://github.com/eea/eea.docker.pylint/blob/master/pylint.cfg),
but you can provide your own like:

```console
$ docker run --rm \
             -v /path/to/pylint/rcfile.cfg:/etc/pylint.cfg \
             -v /path/to/code:/code \
         eeacms/pylint
```

See `--help` for more options:

```console
$ docker run --rm eeacms/pylint --help
```
