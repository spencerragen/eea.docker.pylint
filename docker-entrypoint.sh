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
  if [ ! -z "$GIT_NAME" ]; then
     if [ -z "$GIT_BRANCH" ]; then
       GIT_BRANCH="master"
     fi
     cd $GIT_NAME
     if [ ! -z "$GIT_CHANGE_ID" ]; then
        GIT_BRANCH=PR-${GIT_CHANGE_ID}
        git fetch origin pull/$GIT_CHANGE_ID/head:$GIT_BRANCH
     fi
     git checkout $GIT_BRANCH
     cd /code
  fi
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
