.ONESHELL:

.ONESHELL:

SHELL = /bin/bash
CONDA_ACTIVATE = source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate

install:
	conda create -n yolov3 python=3.9
	$(CONDA_ACTIVATE) yolov3


