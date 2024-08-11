.PHONY: install-opa
install-opa:
	brew install opa

.PHONY: install-wso2
install-wso2:
	docker pull wso2/wso2am:4.3.0

.PHONY: install
install: install-opa install-wso2

.PHONY: run-opa
run-opa:
	opa run --server authz.rego

.PHONY: run-api-gateway
run-api-gateway:
	docker run -it -p 9443:9443 -p 8243:8243 wso2/wso2am:4.3.0

.PHONY: test-opa
test-opa:
	opa test authz_test.rego authz.rego -v

.PHONY: test
test: test-opa
