# pytorch-dev-multienv
Manage multiple environments for PyTorch contribution development

## Prerequisites

pytorch-dev-multienv has only been tested on a Quansight qgpu machine with CUDA
and other dependencies already installed. At the moment, it is not likely to
work anywhere else. In the future, I plan to generalize the tool so more people
can use it.

## Installation

Add the following lines to your `~/.bashrc` script. Make sure to fill in your
PyTorch fork URL and absolute path to pytorch-dev-multienv, everything between
and including `[` and `]`.

```
# Configure pytorch-dev-multienv
export PYTORCH_FORK_URL="[ url to your pytorch fork on GitHub ]"
export PYTORCH_DEV_MULTIENV_PATH="[ absolute path to this repo ]"
source "$PYTORCH_DEV_MULTIENV_PATH/bashrc_pytorch-dev-multienv.sh"
```

Run `$ source .bashrc`, or open a new terminal before continuing.

## Create a new PyTorch development environment

Any time you need to create a new PyTorch development environment and clone,
run the following commands.

For simplicity, I recommend using the same name for the conda env and the
pytorch clone. I also recommend prefixing these names with `pytorch-`.

```
$ create-pytorch-conda-env [new conda env name]
$ activate-pytorch [new conda env name]
$ clone-pytorch [new pytorch clone name]
```

## Building PyTorch

Before building PyTorch, you must move into your clone and activate the
associated conda environment:

```
$ cd [pytorch clone]
$ activate-pytorch [pytorch conda env name]
```

Now you can build as usual. For instance:

```
$ python setup.py develop
```

Note: If you're using multiple different PyTorch clones, make sure to always
activate the correct associated conda environment.

## Other tools

### even-with-upstream

When you want to even your local and origin master branch with upstream/master,
run the following. This is useful when you need to rebase a branch.

```
$ even-with-upstream
```

### clean-pytorch

If you want to completely clean and even your clone with upstream/master, run
the following. Since this removes all local changes, you can rename the pytorch
repo clone afterwards, if you wish. This is useful if you want to repurpose a clone, instead of deleting it and rerunning `clone-pytorch`.

```
$ clean-pytorch
```
