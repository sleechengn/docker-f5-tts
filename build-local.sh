#!/usr/bin/bash

bash build.sh 192.168.13.73:5000/sleechengn/f5-tts:latest
docker push 192.168.13.73:5000/sleechengn/f5-tts:latest
