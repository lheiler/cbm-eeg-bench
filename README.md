# Evaluating Computational Brain Models as Dimensionality Reduction Methods for EEG
**Author:** Lorenz Heiler  
**Supervisors:** Dr. Pedro Mediano, Dr. Gregory Scott  
**Institution:** Imperial College London (MSc Individual Project)

## Project Overview
This thesis benchmarks four families of **Computational Brain Models (CBMs)**—cortico-thalamic, Jansen-Rit, Wong-Wang, and Hopf—as dimensionality reduction tools for clinical EEG. 

These mechanistic models are compared against traditional data-driven baselines, including PCA, spectral autoencoders, EEGNet-style autoencoders, and the catch22 feature set. 

## Key Contributions
* **Unified Benchmark:** A modular pipeline built on the **Temple University Hospital Abnormal EEG Corpus (TUH-AB)** and the **LEMON** dataset, with extensibility to other corpora.
* **Hybrid Approach:** Implementation of **amortized parameter-inference** for the cortico-thalamic model, achieving 78.4% accuracy in abnormality screening while maintaining physiological interpretability.
* **Comparative Analysis:** Evaluation of latent space quality based on dimensionality efficiency, geometry preservation, and information content.

## Quick Start
The environment is managed with [uv](https://docs.astral.sh/uv/) and pinned in `uv.lock`, so every install resolves to exactly the same package versions (Python 3.11).

```bash
# Install uv (once): https://docs.astral.sh/uv/getting-started/installation/
curl -LsSf https://astral.sh/uv/install.sh | sh

git clone https://github.com/lheiler/cbm-eeg-bench.git
cd cbm-eeg-bench
uv sync                      # creates .venv with the locked dependencies

cd code
uv run python main.py --config configs/default.yaml --method ctm_nn_avg
```

Without uv, `pip install -r requirements.txt` (exported from `uv.lock`) installs the same pinned versions.

See the [detailed code README](./code/README.md) for preprocessing, configuration, all extraction methods, outputs, and HPC usage.

## Datasets
The datasets are **not included** in this repository; their data use agreements do not permit redistribution. Obtain them from the original providers, run the matching preprocessing script, and place the outputs under `Datasets/` (ignored by git):

| Dataset | Used for | Access |
|---------|----------|--------|
| **TUH Abnormal EEG Corpus (v3.0.1)** | Abnormality classification (2,993 sessions of clinical EEG) | Free after signing the data use agreement: [isip.piconepress.com](https://isip.piconepress.com/projects/nedc/html/tuh_eeg/) |
| **LEMON** (Leipzig Study for Mind-Body-Emotion Interactions) | Age classification (healthy resting-state EEG) | Openly available: [MPI LEMON](https://fcon_1000.projects.nitrc.org/indi/retro/MPI_LEMON.html) |
| Harvard EEG Database (HEEDB) | Supported, not part of the main benchmark | Credentialed access via [BDSP](https://bdsp.io/) |

```
cbm-eeg-bench/
└── Datasets/
    ├── tuh-eeg-ab-clean/{train,eval}_epochs.pkl
    └── lemon/{train,eval}_epochs.pkl
```

The pre-trained models needed for extraction (CTM regressor, PSD-AE, EEGNet-AE, frozen PCA) are included under `code/latent_extraction/`.

## Repository Structure
* **/code**: Core implementation, model training, and parameter inference.
  * *See the [Detailed Code README](./code/README.md) for execution instructions.*
* **pyproject.toml / uv.lock**: Pinned, reproducible Python environment.
* **final_report.pdf**: The completed thesis document.

## License
The source code is released under the [MIT License](./LICENSE). The thesis document (`final_report.pdf`) is not covered by the MIT License; all rights reserved.
