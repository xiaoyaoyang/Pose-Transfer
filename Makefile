NAME = moda-pose-transfer
GIT_HASH = $(shell git rev-parse --short HEAD)

ifndef TAG  # if kwarg `TAG` not specified
	TAG = $(GIT_HASH)
endif

PORT_HOST = 5000

# Local Targets

docker_local_args := \
	--rm \
	--volume ~/.aws:/root/.aws \
    --volume ~/Workspace/Pose-Transfer/fashion_data:/mnt/fashion_data

build:
	docker build -t ${NAME}:${TAG} .

run-local:
	docker run -it \
	    $(docker_local_args) \
		-p ${PORT_HOST}:${PORT_HOST} \
		${NAME}:${TAG}