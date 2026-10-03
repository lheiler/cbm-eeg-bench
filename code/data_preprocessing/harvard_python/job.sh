#!/bin/bash
#PBS -lwalltime=10:00:00
#PBS -lselect=1:ncpus=32:mem=32gb

# Cleans a downloaded HEEDB BIDS subset.
# Submit from this directory:  qsub job.sh

cd "${PBS_O_WORKDIR:-.}"
source ../../../.venv/bin/activate   # created with `uv sync` at the repo root

# Folder holding metadata/ (BDSP CSVs) and EEG/ (downloaded BIDS data)
export HARVARD_ROOT="${HARVARD_ROOT:-/path/to/harvard-eeg}"

python clean_data.py
