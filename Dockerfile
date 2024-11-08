FROM ghcr.io/swivid/f5-tts:main

VOLUME /opt
VOLUME /root
VOLUME /workspace
ADD ./app.sh /
RUN chmod +x /app.sh
ENTRYPOINT "/app.sh"
