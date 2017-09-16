SHELL=/bin/bash

ifndef ELASTIC_VERSION
ELASTIC_VERSION := $(shell awk 'BEGIN { FS = "[= ]" } /^ELASTIC_VERSION=/ { print $$2 }' .env)
endif
export ELASTIC_VERSION

up:
	docker-compose up -d

down:
	docker-compose down

clean:
	docker-compose down -v

restart:
	docker-compose restart
