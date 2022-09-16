set -e

docker run -it --rm --gpus all \
    -v $PWD/outputs/:/app/outputs/ \
    -v $HOME/.cache/huggingface:/root/.cache/huggingface \
    -v $PWD:$PWD \
    -w $PWD \
    oneflowinc/sd1f:latest bash
