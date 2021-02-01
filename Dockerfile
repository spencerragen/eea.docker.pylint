FROM python:3

ENV PYLINT_VERSION=2.6.0

RUN pip install --upgrade pip \
    && pip install pylint==$PYLINT_VERSION \
    && mkdir -p /code

COPY pylint.cfg /etc/pylint.cfg
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["pylint"]
