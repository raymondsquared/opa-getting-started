# opa-getting-started

The Open Policy Agent (OPA, pronounced “oh-pa”) is an open source, general-purpose policy engine that unifies policy enforcement across the stack.

https://www.openpolicyagent.org/docs/latest/
https://open-policy-agent.github.io/gatekeeper/website/

[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/mit)

Read this page to learn about the core concepts in OPA’s policy language (Rego) as well as how to download, run, and integrate OPA.

## 🚀 Features

- **OPA**: OPA decouples policy decision-making from policy enforcement. When your software needs to make policy decisions it queries OPA and supplies structured data as input. OPA accepts arbitrary structured data as input.
- **OPA Gatekeeper**: OPA Gatekeeper integrates OPA with Kubernetes to enforce policies and ensure compliance within Kubernetes clusters. It acts as a policy controller, using native Kubernetes Custom Resource Definitions (CRDs) to define and enforce policies.

## 🧰 Prerequisites

- Minikube
- OPA
- [OPA GateKeeper](https://open-policy-agent.github.io/gatekeeper/website/)
- [OPA for HTTP API](https://www.openpolicyagent.org/docs/latest/http-api-authorization/)
- [WSO2 Api Gateway](https://apim.docs.wso2.com/en/4.1.0/design/api-security/opa-validation/overview/)
- [Terraform](https://www.openpolicyagent.org/docs/latest/terraform/)

## 🛠 Installation

```bash
# Install dependencies
make k8s__install
make app__install
make api-gateway__install
make terraform__install
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

make terraform_install                  # Install app
make terraform_run                      # Initiate Terraform plan
make terraform_test                     # Run OPA tests
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
