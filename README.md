# CompBio template: R (renv) + Python (Poetry) in separate Dev Containers

## Before to start
1. Modify the `.devcontainer/.env` file with the path for your raw data.

## Quick start (VS Code)
1. Open this repository in VS Code.
2. Command Palette → **Dev Containers: Reopen in Container**
3. Choose either:
   - **project (R + renv)** for Bioconductor/ggplot work
   - **project (Python + Poetry)** for ML/AI work

Both containers mount the same repository, so `data/` and `results/` are shared.

## R workflow (inside R container)
- Initialize renv (first time): `make r-init`
- Restore: `make r-restore`
- Snapshot: `make r-snapshot`
- Smoke test: `make r-check`

## Python workflow (inside Python container)
- Install deps: `make py-install`
- Lock: `make py-lock`
- Smoke test: `make py-check`

## CI
GitHub Actions builds both images and runs smoke tests on push/PR.

