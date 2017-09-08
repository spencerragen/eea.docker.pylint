#!/bin/sh
set -e

CMD="$1"

if [[ ${CMD:0:4} = "http" ]]; then
  GIT_SRC=$1
  CMD="pylint"
fi

if [[ ${CMD:0:3} = "git" ]]; then
  GIT_SRC=$1
  CMD="pylint"
fi

if [ ! -z "$GIT_SRC" ]; then
  cd /code
  git clone $GIT_SRC
fi

if [[ ${CMD:0:1} = "-" ]]; then
  exec pylint "$@"
fi

if [ "$CMD" = "pylint" ]; then
  find -L /code $CUSTOM_FIND -name [eE]xtensions -prune -o -name skins -prune -o -name interfaces.py -prune -o -name "*.py" -print | xargs pylint $PARAMS --rcfile /etc/pylint.cfg
  # Check interfaces.py
  PYIFACES=$(find -L /code -name "interfaces.py" -print)
  if [ "$PYIFACES" != "" ]; then
    pylint --rcfile /etc/pylint.cfg --disable=E0211,E0213 $PARAMS_IFACES $PYIFACES
  fi
else
  exec "$@"
fi
