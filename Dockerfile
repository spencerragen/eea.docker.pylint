FROM python:2-alpine
MAINTAINER "EEA: IDM2 A-Team" <eea-edw-a-team-alerts@googlegroups.com>

ENV PYLINT_VERSION=1.5.4

RUN pip install pylint==$PYLINT_VERSION

COPY pylint.cfg /etc/pylint.cfg

ENTRYPOINT ["pylint", "--rcfile", "/etc/pylint.cfg"]
CMD ["/code"]
