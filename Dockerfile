# Start of Selection
# FROM nvidia/cuda:12.2.2-devel-ubuntu22.04
FROM nvcr.io/nvidia/ai-workbench/python-cuda122:1.0.3

ENV LANG=C.UTF-8 \
    # python:
    PYTHONFAULTHANDLER=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    # pip
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    # poetry
    POETRY_VERSION=1.8.3

# Start Generation Here
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/* /tmp/* \
    && pip install "poetry==$POETRY_VERSION"

# Set the working directory
WORKDIR /app

ARG oh_my_zsh=false
RUN if ${oh_my_zsh}; \
    then sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -p git -p https://github.com/zsh-users/zsh-autosuggestions -t robbyrussell ; \
    else echo "Skipping oh-my-zsh installation" ; \
    fi

# Copy the poetry.lock and pyproject.toml files
COPY pyproject.toml ./

COPY Makefile ./Makefile

ARG build=build
ENV PATH="/usr/local/bin/poetry:${PATH}"
RUN poetry config virtualenvs.create false
RUN pip install -U pip setuptools
RUN poetry install --all-extras
## poetry config virtualenvs.create false 
## && \
##    make ${build}

# Copy the rest of the application code
COPY . .