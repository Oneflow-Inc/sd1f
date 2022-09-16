set -e

docker run -it --rm --gpus all \
    -v $PWD/outputs/:/app/outputs/ \
    -v $HOME/.cache/huggingface:/root/.cache/huggingface \
    -v $PWD:$PWD \
    -w $PWD \
    --name sd1f-$USER \
    oneflowinc/sd1f:latest bash
