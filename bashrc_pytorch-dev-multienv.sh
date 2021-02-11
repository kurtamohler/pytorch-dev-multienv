#!/bin/bash

# Add pytorch-dev-multienv scripts to path
export PATH="$PATH:$PYTORCH_DEV_MULTIENV_PATH/scripts"

# Add alias for activating a PyTorch environment
alias activate-pytorch="source $PYTORCH_DEV_MULTIENV_PATH/scripts/activate-pytorch-dev.sh"

# Add auto tab completion of environment names for activate-pytorch
_activate_pytorch_completion()
{
    local curr_arg;
    curr_arg=${COMP_WORDS[COMP_CWORD]}

    local CONDA_ENVS=$(conda env list | awk '{print $1}' | sed 's/^\#*//g' | grep -v '^$' | paste -sd ' ')

    COMPREPLY=( $(compgen -W "$CONDA_ENVS" -- $curr_arg));
}
complete -o default -F _activate_pytorch_completion activate-pytorch

