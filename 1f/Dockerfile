# original source: https://github.com/CompVis/stable-diffusion/pull/134/files
FROM python:3.8-slim
COPY . /app/
RUN mkdir /app/outputs/
RUN mkdir /app/weights/

RUN --mount=type=cache,id=apt-dev,target=/var/cache/apt \
    apt update && apt install -y wget
RUN wget --progress=bar:force:noscroll "https://github.com/DagnyT/hardnet/raw/master/pretrained/train_liberty_with_aug/checkpoint_liberty_with_aug.pth" -P /root/.cache/torch/hub/checkpoints/checkpoint_liberty_with_aug.pth
# and now just grab the weights as well
RUN wget --progress=bar:force:noscroll "https://www.googleapis.com/storage/v1/b/aai-blog-files/o/sd-v1-4.ckpt?alt=media" -P weights/sd-v1-4.ckpt
RUN --mount=type=cache,id=apt-dev,target=/var/cache/apt \
    apt update && apt install -y wget git libglib2.0-0 libsm6 libxext6 libxrender-dev
RUN apt clean && rm -rf /var/lib/apt/lists/*
# RUN useradd -ms /bin/bash stablediff
# install conda
RUN wget --progress=bar:force:noscroll \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh \
    && echo PATH="/root/miniconda3/bin":$PATH >> .bashrc
RUN chmod +x /root/miniconda3/bin/conda
RUN ln -s /root/miniconda3/bin/conda /usr/local/bin/conda
RUN conda update -y conda
# RUN git clone https://github.com/CompVis/stable-diffusion.git /app/
WORKDIR /app/
RUN conda env create -f /app/environment.yaml -n ldm
# conda env trick
RUN rm /usr/local/bin/python
RUN ln -s /root/miniconda3/envs/ldm/bin/python /usr/local/bin/python
