# opa-getting-started

The Open Policy Agent (OPA, pronounced “oh-pa”) is an open source, general-purpose policy engine that unifies policy enforcement across the stack.

https://www.openpolicyagent.org/docs/latest/
https://open-policy-agent.github.io/gatekeeper/website/

[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/mit)

Read this page to learn about the core concepts in OPA’s policy language (Rego) as well as how to download, run, and integrate OPA.

## 🚀 Features

- **OPA**: OPA decouples policy decision-making from policy enforcement. When your software needs to make policy decisions it queries OPA and supplies structured data as input. OPA accepts arbitrary structured data as input.
- **OPA Gatekeeper**: OPA Gatekeeper integrates OPA with Kubernetes to enforce policies and ensure compliance within Kubernetes clusters. It acts as a policy controller, using native Kubernetes Custom Resource Definitions (CRDs) to define and enforce policies.
- **HTTP API Authorization**: Enforcing access control policies by evaluating incoming requests against defined rules within an OPA policy. This is typically achieved by integrating OPA into the API gateway or backend service. OPA examines request headers, payloads, and other relevant data to determine whether the user or application is authorized to perform the requested action.
- **WSO 2 API Gateway**: WSO2 API Manager is a comprehensive open-source platform that includes an API Gateway component to manage, secure, and publish APIs. It offers features such as API creation, deployment, versioning, and lifecycle management.
- **Terraform**: Terraform is an infrastructure as code (IaC) tool used to define and provision infrastructure resources across multiple cloud providers and on-premises environments.
- **Kafka**: Distributed streaming platform designed to handle high-throughput, real-time data feeds. It excels at capturing data from various sources, storing it persistently, and delivering it to multiple consumers.

## 🧰 Prerequisites

- Minikube
- OPA
- [OPA GateKeeper](https://open-policy-agent.github.io/gatekeeper/website/)
- [OPA for HTTP API](https://www.openpolicyagent.org/docs/latest/http-api-authorization/)
- [WSO2 Api Gateway](https://apim.docs.wso2.com/en/4.1.0/design/api-security/opa-validation/overview/)
- [Terraform](https://www.openpolicyagent.org/docs/latest/terraform/)
- [Kafka](httphttps://www.openpolicyagent.org/docs/latest/kafka-authorization/)

## 🛠 Installation

```bash
# Install dependencies
make k8s__install
make app__install
make api-gateway__install
make terraform__install
make kafka__install
```

## 📚 Usage

### App Commands

```bash
make k8s__run-k8s                       # Start the kubernetes (minikube)
make k8s__install                       # Install OPA Gatekeeper
make k8s__run-constraints               # Create templates and constraints
make k8s__run-bad-resources             # Try applying bad resources
make k8s__run-good-resources            # Try applying good resources

make app__install                       # Install app
make app__run-opa                       # Run OPA server
make app__run-app                       # Run JavaScript web API server
make app__test                          # Run OPA test

make api-gateway__install               # Install app
make api-gateway__run-opa               # Run OPA server
make api-gateway__run-api-gateway       # Run WSO2 API Gateway
make api-gateway__test                  # Run OPA test

make terraform_install                  # Setup Terraform
make terraform_run                      # Initiate Terraform plan
make terraform_test                     # Run OPA tests

make kafka_install                      # Setup Kafka
make kafka__build                       # Build OPA policies
make kafka__run-kafka                   # Run Kafka
```

## 🤝 Contributing

We welcome contributions to Kubernetes Deployment Strategy! Please see the [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to submit pull requests, report issues, and suggest improvements.

## 📜 License

This repo is open-source software licensed under the [MIT license](http://www.apache.org/licenses/mit).

## 🙏 Acknowledgements

- [Kubernetes](https://kubernetes.io/) for the amazing framework
- [OPA](https://www.openpolicyagent.org) also for the amazing framework
- All our contributors and supporters!

---

Made with ❤️ by the raymondsquared. Happy coding!
