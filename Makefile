live-image-amd64.hybrid.iso: 
	export BUILD_DIR="$(shell pwd)"
	docker run \
		--detach \
		--interactive \
		--tty \
		--privileged \
		--volume "$(BUILD_DIR)":/root/build \
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
	docker exec \
		--interactive \
		--tty \
		--privileged \
		--workdir /root/build \
		builder \
		bash -c "lb config \
			&& lb build"
