#!/usr/bin/bash
mkdir -p /opt/tmp
cp -ra . /opt/tmp/f5-tts-build
pushd /opt/tmp/f5-tts-build
rm -rf .git
sed -i 's,from\subuntu\:jammy,from 192.168.13.73:5000/ubuntu:jammy,g' Dockerfile
bash build.sh 192.168.13.73:5000/sleechengn/f5-tts:latest
docker push 192.168.13.73:5000/sleechengn/f5-tts:latest
popd
rm -rf /opt/tmp/f5-tts-build
