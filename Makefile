VERSION=$(shell git describe --tags --always)

.PHONY: lint
# lint files
lint:
	flutter format . --fix

.PHONY: generate
generate:
	flutter pub run build_runner build

.PHONY: build
# build all target
build: build-web build-win

.PHONY: build-win
# build windows target
build-win:
	flutter build windows

.PHONY: build-web
# build web target
build-web:
	flutter build web

# show help
help:
	@echo ''
	@echo 'Usage:'
	@echo ' make [target]'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
	helpMessage = match(lastLine, /^# (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 2, RLENGTH); \
			printf "\033[36m%-22s\033[0m %s\n", helpCommand,helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
