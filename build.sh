#!/usr/bin/bash

docker build $(dirname $0) --file Dockerfile -t sleechengn/f5-tts:latest
