NAME:=jupyter-notebook
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

build:
	docker build -t jupyter-notebook .

run: stop
	mkdir -p work
	docker run \
	-p 8888:8888 \
	--mount type=bind,source=$(ROOT_DIR)/work,target=/home/jovyan/work \
	--name $(NAME) \
	jupyter-notebook

stop:
	docker rm -f $(NAME)
	
