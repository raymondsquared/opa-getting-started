.PHONY: install-terraform
install-terraform:
	brew tap hashicorp/tap
	brew install hashicorp/tap/terraform

.PHONY: install
install: install-terraform
	cd good && terraform init
	cd bad && terraform init

.PHONY: run-good
run-good:
	cd good && terraform plan --out tfplan.binary
	cd good && terraform show -json tfplan.binary > tfplan.json

.PHONY: run-bad
run-bad:
	cd bad && terraform plan --out tfplan.binary
	cd bad && terraform show -json tfplan.binary > tfplan.json

.PHONY: run
run: run-good run-bad

.PHONY: test-good
test-good:
	cd good && opa exec --decision terraform/allow --bundle ../policies/ tfplan.json

.PHONY: test-bad
test-bad:
	cd bad && opa exec --decision terraform/allow --bundle ../policies/ tfplan.json

.PHONY: test
test: test-good test-bad
