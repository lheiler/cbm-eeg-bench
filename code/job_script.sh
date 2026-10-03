#!/bin/bash
#PBS -N final_eval
#PBS -q v1_large24
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=64:mem=128gb

# Runs the benchmark for the selected methods. Adjust the PBS queue/resources for your cluster.
# Submit from code/:  qsub job_script.sh

cd "${PBS_O_WORKDIR:-.}"
source ../.venv/bin/activate   # created with `uv sync` at the repo root

# python main.py --method ctm_nn_pc
# python main.py --method ctm_nn_avg
# python main.py --method pca_pc
# python main.py --method pca_avg
# python main.py --method eegnet
# python main.py --method psd_ae_avg
# python main.py --method psd_ae_pc

# python main.py --method c22
python main.py --method jr_avg
python main.py --method jr_pc
python main.py --method wong_wang_avg
python main.py --method hopf_avg
python main.py --method hopf_pc
python main.py --method ctm_cma_avg
