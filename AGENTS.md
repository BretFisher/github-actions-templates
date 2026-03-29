# AGENTS.md

This repository is a GitHub Actions template and reusable-workflow repo.
Most edits are YAML, Markdown, and a small sample Dockerfile.
There is no application runtime, package manager, or unit-test framework checked into this repository.

## Scope And Intent

- Treat this repo as documentation plus workflow templates.
- Prefer minimal, targeted edits that preserve template readability.
- Keep reusable workflows in `.github/workflows/reusable-*.yaml` generic.
- Keep example caller workflows in `templates/` and local test callers in `.github/workflows/call-local-*.yaml` aligned.
- Do not invent repo infrastructure that is not already present.

## Repository Layout

- `.github/workflows/reusable-*.yaml`: reusable workflows meant to be called from other repos.
- `.github/workflows/call-local-*.yaml`: local test callers for workflows in this repo.
- `.github/workflows/call-super-linter.yaml`: lint workflow for this repo.
- `templates/`: copyable workflow templates for downstream repositories.
- `.github/linters/`: shared linter configuration used by Super-Linter.
- `Dockerfile`: sample image used for Docker-related workflow examples.
- `README.md`: repository overview and usage notes.

## Source Of Truth

- Follow the existing YAML style in current workflow files before applying generic preferences.
- Treat `.github/linters/.yaml-lint.yml` as the main YAML formatting authority.
- Treat `.github/linters/.markdown-lint.yml` as the Markdown formatting authority.
- Treat `.github/linters/.hadolint.yaml` as the Dockerfile lint authority.
- There are no Cursor rules in `.cursor/rules/`.
- There is no `.cursorrules` file.
- There is no Copilot instruction file at `.github/copilot-instructions.md`.

## Build, Lint, And Test

### Reality Check

- There is no single `make`, `npm`, `pnpm`, `pytest`, or similar project entrypoint.
- There is no checked-in unit-test harness.
- The practical validation strategy is: lint changed files, optionally build the sample Dockerfile, and validate workflows through GitHub Actions.

### Useful Commands

Run these from the repository root.

Build the sample container:

```bash
docker build -t gha-templates-test .
```

Lint all YAML:

```bash
yamllint -c .github/linters/.yaml-lint.yml .
```

Lint all Markdown relevant to this repo:

```bash
markdownlint -c .github/linters/.markdown-lint.yml README.md AGENTS.md
```

Lint the Dockerfile:

```bash
hadolint --config .github/linters/.hadolint.yaml Dockerfile
```

Lint GitHub Actions workflow syntax:

```bash
actionlint
```

Lint GitHub Actions workflow security posture:

```bash
zizmor .
```

Lint a single YAML file:

```bash
yamllint -c .github/linters/.yaml-lint.yml path/to/file.yaml
```

Lint a single Markdown file:

```bash
markdownlint -c .github/linters/.markdown-lint.yml path/to/file.md
```

### Tests / Validation

- There is no dedicated local `test` command in this repo.
- The smallest meaningful repo-native validation unit is usually a single file lint.
- For workflow behavior, use the matching local caller workflow in `.github/workflows/call-local-*.yaml` when one exists.
- For reusable workflow changes, update the reusable file and its local caller or example caller together when needed.
- Validate behavior in GitHub Actions rather than claiming local execution coverage that the repo does not provide.
- For workflow security and hygiene, prefer running both `actionlint` and `zizmor .` after workflow edits.

### Single Test Guidance

- There is no unit-test-per-file command such as `pytest path::test_name` or `vitest file.test.ts` here.
- If the change is YAML-only, the closest equivalent of a single test is linting the one changed YAML file.
- If the change affects a reusable workflow, the closest equivalent of a single integration test is exercising the corresponding `call-local-*.yaml` workflow in GitHub Actions.
- If the change is GitHub Actions-specific, also run `actionlint` and review `zizmor` findings for the affected workflow.
- Do not fabricate `act`, `actionlint`, or other tooling commands unless the user explicitly wants to add and maintain them.

## Workflow Editing Rules

- Preserve the distinction between reusable workflows, template callers, and local test callers.
- Keep comments that explain why a setting exists; this repo uses instructional comments intentionally.
- Keep `permissions` explicit in workflows. Existing examples emphasize this.
- Keep concurrency blocks when they already exist.
- Do not convert reusable workflows into direct-use workflows unless explicitly requested.
- Prefer updating both the template and the local test workflow when they mirror each other.

## YAML Style

- Start workflow and template YAML files with `---` when the existing file does.
- Use two-space indentation.
- Keep sequence indentation consistent; `.yaml-lint.yml` requires `indent-sequences: true`.
- Do not worry about line length; YAML line-length linting is disabled.
- Use Unix newlines.
- Avoid trailing spaces.
- Duplicate keys are never acceptable.
- Comments and comment indentation are intentionally not lint-enforced, but keep them readable.

## Markdown Style

- Long lines are acceptable; Markdown line-length is set very high.
- Keep headings and lists simple and readable.
- Prefer short explanatory sections over dense prose.
- Preserve instructional links and references when updating README-style content.

## Dockerfile Style

- Follow existing simple, example-oriented Dockerfile patterns.
- Hadolint runs with `failure-threshold: warning`.
- Several pinning-related hadolint rules are intentionally ignored repo-wide.
- Prefer inline ignore comments only when a new exception is truly needed.

## Naming Conventions

- Reusable workflows: `reusable-<purpose>.yaml`.
- Local workflow tests: `call-local-<purpose>.yaml`.
- Template callers: `templates/call-<purpose>.yaml`.
- Job IDs and job names should be descriptive and operational, not abstract.
- Input and secret names should stay kebab-case to match current workflow conventions.
- Keep names aligned between `workflow_call.inputs`, `workflow_call.secrets`, and the corresponding `with` or `secrets` usage sites.

## Imports, Types, And Expressions

- Traditional code imports do not apply to most files in this repo.
- The closest equivalent is `uses:` references in workflow YAML.
- Keep action and reusable-workflow references explicit and readable.
- Do not silently retarget external `uses:` references to different repositories or branches without reason.
- Pin ordinary action steps to a full commit SHA when practical. This repo uses `gh pin-actions workflows --overwrite` for that.
- Caller workflows may intentionally reference reusable workflows by branch, especially in templates and teaching examples, where readability and customizability matter more than pinning the caller reference.
- Prefer existing GitHub Actions expression style using `${{ ... }}`.
- Match the existing input types exactly in reusable workflows: `string` vs `boolean` matters.
- Keep defaults close to their input definitions.

## Error Handling And Safety

- Prefer workflow defaults that are safe and unsurprising.
- Document required secrets and required inputs near where they are declared.
- Preserve comments that explain failure behavior such as `continue-on-error` or `exit-code`.
- When changing scan workflows, be explicit about whether findings should fail the job or only report.
- Avoid hidden behavior changes in security-sensitive workflows.
- In reusable workflows, `workflow_call` secrets are an accepted pattern in this repo even if `zizmor` prefers environment-scoped secrets.
- If a `zizmor` warning is intentionally accepted in this teaching repo, prefer a narrow inline `# zizmor: ignore[...]` comment with a short explanation.

## Editing Strategy For Agents

- Read the matching reusable workflow, local test workflow, template, and README section before editing.
- Keep diffs small and instructional.
- Preserve placeholder comments like `FIXME` when they are part of the template story.
- Do not remove sample values unless replacing them with better sample values.
- Avoid broad reformatting of untouched YAML.
- Do not add new dependencies, package managers, or CI systems unless requested.

## Verification Expectations

- At minimum, lint every changed YAML, Markdown, or Dockerfile file relevant to the edit.
- For workflow files, also run `actionlint` and `zizmor .` when available.
- If Docker-related files changed, build the sample Dockerfile when practical.
- If workflow behavior changed, state clearly whether validation was limited to static linting or also exercised in GitHub Actions.
- If a requested verification path is unavailable locally, say so plainly.

## What Not To Assume

- Do not assume Node, Python, Go, Rust, or Make tooling exists here.
- Do not assume there is a local runner for GitHub Actions.
- Do not assume a missing command should be added just because another repo would have it.
- Do not replace educational comments with terse production-only formatting.

## Agent Output Expectations

- When reporting commands, distinguish between checked-in repo commands and optional external tools.
- When asked for a single-test command, explain that the repo has no unit-test harness and give the closest real validation command instead.
- Keep guidance specific to YAML workflows, Markdown docs, and the sample Dockerfile.
