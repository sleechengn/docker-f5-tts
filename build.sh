#!/usr/bin/bash
if [ -n "$1" ]; then
	docker build $(dirname $0) --file Dockerfile -t $1
else
	docker build $(dirname $0) --file Dockerfile -t sleechengn/f5-tts:latest
fi
