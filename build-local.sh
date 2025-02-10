#!/usr/bin/bash

docker build $(dirname $0) --file Dockerfile -t 192.168.13.73:5000/sleechengn/f5-tts:latest
docker push 192.168.13.73:5000/sleechengn/f5-tts:latest
