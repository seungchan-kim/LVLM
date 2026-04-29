# LVLM

This repository contains the LVLM component for [RAVEN](https://github.com/castacks/RAVEN). It serves two purposes: (1) the LVLM-based behavior strategy used in RAVEN, and (2) the standalone FPV + LVLM baseline.

## Docker Setup

    cd ~/RAVEN/LVLM
    docker build -t lvlm .

## Caching Pretrained Models into the Docker Image (Recommended)

If you start the Docker container and run `baseline.py` for the first time, 

    cd ~/RAVEN/LVLM
    ./run_lvlm_docker.sh

the required pretrained models will be downloaded automatically. To avoid downloading them again every time you start a fresh container, we recommend caching these files into the Docker image. Run the following command **outside the container**:

    docker commit <container_id> lvlm:latest

This will save the downloaded pretrained models inside the existing `lvlm:latest` Docker image.

## Run LVLM-Guided Search Behavior

Follow the instructions in [RAVEN](https://github.com/castacks/RAVEN/blob/main/README.md).

## Run FPV + LVLM Baseline

This setup requires AirStack for simulation and the autonomy stack, as well as a RayFronts container for input prompting.

Start AirStack following the instructions in the[RAVEN README](https://github.com/castacks/RAVEN/blob/ea742b6843a40b82af7fa1ee37a99b2fe93a70a4/README.md?plain=1#L77).

Then start a RayFronts container:

    cd ~/RAVEN/RayFronts
    ./run_docker.sh

Alternatively, if a RayFronts container is already running, you can enter it with:

    docker exec -it rayfronts_container bash

Finally, inside the LVLM container, run:

    python3 baseline.py