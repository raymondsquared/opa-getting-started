.PHONY: install
install:
	cd plugin && curl -o ./opa-authorizer-1.4.0-all.jar https://github.com/StyraInc/opa-kafka-plugin/releases/download/v1.4.0/opa-authorizer-1.4.0-all.jar

.PHONY: build
build:
	opa build --bundle policies/ --output bundles/bundle.tar.gz

.PHONY: run-kafka
run-kafka:
	docker-compose up
