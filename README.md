example

port:7860

```
networks:
  lan13:
    name: lan13
    driver: macvlan
    driver_opts:
      parent: enp6s19
    ipam:
      config:
        - subnet: "192.168.13.0/24"
          gateway: "192.168.13.1"
volumes:
  ft-tts-root:
    name: ft-tts-root
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/f5-tts/root
  ft-tts-opt:
    name: ft-tts-opt
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/f5-tts/opt
  ft-tts-workspace:
    name: ft-tts-workspace
    driver: local
    driver_opts:
      o: bind
      type: none
      device: /opt/apps/f5-tts/workspace
services:
  f5-tts:
    tty: true
    stdin_open: true
    container_name: "f5-tts"
    hostname: "f5-tts"
    image: "sleechengn/f5-tts:latest"
    # restart: always
    environment:
      - TZ=Asia/Shanghai
      - NVIDIA_DRIVER_CAPABILITIES=all
      - NVIDIA_VISIBLE_DEVICES=all
    runtime: nvidia
    volumes:
      - "ft-tts-root:/root"
      - "ft-tts-opt:/opt"
      - "ft-tts-workspace:/workspace"
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
    networks:
      lan13:
        ipv4_address: 192.168.13.61
```
