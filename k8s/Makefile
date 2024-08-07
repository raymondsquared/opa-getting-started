.PHONY: run-k8s
run-k8s:
	minikube start --driver=docker

.PHONY: k8s-list
k8s-list:
	kubectl config get-clusters

.PHONY: stop-k8s
stop-k8s:
	minikube stop

.PHONY: pre-install-opa-gatekeeper
pre-install-opa-gatekeeper:
	kubectl create clusterrolebinding cluster-admin-binding \
		--clusterrole cluster-admin \
		--user cluster-admin
	helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts

.PHONY: install-opa-gatekeeper
install-opa-gatekeeper:
	helm install gatekeeper/gatekeeper --name-template=gatekeeper --namespace gatekeeper-system --create-namespace

.PHONY: run-constraint-templates
run-constraint-templates: 
	kubectl apply -f constraint-templates/k8srequiredlabels_template.yaml

.PHONY: run-constraints
run-constraints: run-constraint-templates
	kubectl apply -f constraints/all_ns_must_have_raymond.yaml

.PHONY: run-bad-resources
run-bad-resources: run-constraints
	kubectl apply -f resources/bad_ns.yaml

.PHONY: run-good-resources
run-good-resources: run-constraints
	kubectl apply -f resources/good_ns.yaml

