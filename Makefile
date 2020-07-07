DB := pgql

DOCKER_USER := prakasa1904
DOCKER_REG_BUILD := godb-base
DOCKER_TAG_BUILD := latest

# ========================================
# Build base image for development mode
# Author: Prakasa <prakasa@devetek.com>
# ========================================
.PHONY: base-devimage
base-devimage:
	@docker build -f dev.Dockerfile -t $(DOCKER_USER)/$(DOCKER_REG_BUILD):$(DOCKER_TAG_BUILD) .
	@docker push $(DOCKER_USER)/$(DOCKER_REG_BUILD):$(DOCKER_TAG_BUILD)

# ========================================
# Running using docker environment DEVELOPMENT
# Author: Prakasa <prakasa@devetek.com>
# ========================================
.PHONY: run-dev
run-dev:
	# Validate selecting database engine, only support for mysql and pgql
ifeq ($(DB),)
	@ sh -c "Please use `make run-dev DB=mysql` OR `make run-dev DB=pgql` && exit 1"
endif
	@ test -f volume/$(DB)/volume || mkdir -p volume/$(DB)/volume
	@ test -f volume/$(DB)/restore || mkdir -p volume/$(DB)/restore
	@ docker-compose down --remove-orphans
	@ docker-compose up