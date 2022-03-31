# Docker GitHub Actions DevOps Examples

[![Lint Code Base](https://github.com/BretFisher/github-actions-templates/actions/workflows/call-super-linter.yaml/badge.svg)](https://github.com/BretFisher/github-actions-templates/actions/workflows/call-super-linter.yaml)
[![Trivy CVE Dependency Scanner](https://github.com/BretFisher/github-actions-templates/actions/workflows/reusable-trivy-scan-image.yaml/badge.svg)](https://github.com/BretFisher/github-actions-templates/actions/workflows/reusable-trivy-scan-image.yaml)
[![Build and Push Image](https://github.com/BretFisher/github-actions-templates/actions/workflows/call-docker-build.yaml/badge.svg)](https://github.com/BretFisher/github-actions-templates/actions/workflows/call-docker-build.yaml)

See this repositories [`.github`](.github) directory for examples on linters, workflows, and dependabot.

Some workflows are reusable or are calling other reusable workflows in other repositories.

I name workflows depending on how they are used:

* `reusable-*.yaml` - the workflow is designed to be reusable as a "called" workflow, and have a `workflow_call` event in them. They would exist in a central repository that is either `public` or `internal` and called by other repositories.
* `call-*.yaml` - this calls a reusable workflow that lives in other repositories with `uses: <github-path>`.
* Any other workflows are just designed to run inside a repository directly.

This repo is part of a group of my sample repos on GitHub Actions:

* (you are here) [bretfisher/github-actions-templates](https://github.com/BretFisher/github-actions-templates) - Main repo
* [bretfisher/super-linter-workflow](https://github.com/BretFisher/super-linter-workflow) - Reusable linter workflow
* [bretfisher/docker-build-workflow](https://github.com/BretFisher/docker-build-workflow)- Reusable docker build workflow
