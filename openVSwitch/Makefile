.PHONY: all clean clean-docker clean-network install setup-ovs build-docker launch-docker status start


SHELL := /bin/bash
BRIDGE_NAME := ovs-br1
INTERFACE := eth0
CONTAINER_PAIRS ?= 5

all: install build-docker
start: setup-ovs launch-docker status
clean: clean-docker clean-network

install:
# Collect required OVS software
	sudo apt-get install openvswitch-switch

setup-ovs:
# Create new OVS network
	sudo ovs-vsctl add-br $(BRIDGE_NAME)

build-docker:
# Build receiver image
	docker build -t receiver -f receiver/Dockerfile receiver
	docker build -t sender -f sender/Dockerfile sender


launch-docker:
	@for ((i = 1; i <= $(CONTAINER_PAIRS); i++)); do \
		docker run -itd --name receiver$$i --privileged \
		--volume="./results:/results:rw" -e PAIR_NUM=$$i receiver; \
		docker run -itd --name sender$$i --privileged \
		--volume="./results:/results:rw" -e PAIR_NUM=$$i sender; \
		sudo ovs-docker add-port "$(BRIDGE_NAME)" "${INTERFACE}" receiver$$i; \
		sudo ovs-docker add-port "$(BRIDGE_NAME)" "${INTERFACE}" sender$$i; \
	done


status:
	sudo ovs-vsctl show
	docker ps -a
	

clean-docker:
# Remove all containers
	docker stop $$(docker ps -q) || true
	yes | docker container prune

clean-network:
# Remove OVS network
	sudo ovs-vsctl list-ports $(BRIDGE_NAME) | xargs -r -I {} sudo ovs-vsctl del-port $(BRIDGE_NAME) {}
	sudo ovs-vsctl del-br $(BRIDGE_NAME)


