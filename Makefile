.ONESHELL:

SHELL = /bin/bash
CONDA_ACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate yolov3;
CONDA_PATH = export PATH=$$PATH:$$(conda info --base)/envs/yolov3/bin
CONDA = $(CONDA_ACTIVATE) $(CONDA_PATH); export PATH=$$PATH:$$HOME/.local/bin

.PHONY: help
help: pull## show this help message
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m %s\n", $$1, $$2}'

pull: ## update git branch
	git pull

create: ## create conda env
	conda create -n yolov3 python=3.9
	$(CONDA)

install: pull  ## install requirements for the first time
	$(CONDA)
	echo $$PATH
	poetry
	
train_simple: pull ## train yolov3 model for the first time
	python train.py 
