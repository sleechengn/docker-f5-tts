from ubuntu:jammy

run apt update \
        && apt install -y curl git wget nano aria2

run cd /root \
        && wget https://astral.sh/uv/install.sh \
        && bash install.sh \
	&& rm -rf /root/install.sh

run . /root/.local/bin/env \
        && uv venv /opt/venv --python 3.10 --seed \
        && . /opt/venv/bin/activate

run set -e \
        && . /root/.local/bin/env \
        && . /opt/venv/bin/activate \
	&& uv pip install torch==2.3.0+cu118 torchaudio==2.3.0+cu118 --extra-index-url https://download.pytorch.org/whl/cu118

run set -e \
        && . /root/.local/bin/env \
        && . /opt/venv/bin/activate \
        && cd /opt \
	&& git clone https://github.com/SWivid/F5-TTS.git \
	&& cd F5-TTS \
	&& git submodule update --init --recursive \
	&& pip install -e .

volume /root/.local
volume /root
volume /opt/venv
volume /workspace
add ./docker-entrypoint.sh /
run chmod +x /docker-entrypoint.sh
entrypoint ["/docker-entrypoint.sh"]
