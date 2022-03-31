# Docker GitHub Actions DevOps Examples

[![Lint Code Base](https://github.com/BretFisher/github-actions-templates/actions/workflows/call-super-linter.yaml/badge.svg)](https://github.com/BretFisher/github-actions-templates/actions/workflows/call-super-linter.yaml)

See this repositories [`.github`](.github) directory for examples on linters, workflows, and dependabot.

Some workflows are reusable or are calling other reusable workflows in other repositories.

I name workflows depending on how they are used:

* `reusable-*.yaml` - the workflow is designed to be reusable as a "called" workflow, and have a `workflow_call` event in them. They would exist in a central repository that is either `public` or `internal` and called by other repositories.
* `call-*.yaml` - this calls a reusable workflow that lives in other repositories or files with `uses: <github-path>`.
* Any other workflows are just designed to run inside a repository directly.

This repository is part of a group of my samples on GitHub Actions:

* (you are here) [bretfisher/github-actions-templates](https://github.com/BretFisher/github-actions-templates) - Main repo
* [bretfisher/super-linter-workflow](https://github.com/BretFisher/super-linter-workflow) - Reusable linter workflow
* [bretfisher/docker-build-workflow](https://github.com/BretFisher/docker-build-workflow)- Reusable docker build workflow
* [bretfisher/allhands22](https://github.com/BretFisher/github-actions-templates) - Step by step example of a Docker workflow
