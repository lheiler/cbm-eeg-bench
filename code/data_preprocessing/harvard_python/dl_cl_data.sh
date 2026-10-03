#!/bin/bash
#PBS -qv1_medium72
#PBS -lwalltime=12:00:00
#PBS -lselect=1:ncpus=32:mem=64gb

# Downloads a HEEDB subset from BDSP's S3 bucket (requires approved BDSP AWS credentials).
# Submit from this directory:  qsub dl_cl_data.sh

module load tools/prod
module load awscli

cd "${PBS_O_WORKDIR:-.}"
source ../../../.venv/bin/activate   # created with `uv sync` at the repo root

# Folder holding metadata/ (BDSP CSVs); downloads go to $HARVARD_ROOT/EEG/
export HARVARD_ROOT="${HARVARD_ROOT:-/path/to/harvard-eeg}"

python download_script_500_age.py
