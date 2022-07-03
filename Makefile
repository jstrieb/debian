live-image-amd64.hybrid.iso: container
	docker exec \
		--interactive \
		--tty \
		--privileged \
		--workdir /root/build \
		builder \
		bash -c "lb config \
			&& lb build"

.PHONY: container
container:
	-docker kill builder
	sleep 5  # Wait for the container to terminate
	docker run \
		--rm \
		--detach \
		--interactive \
		--tty \
		--privileged \
		--volume "$(shell pwd)":/root/build \
		--name builder \
		debian:latest \
		sleep infinity
	docker exec \
		--interactive \
		--tty \
		--privileged \
		--workdir /root/build \
		builder \
		bash -c "apt update \
			&& apt install --yes live-build fdisk"

