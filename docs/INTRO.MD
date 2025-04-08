# Tomsoir-monorepo

Bazel-Powered Full-Stack Monorepo Example

## Overview:
Tomsoir-monorepo is a minimalist full-stack project repository that combines application code, infrastructure configuration, and devops tooling in one place. It serves as an example of how to structure a monorepo for a multi-language, multi-component application with end-to-end support from development to deployment.

## Key Features:
* Full-Stack Support: Organizes front-end and back-end projects together, with support for multiple programming languages (TypeScript/JavaScript, Python, Go)​. This unified codebase allows you to manage web clients, services, and libraries in a single repository, promoting consistency across the stack.

* Infrastructure as Code: Integrates infrastructure configuration alongside the application code. Docker containerization, Kubernetes manifest generation/deployment, and Terraform scripts are included​, enabling consistent environments and easy deployment. This monorepo treats infrastructure as code, so you can version and deploy cloud resources and Kubernetes services from the same repo.

* Integrated Toolchain: Leverages Bazel for building and testing all components in a reproducible manner​. It also ties into modern devops tools – for example, Kubernetes for orchestration and Prometheus for monitoring – to demonstrate a seamless workflow from code to production. The repository is set up with continuous integration (CI) workflows and automation (e.g. dependency updates, code formatting, and testing), ensuring an efficient development pipeline out of the box.

## Purpose:
The tomsoir-monorepo is designed as a template or reference architecture for developers who want a single source of truth for their entire application stack. By co-locating front-end code, back-end services, and infrastructure definitions, it simplifies dependency management and deployment. The repository’s clean and modular structure makes it easy to extend or adapt for real-world projects, showcasing best practices in full-stack development and infrastructure management with a polished, efficient setup.
