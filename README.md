# LVLM

This is a code repository of LVLM component for [RAVEN](https://github.com/castacks/RAVEN). It serves two purposes: LVLM-behavior strategy of RAVEN and the standalone FPV+LVLM baseline.

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