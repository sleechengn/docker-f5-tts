#!/usr/bin/bash
bash build.sh test/test
docker run -it --rm test/test
