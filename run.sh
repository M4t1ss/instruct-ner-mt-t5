#!/bin/bash

export NUM_GPUS_PER_NODE=$(nvidia-smi --query-gpu=name --format=csv,noheader | wc -l)

sleep 90

python_cmd="t5-tune.py"

deepspeed --num_nodes=1 --num_gpus=$NUM_GPUS_PER_NODE $python_cmd --deepspeed --deepspeed_config ds_config.json
