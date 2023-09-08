# GitHub Actions DevOps Examples

[![Lint Code Base](https://github.com/BretFisher/github-actions-templates/actions/workflows/call-super-linter.yaml/badge.svg)](https://github.com/BretFisher/github-actions-templates/actions/workflows/call-super-linter.yaml)

These workflow examples comprise three parts:

- `.github/workflows/reusable-*.yaml` - Designed to be reusable as a "called" workflow, and has a `workflow_call` event in it. They would exist in a central repository and called by other repositories. The central repository needs to be `public`, `internal`, or `private` and enabled for GitHub Actions sharing in repository Settings.
- `templates/call-*.yaml` - these are the "calling" templates that you would copy to all your code and IaC repositories. Each of their jobs has the special `uses: <github-path>` to point to the reusable workflow.
- `.github/workflows/call-local*.yaml` - For testing. Calls a local workflow in the same directory. ProTip: Make tests for your reusable workflows! Either in the same repository as this one shows, or from a separate repository full of tests. You'll thank me later.

## Examples

- [`.github/dependabot.yml`](.github/dependabot.yml) will make PRs for version updates to your Actions *and* Dockerfiles.
- [`.github/linters/`](.github/linters/) stores linter configs used by Super-Linter. ProTip: symlink these to the preferred location to use the same linters locally.
- [`templates/call-super-linter.yaml`](templates/call-super-linter.yaml) is a workflow that calls Super-Linter, which I'm storing the full reusable workflow in [bretfisher/super-linter-workflow](https://github.com/BretFisher/super-linter-workflow).
- [`templates/call-docker-build.yaml`](templates/call-docker-build.yaml) is a workflow that calls a Docker build (awesomesauce!), which I'm storing the full reusable workflow in [bretfisher/docker-build-workflow](bretfisher/docker-build-workflow).
- [`templates/call-docker-build-promotion.yaml`](templates/call-docker-build-promotion.yaml) is an advanced workflow that calls a build workflow on PR, and then on merge it will call that workflow with different values and [also creates a GitOps-style PR](.gitub/workflows/reusable-gitops-pr.yaml) to deploy the new image to a Kubernetes cluster.
- [`templates/call-snyk-scan-image.yaml`](templates/call-snyk-scan-image.yaml) is a workflow that calls a [Snyk](https://github.com/snyk/cli) scan [in this repository](.github/workflows/reusable-snyk-scan-image.yaml).
- [`templates/call-trivy-scan-image.yaml`](templates/call-trivy-scan-image.yaml) is a workflow that calls a reusable [Trivy](https://github.com/marketplace/actions/aqua-security-trivy) scan [in this repository](.github/workflows/reusable-trivy-scan-image.yaml).

## This repository is part of my examples on GitHub Actions

- (you are here) [bretfisher/github-actions-templates](https://github.com/BretFisher/github-actions-templates) - Main reusable templates repository
- [bretfisher/super-linter-workflow](https://github.com/BretFisher/super-linter-workflow) - Reusable linter workflow
- [bretfisher/docker-build-workflow](https://github.com/BretFisher/docker-build-workflow)- Reusable docker build workflow
- [bretfisher/[docker-ci-automation](https://github.com/BretFisher/docker-ci-automation) - Step-by-step video and example of a Docker CI workflow
- [My full list of container examples and tools](https://github.com/bretfisher)

## More reading

- [Docker Build/Push Action advanced examples](https://github.com/docker/build-push-action/tree/master/docs/advanced)
- [My full list of container examples and tools](https://github.com/bretfisher)

## 🎉🎉🎉 Join my cloud native DevOps community 🎉🎉🎉

- [My Cloud Native DevOps Discord server](https://devops.fan)
- [My weekly YouTube Live show](https://www.youtube.com/@BretFisher)
- [My weekly newsletter](https://www.bretfisher.com/newsletter)
- [My courses and coupons](https://www.bretfisher.com/courses)
