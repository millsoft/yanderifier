#!/bin/bash

# fail the script if some problem occures:

# install miniconda
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
APP_PATH=$SCRIPT_PATH/../..

CONDA_BIN_PATH=~/miniconda3/condabin
#CONDA=$CONDA_BIN_PATH/conda
CONDA=conda

# install fomm?
preCheck(){
	export HAS_ERRORS=0
	echo "Checking installation requirments..."
	test -d $CONDA_BIN_PATH || echo 'Conda not installed?' && return -1
	test -f $CONDA || echo 'Conda binary not found?' && return -1

	return 0
}

installMiniconda(){
	echo "Installing Miniconda..."
}

installFomm(){
	mkdir fomm
	cd fomm
	wget https://github.com/dunnousername/first-order-model/releases/download/v1.0.0/fomm.zip
	unzip fomm.zip
}


installCheckpoint(){
	cd $BASE/yanderify
	wget https://github.com/dunnousername/yanderifier/releases/download/model/checkpoint.tar
}

postInstall(){
	cd $APP_PATH
	$CONDA activate
	$CONDA env create -f environment.yml || echo miniconda already installed
	$CONDA activate yanderify
}

#preCheck
postInstall

#installMiniconda
#installFomm
#installCheckpoint

