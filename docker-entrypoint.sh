#!/usr/bin/bash

source /root/.local/bin/env
source /opt/venv/bin/activate

f5-tts_infer-gradio --port 7860 --host 0.0.0.0
