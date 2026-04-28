FROM ros:humble-ros-base

ENV TRANSFORMERS_CACHE=/app/cache/huggingface
WORKDIR /app

# Install git, curl, python3-pip, build tools
RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    python3-opencv \
    build-essential \
    ros-humble-cv-bridge \
    && rm -rf /var/lib/apt/lists/*

# Copy your application
COPY . /app

# Install Python packages (LVLM, torch, transformers, etc.)
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir \
        "numpy<2" \
        torch==2.9.1 \
        transformers \
        accelerate \
        bitsandbytes \
        pillow \
        opencv-python

SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Default command
CMD ["/bin/bash"]
